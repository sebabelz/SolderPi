using System;
using System.Diagnostics;
using System.Globalization;
using System.IO;
using System.IO.Ports;
using System.Net;
using System.Text;
using System.Threading;
using System.Timers;
using USBTC08Imports;

namespace stepResponse
{
    public class StepResponse
    {
        private readonly NumberFormatInfo _nfi = new NumberFormatInfo {NumberDecimalSeparator = "."};
        
        private readonly Stopwatch _stopwatch;
        private readonly SerialPort _serialPort;
        private System.Timers.Timer _shutdownTimer;
        //private Thread _thread;
        private Thermocouple _tc;

        private float _temperature = 0;
        private StreamWriter _streamWriter;

        private int _state;
        private bool _overTemp = false;
        private bool _enabled = false;
        private int _count = 0;
        
        public StepResponse(short handle)
        {
            _serialPort = new SerialPort {BaudRate = 115200, PortName = "COM3"};
            _serialPort.Open();
            _stopwatch = new Stopwatch();
            _tc =new Thermocouple(handle);
            
        }

        public void Run()
        {
            Console.WriteLine("Press 'E' to start recording.");
        
            while (true) 
            {
                if (_temperature > 400 && _overTemp == false)
                {
                    _state = 2;
                    _overTemp = true;
                }
                
                if (Console.KeyAvailable)  
                {  
                    var input = Console.ReadKey(true); 
                    
                    switch (input.Key)
                    {
                        case ConsoleKey.E:
                            _state = 1;
                            break;

                        case ConsoleKey.X:
                            _state = 2;
                            break;
                    
                        case ConsoleKey.Q:
                            _state = 3;
                            break;                
                    }
                }         

                switch (_state)
                {                 
                    case 0:
                        break;
                    
                    case 1:  
                        _overTemp = false;
                        _enabled = true;
                        //_thread = new Thread(_tc.Run);
                        //_thread.Start();
                        _tc.OnTemperatureReceived += TemperatureDataReceivedEventHandler;
                        _serialPort.WriteLine("E");
                        _stopwatch.Start();
                        var fileName = "step_" + DateTime.Now.ToString("MM_dd_yyyy_HH_mm_ss") + ".csv";
                        _serialPort.DataReceived += SerialDataReceivedEventHandler;
                        var fileStream = File.Create(fileName);    
                        _streamWriter = new StreamWriter(fileStream);
                        Console.WriteLine("START"); 
                        _serialPort.DiscardInBuffer();
                        _state = 0;
                        SetTimer();
                        ++_count;
                        break;
                    
                    case 2:
                        //_tc.Shutdown = true;
                        //_tc.OnTemperatureReceived -= TemperatureDataReceivedEventHandler;
                        _serialPort.WriteLine("X");
                        _serialPort.DataReceived -= SerialDataReceivedEventHandler;
                        _serialPort.DiscardInBuffer();
                        _stopwatch.Stop();
                        _stopwatch.Reset();
                        Console.WriteLine("END");                      
                        _streamWriter.Close();
                        _enabled = false;
                        _state = 0;
                        
                        break;
                    case 3:
                        _serialPort.WriteLine("X");
                        Environment.Exit(0);
                        break;
                }

                if (_enabled)
                {
                    _temperature = _tc.ReadTemperature();
                    _serialPort.WriteLine("R");
                }
            }
        }
        
        private void SetTimer()
        {
            // Create a timer with a two second interval.
            _shutdownTimer = new System.Timers.Timer(150000);
            // Hook up the Elapsed event for the timer. 
            _shutdownTimer.Elapsed += OnTimedEvent;
            _shutdownTimer.AutoReset = true;
            _shutdownTimer.Enabled = true;
        }
        
        private void SerialDataReceivedEventHandler(object sender, SerialDataReceivedEventArgs e)
        {        
            var reading = ((SerialPort)sender).ReadLine();

            var dataSet = _stopwatch.Elapsed.TotalMilliseconds.ToString(_nfi)+ ", " + reading + ", " + _temperature.ToString(_nfi);     
            //Console.WriteLine(dataSet);          
            
            _streamWriter.WriteLine(dataSet);         
        }

        private void TemperatureDataReceivedEventHandler(object sender, TemperatureDataReceivedEventArgs e)
        {
           _temperature = e.GetTemperature();        
        }
        
        private void OnTimedEvent(Object source, ElapsedEventArgs e)
        {
            _state = 2;
            _shutdownTimer.Enabled = false;
            Console.WriteLine("TIMED OUT");
        }
    }
}