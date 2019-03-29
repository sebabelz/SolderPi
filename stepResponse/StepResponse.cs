using System;
using System.Diagnostics;
using System.Globalization;
using System.IO.Ports;
using System.Threading;
using System.Timers;
using USBTC08Imports;

namespace stepResponse
{
    internal class StepResponse
    {
        private static System.Timers.Timer timer;
        private static SerialPort serialPort;
        private static Stopwatch stopwatch;
        private static NumberFormatInfo nfi;
        
        public static void Main(string[] args)
        {
            nfi = new NumberFormatInfo();
            nfi.NumberDecimalSeparator = ".";
            
            stopwatch = new Stopwatch();
            
            serialPort = new SerialPort {BaudRate = 115200, PortName = "COM3"};
            serialPort.Open();

       

            Console.WriteLine("Press 'A' to start recording.");
            
            while (true)
            {
                var input = Console.ReadKey();
                
                switch (input.Key) //Switch on Key enum
                {
                    case ConsoleKey.R:
                        SetTimer();
                        serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialDataReceivedEventHandler);
                        serialPort.WriteLine("R"); 
                        stopwatch.Start();
                        break;
                }
            }
        }

        private static void SerialDataReceivedEventHandler(object sender, SerialDataReceivedEventArgs e)
        {
            var reading = ((SerialPort)sender).ReadLine();
            
            var dataSet = stopwatch.Elapsed.TotalMilliseconds.ToString(nfi)+ ", " + reading + "\n"; 
            Console.Write(dataSet);
        }
        
        private static void OnTimedEvent(object source, ElapsedEventArgs e) 
        {
        
            serialPort.WriteLine("X");
            stopwatch.Stop();
            serialPort.DataReceived -= new SerialDataReceivedEventHandler(SerialDataReceivedEventHandler);
            serialPort.DiscardInBuffer();
            Console.WriteLine("Stopped");
        }
        
        private static void SetTimer()
        {
            timer = new System.Timers.Timer(5000);
            timer.AutoReset = false;
            timer.Elapsed += OnTimedEvent;
            timer.Enabled = true;
        }
    }
}