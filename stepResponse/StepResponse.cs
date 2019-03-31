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
        private const short MAX_CHANNELS = 2;
        private const char TC_TYPE_K = 'K';
        private const int PICO_OK = 1;    
        private readonly NumberFormatInfo _nfi = new NumberFormatInfo {NumberDecimalSeparator = "."};
        
        private readonly short _handle;
        private Stopwatch _stopwatch;
        private SerialPort _serialPort;
        private string _fileName;
        

        public StepResponse(short handle)
        {
            _handle = handle;
            _serialPort = new SerialPort {BaudRate = 115200, PortName = "COM3"};
            _serialPort.Open();
            _stopwatch = new Stopwatch();
            
            InitializeTc();
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
                        _serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialDataReceivedEventHandler);
                        File.Create(_fileName);
                        break;

                    case ConsoleKey.X:
                        _serialPort.WriteLine("X");
                        _serialPort.DataReceived -= new SerialDataReceivedEventHandler(SerialDataReceivedEventHandler);
                        _serialPort.DiscardInBuffer();
                        Console.WriteLine("ESC");
                        break;
                    
                    case ConsoleKey.Escape:
                        return;                 
                }
            }
        }

        private void InitializeTc()
        {
            for (short channel = 0; channel < MAX_CHANNELS; ++channel)
            {
                Imports.TC08SetChannel(_handle, 1, TC_TYPE_K);
            }
            
            Console.WriteLine(Imports.TC08GetMinIntervalMS(_handle));
            
            Imports.TC08SetMains(_handle, Imports.MainsFrequency.USBTC08_MAINS_FIFTY_HERTZ);
        }

        private unsafe string ReadTemperature()
        {
            var tempBuffer = new float[MAX_CHANNELS]; 
            short overflow;
            
            var status = Imports.TC08GetSingle(_handle, tempBuffer, &overflow, Imports.TempUnit.USBTC08_UNITS_CENTIGRADE);

            return tempBuffer[1].ToString(_nfi);
        }
        
        private void SerialDataReceivedEventHandler(object sender, SerialDataReceivedEventArgs e)
        {        
            var reading = ((SerialPort)sender).ReadLine();

            var dataSet = _stopwatch.Elapsed.TotalMilliseconds.ToString(_nfi)+ ", " + reading + ", " +  "\n";     
            Console.Write(dataSet);  
        }    
        
    }
}