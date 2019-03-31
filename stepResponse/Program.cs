using System;
using System.Diagnostics;
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
            //Console.WriteLine("Handle: {0}", handle);         
            
            if (handle == 0)
            {
                Console.WriteLine("Unable to open device");
                Console.WriteLine("Error code : {0}", handle);
            }
            else
            {
                Console.WriteLine("Device opened successfully");

                var response = new StepResponse(handle);

                response.Run();                       
               
                Imports.TC08CloseUnit(handle);
            }
        }
    }
}