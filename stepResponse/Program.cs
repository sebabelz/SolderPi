using System;
using System.Collections.Specialized;
using System.IO;
using System.IO.Ports;
using USBTC08Imports;

namespace stepResponse
{
    internal static class Program
    {
       
        public static void Main(string[] args)
        {
            // Open connection to device
            Console.WriteLine("Opening the device...");

            short handle = Imports.TC08OpenUnit();
            Console.WriteLine("Handle: {0}", handle);
            
            if (handle == 0)
            {
                Console.WriteLine("Unable to open device");
                Console.WriteLine("Error code : {0}", handle);
            }
            else
            {
                Console.WriteLine("Device opened successfully");

                var response = new StepResponse();

                //response.Run();
                       
                Thermocouple tc = new Thermocouple(handle);

                tc.OnTemperatureReceived += TemperatureDataReceivedEventHandler;

                while (true)
                {
                    tc.Run();
                }
               

                Imports.TC08CloseUnit(handle);
            }
        }

        private static void TemperatureDataReceivedEventHandler(object sender, TemperatureDataReceivedEventArgs e)
        {
            Console.WriteLine(e.GetTemperature());
            
        }
    }
}