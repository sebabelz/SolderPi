using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.IO.Ports;
using System.Net;
using System.Threading;
using USBTC08Imports;

namespace stepResponse
{
    public class StepResponse
    {
        private readonly NumberFormatInfo _nfi = new NumberFormatInfo {NumberDecimalSeparator = "."};
        
        private readonly Stopwatch _stopwatch;
        private readonly SerialPort _serialPort;
        private Thread _thread;
        private Thermocouple _tc;

        private float _temperature = 0;
        private string _fileName;

        private int _state;
        
        public StepResponse(short handle)
        {
            _serialPort = new SerialPort {BaudRate = 115200, PortName = "COM3"};
            _serialPort.Open();
            _stopwatch = new Stopwatch();
            _tc =new Thermocouple(handle);
            
        }

        public void Run()
        {
            Console.WriteLine("Press 'R' to start recording.");
        
            while (true)
            {
                if (Console.KeyAvailable)  
                {  
                    var input = Console.ReadKey(true); 
                    
                    switch (input.Key)
                    {
                        case ConsoleKey.R:
                            _state = 1;
                            break;

                        case ConsoleKey.X:
                            _state = 2;
                            break;
                    
                        case ConsoleKey.Escape:
                            return;                 
                    }
                }         

                switch (_state)
                {
                    case 0:
                        break;
                    
                    case 1:
                        _temperature = _tc.ReadTemperature();
                        _thread = new Thread(_tc.Run);
                        _thread.Start();
                        _tc.OnTemperatureReceived += TemperatureDataReceivedEventHandler;
                        _serialPort.WriteLine("R");
                        _stopwatch.Start();
                        _fileName = "step_" + DateTime.Now.ToString("MM_dd_yyyy_HH_mm_ss") + ".csv";
                        _serialPort.DataReceived += SerialDataReceivedEventHandler;
                        File.Create(_fileName).Close();    
                        Console.WriteLine("START"); 
                        _state = 0;
                        break;
                    
                    case 2:
                        _tc.Shutdown = true;
                        _tc.OnTemperatureReceived -= TemperatureDataReceivedEventHandler;
                        _serialPort.WriteLine("X");
                        _serialPort.DataReceived -= SerialDataReceivedEventHandler;
                        _serialPort.DiscardInBuffer();
                        _stopwatch.Stop();
                        _stopwatch.Reset();
                        Console.WriteLine("END"); 
                        _state = 0;
                        break;
                    case 3:
                        _serialPort.WriteLine("X");
                        Environment.Exit(0);
                        break;
                }

                
            }
        }
        
        private void SerialDataReceivedEventHandler(object sender, SerialDataReceivedEventArgs e)
        {        
            var reading = ((SerialPort)sender).ReadLine();

            var dataSet = _stopwatch.Elapsed.TotalMilliseconds.ToString(_nfi)+ ", " + reading + ", " + _temperature.ToString(_nfi);     
            //Console.WriteLine(dataSet);          
            
            using (var file = new StreamWriter(_fileName, true))
            {
                file.WriteLine(dataSet);
                file.Close();
            }
        }

        private void TemperatureDataReceivedEventHandler(object sender, TemperatureDataReceivedEventArgs e)
        {
           _temperature = e.GetTemperature();
        }
        
    }
}