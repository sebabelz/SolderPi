using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.IO.Ports;
using USBTC08Imports;

namespace stepResponse
{
    public class StepResponse
    {
        private readonly NumberFormatInfo _nfi = new NumberFormatInfo {NumberDecimalSeparator = "."};
        
        private readonly Stopwatch _stopwatch;
        private readonly SerialPort _serialPort;
        private string _fileName;
        

        public StepResponse()
        {
            _serialPort = new SerialPort {BaudRate = 115200, PortName = "COM3"};
            _serialPort.Open();
            _stopwatch = new Stopwatch();
            
        }

        public void Run()
        {
            Console.WriteLine("Press 'R' to start recording.");
        
            while (true)
            {
                var input = Console.ReadKey();

                switch (input.Key) //Switch on Key enum
                {
                    case ConsoleKey.R:
                        _serialPort.WriteLine("R");
                        _stopwatch.Start();
                        _fileName = "step_" + DateTime.Now.ToString("MM_dd_yyyy_HH_mm_ss") + ".csv";
                        _serialPort.DataReceived += SerialDataReceivedEventHandler;
                        File.Create(_fileName);
                        break;

                    case ConsoleKey.X:
                        _serialPort.WriteLine("X");
                        _serialPort.DataReceived -= SerialDataReceivedEventHandler;
                        _serialPort.DiscardInBuffer();
                        Console.WriteLine("ESC");
                        break;
                    
                    case ConsoleKey.Escape:
                        return;                 
                }
            }
        }
        
        private void SerialDataReceivedEventHandler(object sender, SerialDataReceivedEventArgs e)
        {        
            var reading = ((SerialPort)sender).ReadLine();

            var dataSet = _stopwatch.Elapsed.TotalMilliseconds.ToString(_nfi)+ ", " + reading + ", " +  "\n";     
            Console.Write(dataSet);  
        }    
        
    }
}