using System;
using System.Globalization;
using USBTC08Imports;

namespace stepResponse
{
    public delegate void TemperatureDataReceivedEventHandler(object sender, TemperatureDataReceivedEventArgs e);
             
    public class TemperatureDataReceivedEventArgs : EventArgs
    {
        private readonly string _temperature;
        public TemperatureDataReceivedEventArgs(string text)
        {
            _temperature = text;
        }
        public string GetTemperature()
        {
            return _temperature;
        }
    }
    
    public class Thermocouple
    {
        private const short MAX_CHANNELS = 2;
        private const char TC_TYPE_K = 'K';
        private const int PICO_OK = 1;    
        private readonly NumberFormatInfo _nfi = new NumberFormatInfo {NumberDecimalSeparator = "."};
        
        private readonly short _handle;

        public event TemperatureDataReceivedEventHandler OnTemperatureReceived;


        public Thermocouple(short handle)
        {
            _handle = handle;
            Initialize();
        }

        public void Initialize()
        {
            for (short channel = 0; channel < MAX_CHANNELS; ++channel)
            {
                Imports.TC08SetChannel(_handle, 1, TC_TYPE_K);
            }
            
            Console.WriteLine(Imports.TC08GetMinIntervalMS(_handle));
            
            Imports.TC08SetMains(_handle, Imports.MainsFrequency.USBTC08_MAINS_FIFTY_HERTZ);
        }

        public unsafe void Run()
        {
            var tempBuffer = new float[MAX_CHANNELS]; 
            short overflow;
            
            var status = Imports.TC08GetSingle(_handle, tempBuffer, &overflow, Imports.TempUnit.USBTC08_UNITS_CENTIGRADE);

            OnTemperatureReceived?.Invoke(this, new TemperatureDataReceivedEventArgs(tempBuffer[1].ToString(_nfi)));            
        }
    }
}