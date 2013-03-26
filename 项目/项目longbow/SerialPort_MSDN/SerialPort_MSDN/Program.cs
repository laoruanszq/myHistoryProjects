using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO.Ports;
using System.Threading;
using System.Net;
using System.Net.Sockets;
using System.Runtime.Serialization.Json;
using System.IO;

namespace SerialPort_MSDN
{
     public class Person  
     {   
         public string Name { get; set; }    
         public int Age { get; set; }   
     }
     public class JsonHelper
     {   
         /// <summary>    
         /// JSON序列化  
         /// </summary>   
         public static string JsonSerializer<T>(T t) 
         {  
             DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T)); 
             MemoryStream ms = new MemoryStream();   
             ser.WriteObject(ms, t);  
             string jsonString = Encoding.UTF8.GetString(ms.ToArray()); 
             ms.Close();  
             return jsonString;  
         }  
         /// <summary>  
         /// JSON反序列化 
         /// </summary>  
         public static T JsonDeserialize<T>(string jsonString)  
         {   
             DataContractJsonSerializer ser = new DataContractJsonSerializer(typeof(T)); 
             MemoryStream ms = new MemoryStream(Encoding.UTF8.GetBytes(jsonString));  
             T obj = (T)ser.ReadObject(ms);  
             return obj;  
         }  
     }

    class Program
    {

        static bool _continue;
        static SerialPort _serialPort;
        static Socket clientSocket;
        static string cmd;

        static string DeviceID = "1";   //设置deviceID

        static void Main(string[] args)
        {

            //test json
            //序列化
            //Person p = new Person();  
            //p.Name = "张三";  
            //p.Age = 28;   
            //string jsonString = JsonHelper.JsonSerializer<Person>(p); 
            //Console.WriteLine (jsonString);

            ////反序列化
            //string jsonString2 = "[{\"Age\":28,\"Name\":\"张三\"},{\"Age\":23,\"Name\":\"李四\"}"; 
            //Person p2 = JsonHelper.JsonDeserialize<Person>(jsonString2);


            //Console.ReadLine();


           

            //string name;
            string message;
            StringComparer stringComparer = StringComparer.OrdinalIgnoreCase;
            Thread readThread = new Thread(Read);

            // Create a new SerialPort object with default settings.
            _serialPort = new SerialPort();

            // Allow the user to set the appropriate properties.
            //_serialPort.PortName = SetPortName(_serialPort.PortName);           //端口名   COM1
            //_serialPort.BaudRate = SetPortBaudRate(_serialPort.BaudRate);       //波特率   9600
            //_serialPort.Parity = SetPortParity(_serialPort.Parity);             //校验     None
            //_serialPort.DataBits = SetPortDataBits(_serialPort.DataBits);       //数据位   8
            //_serialPort.StopBits = SetPortStopBits(_serialPort.StopBits);       //停止位   One
            //_serialPort.Handshake = SetPortHandshake(_serialPort.Handshake);    //握手协议 None

            // Set the read/write timeouts
            _serialPort.ReadTimeout = 500;
            _serialPort.WriteTimeout = 500;

            //_serialPort.Open();
            _continue = true;
            //readThread.Start();


            //等待socket命令，去嵌入式设备操作。如果socket断了则重连
            while (true)
            {
                socketClient();
            }


            //socketClient();

            /*

           //Console.Write("Name: ");
           //name = Console.ReadLine();
           //Console.WriteLine("Type QUIT to exit");

           while (_continue)
           {
               message = Console.ReadLine();
               //_serialPort.Write(message);

               if (stringComparer.Equals("quit", message))
               {
                   _continue = false;
               }
               else
               {
                   _serialPort.Write(message);
               }
           }
            * 
            * 
            * */

           //readThread.Join();
           _serialPort.Close();
            
        }



        //连接socket，等待命令通知（隔一段时间心跳包验证，）
        public static void socketClient()
        {
            Byte[] outBuffer = new Byte[1024];
            IPEndPoint ipep = new IPEndPoint(IPAddress.Parse("222.44.14.20"), 8888);
            clientSocket = new Socket(ipep.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
            try
            {
                clientSocket.Connect(ipep);
                //String outBufferStr;
                Console.WriteLine("连上了");
                Byte[] inBuffer = new Byte[1024];

                //string message = "30303";
                string message = "{\"content\":{\"action\": null,\"more\": null},\"location\":{\"community\": null,\"block\": null,\"room\": null,\"object\": \"" + DeviceID + "\"},\"flag\":{\"success\": null,\"client_address\": null,\"process\": 0}}";
                //string message = _serialPort.ReadExisting();
                Console.WriteLine(message);
                //发送消息
                outBuffer = Encoding.UTF8.GetBytes(message);
                clientSocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);
                Console.WriteLine("发好消息了");


                while (true)
                {

                    //接收服务器端信息    
                    //clientSocket.Receive(inBuffer,  SocketFlags.None);//如果接收的消息为空 阻塞 当前循环
                    //cmd = Encoding.ASCII.GetString(inBuffer);
                    //Console.WriteLine(cmd);

                    int receiveN = clientSocket.Receive(inBuffer);//接收
                    if (receiveN != 0)
                    {
                       cmd = Encoding.UTF8.GetString(inBuffer, 0, receiveN);
                       //处理接受到的json
                       Console.WriteLine("cmd:" + cmd);
                       int temp = cmd.IndexOf("\"action\": \"") + 11;
                       string order = cmd.Substring(temp, 1);
                       Console.WriteLine("order:" + order);

                        
                        //重新分配socket
                       clientSocket.Shutdown(SocketShutdown.Both);
                       System.Threading.Thread.Sleep(100);
                       clientSocket.Close();

                       clientSocket = new Socket(ipep.AddressFamily, SocketType.Stream, ProtocolType.Tcp);
                       clientSocket.Connect(ipep);
                       Console.WriteLine("又连上了");



                       //返回数据
                       cmd = cmd.Replace("success\": 0", "success\": 1");
                       cmd = cmd.Replace("process\": 1", "process\": 0");
                       Console.WriteLine(cmd);

                        //发送消息
                        outBuffer = Encoding.UTF8.GetBytes(cmd);
                        clientSocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);
                        //if (order.Equals("1"))
                        //{
                        //    //开灯
                        //    _serialPort.Write(order);
                        //}
                        //else if (order.Equals("0"))
                        //{
                        //    //关灯
                        //    _serialPort.Write(order);
                        //}
                    }
                   
                }

            }
            catch(Exception e)
            {
                Console.WriteLine(e.Message);
                //Console.ReadLine();
            } 
        }

        //读取串口输出————线程
        public static void Read()
        {
            Byte[] outBuffer = new Byte[1024];
            while (_continue)
            {
                //Console.WriteLine("read");
                try
                {
                    string message = _serialPort.ReadLine();
                    //string message = _serialPort.ReadExisting();
                    Console.WriteLine("result:"+message);

                    //返回数据
                    cmd = cmd.Replace("success\": 0", "success\": 1");
                    cmd = cmd.Replace("process\": 1", "process\": 0");


                    //发送消息
                    outBuffer = Encoding.UTF8.GetBytes(cmd);
                    clientSocket.Send(outBuffer, outBuffer.Length, SocketFlags.None);

                }
                catch (TimeoutException) { }
            }
        }

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
