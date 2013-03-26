using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO.Ports;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.Xml;


namespace bjl_sensernetwork
{


    class ContainerDataStruct
    {

        private int id;
        private Dictionary<string,senserDataStruct> data;
        private int isOpen = 0;
        private int timeInterval = 1000;   //单位毫秒，默认1s

        public int TimeInterval
        {
            get { return timeInterval; }
            set { timeInterval = value; }
        }


        public int Id
        {
            get { return id; }
            set { id = value; }
        }
        internal Dictionary<string,senserDataStruct> Data
        {
            get { return data; }
            set { data = value; }
        }
        public int IsOpen
        {
            get { return isOpen; }
            set { isOpen = value; }
        }

    }

    class senserDataStruct
    {
        public senserDataStruct(int type,double data)
        {
         
            this.type = type;
            this.data = data;
        }

        private int type;  //senser type
        private double data;

        public int Type
        {
            get { return type; }
            set { type = value; }
        }
        public double Data
        {
            get { return data; }
            set { data = value; }
        }
    }

    class Program
    {
        //socket 变量
        static string _cmdIP = "19.168.1.1";
        static int _cmdPort = 1233;

        static string _sendDataIP = "19.168.1.1";
        static int _sendDataPort = 3213;

        static Socket clientSocket;
        static Socket serverCMDsocket;

       

        //存储数据
        static Dictionary<string, ContainerDataStruct> _senserData = new Dictionary<string, ContainerDataStruct>();
        static XmlDocument xmlCMD = new XmlDocument();
        static XmlDocument xmlDATA = new XmlDocument();


        static int int_timer = 0;   //用来计时，看看多久发出去
        static int int_minTime = 500;   //计时器的最小单位


        static SerialPort _serialPort;
        static bool _continue;      //控制读写串口进程是否关闭

        //全局变量定义结束



