using System;
using System.Threading;
using USBTC08Imports;

namespace stepResponse
{
    internal class StepResponse
    {
        private readonly short _handle;
        public const int USBTC08_MAX_CHANNELS = 8;
        public const char TC_TYPE_K = 'K';
        public const int PICO_OK = 1;
             
        public static void Main(string[] args)
        {
            Console.WriteLine("USB TC-08 Driver Example Program");
            Console.WriteLine("Version 1.2\n");

            // Open connection to device
            Console.WriteLine("\nOpening the device...");

            short handle = Imports.TC08OpenUnit();
            Console.WriteLine("Handle: {0}", handle);

            if (handle == 0)
            {
                Console.WriteLine("Unable to open device");
                Console.WriteLine("Error code : {0}", handle);
                //WaitForKey();
            }
            else
            {
                Console.WriteLine("Device opened successfully\n");

                //ConsoleExample consoleExample = new ConsoleExample(handle);
                //consoleExample.Run();

                Imports.TC08CloseUnit(handle);
            }
        }
        
        /****************************************************************************
        * Read temperature information from the unit
        ****************************************************************************/
        unsafe void GetValues()
        {
            short status;
            short chan;
            float[] tempbuffer = new float[9]; 
            short overflow;
            int lines=0;

            Console.Write("\n");

            Console.WriteLine("Temperatures are in °C\n");
            Console.WriteLine("Chan0 is the Cold Junction Temperature\n");

            // Label the columns
            for (chan = 0; chan <= USBTC08_MAX_CHANNELS; chan++)
            {
                Console.Write("Chan{0}:    ", chan);
            }
            Console.Write("\n");

            do
            { 
                status = Imports.TC08GetSingle(_handle, tempbuffer, &overflow, Imports.TempUnit.USBTC08_UNITS_CENTIGRADE);
            
                if (status == PICO_OK)
                {
                    for (chan = 0; chan <= USBTC08_MAX_CHANNELS; chan++)
                    {
                        Console.Write("{0:0.0000}   ", tempbuffer[chan]);
                    }

                    Console.Write("\n");
                    Thread.Sleep(1000);
                }

                if (++lines > 9)
                {
                    Console.WriteLine("Temperatures are in °C\n");
                    Console.WriteLine("Chan0 is the Cold Junction Temperature\n");
                    Console.WriteLine("Press any key to stop....\n");

                    lines = 0;

                    for (chan = 0; chan <= USBTC08_MAX_CHANNELS; chan++)
                    {
                        Console.Write("Chan{0}:    ", chan);
                    }

                    Console.Write("\n");
                }
            } while (!Console.KeyAvailable);

            char ch = (Console.ReadKey().KeyChar);       // use up keypress
            status = Imports.TC08Stop(_handle);

            Console.WriteLine();
        }

        void OpenTc()
        {
    
        }
    }
}