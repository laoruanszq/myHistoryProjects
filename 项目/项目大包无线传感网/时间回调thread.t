using System;  
using System.Collections.Generic;  
using System.Text;  
using System.Threading;  
using System.Collections;  
  
namespace Demo  
{  
    class ParamObject  
    {  
        public int iCounter = 0;  
        public Timer aTimer;  
    }  
  
    class Program  
    {  
       public static void Main(string[] args)  
       {  
           ParamObject aParamObject = new ParamObject();  
           Timer aTimer = new Timer(new TimerCallback(CheckStatus), aParamObject, 1000, 1000);  
           aParamObject.aTimer = aTimer;  
  
           while (aParamObject.aTimer != null)  
           {  
               Thread.Sleep(0);  
           }  
           Console.ReadLine();  
       }  
  
        static void CheckStatus(object paramObject)  
        {  
            ParamObject aParamObject = (ParamObject)paramObject;  
            aParamObject.iCounter++;  
            Console.WriteLine("{0} status: {1}", DateTime.Now.TimeOfDay, aParamObject.iCounter);  
  
            if (aParamObject.iCounter == 5)  
            {  
                // Wait 1000 ms and go on to do the timer event  
                aParamObject.aTimer.Change(1000, 2000);  
                Console.WriteLine("Timer interval changed!");  
            }  
  
            if (aParamObject.iCounter == 10)  
            {  
                Console.WriteLine("Dispose timer");  
                aParamObject.aTimer.Dispose();  
                aParamObject.aTimer = null;  
            }  
        }  
    }  
}  