        static void Main(string[] args)
        {
           
            StringComparer stringComparer = StringComparer.OrdinalIgnoreCase;
            Thread readThread = new Thread(Read);              //听串口线程
            Thread listenThread = new Thread(listenSocket);   //听命令socket线程
    

            // Create a new SerialPort object with default settings.
            _serialPort = new SerialPort();
             //Allow the user to set the appropriate properties.
            //_serialPort.PortName = SetPortName(_serialPort.PortName);           //端口名   COM1
            //_serialPort.BaudRate = SetPortBaudRate(_serialPort.BaudRate);       //波特率   9600
            //_serialPort.Parity = SetPortParity(_serialPort.Parity);             //校验     None
            //_serialPort.DataBits = SetPortDataBits(_serialPort.DataBits);       //数据位   8
            //_serialPort.StopBits = SetPortStopBits(_serialPort.StopBits);       //停止位   One
            //_serialPort.Handshake = SetPortHandshake(_serialPort.Handshake);    //握手协议 None

            // Set the read/write timeouts
            _serialPort.ReadTimeout = 5000;
            _serialPort.WriteTimeout = 5000;



            //开启串口，开启串口读取线程
            _serialPort.Open();
            _continue = true;
            readThread.Start();



            //开启读socket命令的线程
            listenThread.Start();



            //开启发送数据线程
            System.Threading.TimerCallback tc = new System.Threading.TimerCallback(sendSocket);
            //从下一1000ms开始，每隔500ms调用代理tc对应的方法
            System.Threading.Timer tmr = new System.Threading.Timer(tc, null, 0, int_minTime);
          


            readThread.Join();
            listenThread.Join();
            tmr.Dispose();
            _serialPort.Close();

        }

 
        //Listen————听命令socket通信
        public static void listenSocket()
        {
            Byte[] outBuffer = new Byte[1024];
            IPEndPoint ipep = new IPEndPoint(IPAddress.Parse(_cmdIP), _cmdPort);
            serverCMDsocket = new Socket(ipep.AddressFamily, SocketType.Stream, ProtocolType.Tcp);

            try
            {
                serverCMDsocket.Connect(ipep);
                Console.WriteLine("连上了cmd");
                Byte[] inBuffer = new Byte[1024];

                string message = "helloworld";

                //发送消息
                outBuffer = Encoding.UTF8.GetBytes(message);
                serverCMDsocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);
                Console.WriteLine("发好消息了");

                while (true)
                {


                    int receiveN = serverCMDsocket.Receive(inBuffer);//接收
                    if (receiveN != 0)
                    {
                        string cmdMsg = Encoding.UTF8.GetString(inBuffer, 0, receiveN);
                        //处理接受到的xml
                        Console.WriteLine(cmdMsg);
                        xmlCMD.LoadXml(cmdMsg);


                        //XmlNodeList nodeList = xmlCMD.SelectSingleNode("Configuration").ChildNodes;//获取bookstore节点的所有子节点
                        XmlNode xmlroot = xmlCMD.SelectSingleNode("Configuration");
                        XmlElement result = (XmlElement)xmlroot;
                        if (result.GetAttribute("Operation") == "open")
                        {
                            //开启数据监控的命令  open命令
                            //open命令
                            //如果没有这个箱子call back failure
                            //如果有，则更新时间间隔  call back

                            if (_senserData.ContainsKey(result.GetAttribute("ContainerId")) && _senserData[result.GetAttribute("ContainerId")].IsOpen==0)
                            {
                                //有数据
                                _senserData[result.GetAttribute("ContainerId")].IsOpen = 1;
                                _senserData[result.GetAttribute("ContainerId")].TimeInterval = Int32.Parse(result.GetAttribute("Frequency"));

                                XmlDocument doc = new XmlDocument();
                                XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                                doc.AppendChild(dec);
                                //创建一个根节点（一级）
                                XmlElement root = doc.CreateElement("Result");
                                root.InnerText = "success";
                                doc.AppendChild(root);
                                message = doc.InnerXml;

                                //发送消息
                                outBuffer = Encoding.UTF8.GetBytes(message);
                                serverCMDsocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);

                            }
                            else
                            {
                                //没有数据返回失败
                                XmlDocument doc = new XmlDocument();
                                XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                                doc.AppendChild(dec);
                                //创建一个根节点（一级）
                                XmlElement root = doc.CreateElement("Result");
                                root.InnerText = "failure";
                                doc.AppendChild(root);
                                message = doc.InnerXml;

                                //发送消息
                                outBuffer = Encoding.UTF8.GetBytes(message);
                                serverCMDsocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);
                            }

                        }


                        else if (result.GetAttribute("Operation") == "close")
                        {
                            //关闭数据监控的命令  close命令
                              //最后一个箱子则关闭数据socket通道，关掉该箱子对应的线程  call back
                              //  已经关闭的，或者没有的 call back 失败
                            if (_senserData.ContainsKey(result.GetAttribute("ContainerId")) && _senserData[result.GetAttribute("ContainerId")].IsOpen != 0)
                            {
                                //有数据
                                _senserData[result.GetAttribute("ContainerId")].IsOpen = 0;
                                _senserData[result.GetAttribute("ContainerId")].TimeInterval = 1000;

                                XmlDocument doc = new XmlDocument();
                                XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                                doc.AppendChild(dec);
                                //创建一个根节点（一级）
                                XmlElement root = doc.CreateElement("Result");
                                root.InnerText = "success";
                                doc.AppendChild(root);
                                message = doc.InnerXml;

                                //发送消息
                                outBuffer = Encoding.UTF8.GetBytes(message);
                                serverCMDsocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);

                            }
                            else
                            {
                                //没有数据返回失败
                                XmlDocument doc = new XmlDocument();
                                XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                                doc.AppendChild(dec);
                                //创建一个根节点（一级）
                                XmlElement root = doc.CreateElement("Result");
                                root.InnerText = "failure";
                                doc.AppendChild(root);
                                message = doc.InnerXml;

                                //发送消息
                                outBuffer = Encoding.UTF8.GetBytes(message);
                                serverCMDsocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);
                            }
                        }

                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                //连接有问题
            } 
        }



        //Send————发送数据socket
        public static void sendSocket(object obj)
        {

            //增加计时器
            int_timer += int_minTime;

            
            //连接socket
            if (!clientSocket.Connected)
            {
                IPEndPoint ipep = new IPEndPoint(IPAddress.Parse(_sendDataIP), _sendDataPort);
                clientSocket = new Socket(ipep.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
                try
                {
                    clientSocket.Connect(ipep);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e.Message);
                }
            }

        
            //生成发送xml
            Byte[] outBuffer = new Byte[1024];
            try
            {
               
                foreach (KeyValuePair<string, ContainerDataStruct> item in _senserData)
                {
                    //遍历每一个箱子
                    if (item.Value.IsOpen != 0  && int_timer % item.Value.TimeInterval == 0 && item.Value.Data.Count!=0)
                    {

                        XmlDocument doc = new XmlDocument();
                        XmlDeclaration dec = doc.CreateXmlDeclaration("1.0", "UTF-8", null);
                        doc.AppendChild(dec);
                        //创建一个根节点（一级）
                        XmlElement root = doc.CreateElement("sensersDate");
                        doc.AppendChild(root);

                        foreach (KeyValuePair<string, senserDataStruct> item_senser in item.Value.Data)
                        {

                            //创建节点（二级）
                            XmlNode node = doc.CreateElement("Status");

                            //创建节点（三级）
                            XmlElement element1 = doc.CreateElement("ContainerId");
                            element1.InnerText = item.Value.Id.ToString();
                            node.AppendChild(element1);

                            string senserType = "miss";
                            switch ( item_senser.Value.Type.ToString())
                            {
                                case "1": senserType = "Humidity"; break;       //湿度
                                case "2": senserType = "Temperature"; break;    //温度
                                case "3": senserType = "Light"; break;          //光
                                case "4": senserType = "Flux"; break;           //流量
                                case "5": senserType = "BloodPressure"; break;  //血压
                                case "6": senserType = "Altitude"; break;       //海拔高度
                                case "7": senserType = "Hoare"; break;          //磁场
                                case "8": senserType = "Rain"; break;           //雨滴
                            }

                            XmlElement element2 = doc.CreateElement(senserType);
                            element1.InnerText = item_senser.Value.Data.ToString();
                            node.AppendChild(element2);
                      
                            root.AppendChild(node);
                       
                        }

                        string message = doc.InnerXml;

                        //发送消息
                        outBuffer = Encoding.UTF8.GetBytes(message);
                        clientSocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);

                    }

                    Console.WriteLine("发好消息了");

                }
                
                
                
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
            }
           

        }



        //Read————读取串口输出————线程
        public static void Read()
        {

            //存储数据
            Byte[] tempdata = null;
            int state = 0;   //1:第一位核对完毕55   2：第二位核对完毕36  3：第三位核对完毕48  其他表示读取的位数
            int dataLength  = 0;

            Byte[] outBuffer = null;
            while (_continue)
            {
                //Console.WriteLine("read");
                try
                {

                    outBuffer = new Byte[1024];

                    int length = _serialPort.BytesToRead;

                    if (length > 0 && length <= 1024)
                    {
                        
                        _serialPort.Read(outBuffer, 0, length);


                        for (int i = 0; i < length; i++)
                        {
                        
                            if (state == 0)
                            {
                                if (outBuffer[i] == 55)
                                {
                                    state++;
                                }
                            }
                            else if (state == 1)
                            {
                                if (outBuffer[i] == 36)
                                {
                                    state++;
                                }
                                else
                                {
                                    state = 0;
                                }
                            }
                            else if (state == 2)
                            {
                                if (outBuffer[i] == 48)
                                {
                                    state++;
                                }
                                else
                                {
                                    state = 0;
                                }
                            }
                            else if (state == 3)
                            {
                                dataLength = 16 * outBuffer[i];
                                state++;
                            }
                            else if (state == 4)
                            {
                                dataLength += outBuffer[i];
                                if (dataLength > 9)
                                {
                                    tempdata = new Byte[dataLength + 1 + 2 + 2];  //开辟数据段长度+验证位的长度,2个字节长度，2个字节硬件类型
                                    tempdata[0] = 36;
                                    tempdata[1] = 48;
                                    tempdata[2] = (Byte)(dataLength/16);
                                    tempdata[3] = outBuffer[i];
                                    state++;
                                }
                                else
                                {
                                    state = 0;
                                }
                            }
                            else if (state > 4 && state < dataLength + 6)
                            {
                                tempdata[state - 1] = outBuffer[i];
                                state++;
                                if (state == dataLength + 6)
                                {
                                    //最后一位验证位做验证
                                    if (checkData(tempdata) == 1)
                                    {
                                        //完成验证以后  存储新数据到传感器数据列表
                                        savaANDupdate(tempdata);
                                    }
                                }
                            }
                            else
                            {
                                state = 0;
                            }

                        }

                        //Console.WriteLine(length);

                    }

                    //int dataLength = int.Parse(outBuffer[3].ToString()) * 16 * 16 + int.Parse(outBuffer[4].ToString());
                    //_serialPort.Read(outBuffer, 5, dataLength + 10);
                    //string message = Encoding.ASCII.GetString(outBuffer).Trim();
                    //Console.WriteLine("result:" + message);
                    //发送消息
                    //outBuffer = Encoding.ASCII.GetBytes(cmd);
                    //clientSocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);

                }
                catch (TimeoutException) { }
            }
        }
        public static int checkData(Byte[] data)
        {
            int flag = 0;

            int countONE = data[0];
            for (int i = 1; i < data.Length-1; i++)
            {
                countONE = data[i] ^ countONE;
            }

            if (countONE == data[data.Length - 1])
            {
                flag = 1;
            }

            return flag;
        }
        public static void savaANDupdate(Byte[] data)
        {

            // 如果没有这个集装箱的信息，则创建新的containterData
            // 如果有的话，获取object（修改）
            ContainerDataStruct _container = null;
            int _containerID = data[8] * 16 + data[9];

            if (_senserData.ContainsKey( _containerID.ToString() ))
            {
                _container = _senserData[_containerID.ToString()];
            }
            else
            {
                _container = new ContainerDataStruct();
                _container.Id = _containerID;
            }


            if ((data[4] * 16 + data[5]) == 1)
            {
                //温度湿度传感器
                //计算温度湿度
                const double C1 = -2.0468;
                const double C2 = 0.0367;
                const double C3 = -0.0000015955;
                const double D1 = -39.8;   // for 12 Bit @ 3V
                const double D2 = 0.01;    // for 12 Bit @ 3V
                const double T1 = 0.01;
                const double T2 = 0.00008;

                double t = data[13] * 256 + data[14];
                double rh = data[15] * 256 + data[16];

                double rh_lin;
                double rh_true;
                double t_C;

                //计算
                t_C = t * D2 + D1;
                rh_lin = C3 * rh * rh + C2 * rh + C1;
                rh_true = (t_C - 25) * (T1 + T2 * rh) + rh_lin;
                if (rh_true > 100)
                    rh_true = 100;
                if (rh_true < 0.1)
                    rh_true = 0.1;



                double Humidity = rh_true;
                double Temperature = t_C;
                

                //sava data
                if ( _container.Data != null && _container.Data.ContainsKey("1") )
                {
                    _container.Data["1"].Type = 1;
                    _container.Data["1"].Data = Humidity;
                }
                else if (_container.Data == null)
                {
                    _container.Data = new Dictionary<string, senserDataStruct>();
                    senserDataStruct tempSenserData = new senserDataStruct(1,Humidity);
                    _container.Data.Add("1", tempSenserData);
                }
                else if (_container.Data.ContainsKey("1"))
                {
                    senserDataStruct tempSenserData = new senserDataStruct(1, Humidity);
                    _container.Data.Add("1", tempSenserData);
                }


                if (_container.Data != null && _container.Data.ContainsKey("2"))
                {
                    _container.Data["2"].Type = 2;
                    _container.Data["2"].Data = Temperature;
                }
                else if (_container.Data == null)
                {
                    _container.Data = new Dictionary<string, senserDataStruct>();
                    senserDataStruct tempSenserData = new senserDataStruct(2, Temperature);
                    _container.Data.Add("2", tempSenserData);
                }
                else if (_container.Data.ContainsKey("2"))
                {
                    senserDataStruct tempSenserData = new senserDataStruct(2, Temperature);
                    _container.Data.Add("2", tempSenserData);
                }

            }
            else
            {
                //提取节点号，存储更新数据
                int senserType = data[4] * 16 + data[5];
                double dataresult = data[13] * 16 + data[14];
                if (_container.Data != null && _container.Data.ContainsKey(senserType.ToString()))
                {
                    _container.Data[senserType.ToString()].Type = senserType;
                    _container.Data[senserType.ToString()].Data = dataresult;
                }
                else if (_container.Data == null)
                {
                    _container.Data = new Dictionary<string, senserDataStruct>();
                    senserDataStruct tempSenserData = new senserDataStruct(senserType, dataresult);
                    _container.Data.Add(senserType.ToString(), tempSenserData);
                }
                else if (_container.Data.ContainsKey(senserType.ToString()))
                {
                    senserDataStruct tempSenserData = new senserDataStruct(senserType, dataresult);
                    _container.Data.Add(senserType.ToString(), tempSenserData);
                }
            }
        }



        //串口设置        
        public static string SetPortName(string defaultPortName)
        {
            string portName;

            Console.WriteLine("Available Ports:");
            foreach (string s in SerialPort.GetPortNames())
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("COM port({0}): ", defaultPortName);
            portName = Console.ReadLine();

            if (portName == "")
            {
                portName = defaultPortName;
            }
            return portName;
        }

        public static int SetPortBaudRate(int defaultPortBaudRate)
        {
            string baudRate;

            Console.Write("Baud Rate({0}): ", defaultPortBaudRate);
            baudRate = Console.ReadLine();

            if (baudRate == "")
            {
                baudRate = defaultPortBaudRate.ToString();
            }

            return int.Parse(baudRate);
        }

        public static Parity SetPortParity(Parity defaultPortParity)
        {
            string parity;

            Console.WriteLine("Available Parity options:");
            foreach (string s in Enum.GetNames(typeof(Parity)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("Parity({0}):", defaultPortParity.ToString());
            parity = Console.ReadLine();

            if (parity == "")
            {
                parity = defaultPortParity.ToString();
            }

            return (Parity)Enum.Parse(typeof(Parity), parity);
        }

        public static int SetPortDataBits(int defaultPortDataBits)
        {
            string dataBits;

            Console.Write("Data Bits({0}): ", defaultPortDataBits);
            dataBits = Console.ReadLine();

            if (dataBits == "")
            {
                dataBits = defaultPortDataBits.ToString();
            }

            return int.Parse(dataBits);
        }

        public static StopBits SetPortStopBits(StopBits defaultPortStopBits)
        {
            string stopBits;

            Console.WriteLine("Available Stop Bits options:");
            foreach (string s in Enum.GetNames(typeof(StopBits)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("Stop Bits({0}):", defaultPortStopBits.ToString());
            stopBits = Console.ReadLine();

            if (stopBits == "")
            {
                stopBits = defaultPortStopBits.ToString();
            }

            return (StopBits)Enum.Parse(typeof(StopBits), stopBits);
        }

        public static Handshake SetPortHandshake(Handshake defaultPortHandshake)
        {
            string handshake;

            Console.WriteLine("Available Handshake options:");
            foreach (string s in Enum.GetNames(typeof(Handshake)))
            {
                Console.WriteLine("   {0}", s);
            }

            Console.Write("Handshake({0}):", defaultPortHandshake.ToString());
            handshake = Console.ReadLine();

            if (handshake == "")
            {
                handshake = defaultPortHandshake.ToString();
            }

            return (Handshake)Enum.Parse(typeof(Handshake), handshake);
        }


 
    }
}
