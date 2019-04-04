#include <Wire.h>

#define ADC_ADDR  0x28
#define TESTPIN 4
#define PWMPIN 3

uint16_t sensorData[2] = {0};

volatile bool readState = false;
volatile bool enableRead = false;

void sensorInit()
{
  uint8_t configMask = 0x68;       //enable CH1, CH0      B11110000

  Wire.begin();
  Wire.setClock(400000);
  Wire.beginTransmission(ADC_ADDR);
  Wire.write(configMask);
  Wire.endTransmission();
}

void sensorRead(uint16_t *data)
{
  uint8_t rxByte[2];
  Wire.requestFrom(ADC_ADDR, 4);

  for (int i = 0; i < 2; ++i)
  {
    rxByte[0] = Wire.read();
    rxByte[1] = Wire.read();
    data[i] = ((rxByte[0] << 6) & 0x3C0) | ((rxByte[1] >> 2) & 0x3F);
  }
}

void pwmOff()
{
  if(enableRead)
  {
    readState = true;
  }
  readState = true;
}

void setPwmFrequency(int pin, int divisor) {
  byte mode;
  if(pin == 5 || pin == 6 || pin == 9 || pin == 10) {
    switch(divisor) {
      case 1: mode = 0x01; break;
      case 8: mode = 0x02; break;
      case 64: mode = 0x03; break;
      case 256: mode = 0x04; break;
      case 1024: mode = 0x05; break;
      default: return;
    }
    if(pin == 5 || pin == 6) {
      TCCR0B = TCCR0B & 0b11111000 | mode;
    } else {
      TCCR1B = TCCR1B & 0b11111000 | mode;
    }
  } else if(pin == 3 || pin == 11) {
    switch(divisor) {
      case 1: mode = 0x01; break;
      case 8: mode = 0x02; break;
      case 32: mode = 0x03; break;
      case 64: mode = 0x04; break;
      case 128: mode = 0x05; break;
      case 256: mode = 0x06; break;
      case 1024: mode = 0x7; break;
      default: return;
    }
    TCCR2B = TCCR2B & 0b11111000 | mode;
  }
}

void setup()
{
  Serial.begin(115200);
  while (!Serial);        // wait for Serial port to connect

  sensorInit();
  Serial.println("I2C Initialised");

  pinMode(TESTPIN, OUTPUT);
  pinMode(PWMPIN, OUTPUT);
  setPwmFrequency(PWMPIN, 256);

  attachInterrupt(digitalPinToInterrupt(PWMPIN), pwmOff , FALLING);
}

void loop()
{
  char c = Serial.read();

  if(c == 'E')
  {
    analogWrite(PWMPIN, 51);
    return;
  }

  if(c == 'X')
  {
    analogWrite(PWMPIN, 0);
    return;
  }
  if (c == 'R')
  {
    enableRead = true;
    return;
  }
   
  if (readState)
  {
    delayMicroseconds(1000);
    sensorInit();
    digitalWrite(TESTPIN, HIGH);
    sensorRead(sensorData);
    digitalWrite(TESTPIN, LOW);
    Serial.print(sensorData[0]);
    Serial.print(", ");
    Serial.print(sensorData[1]);
    Serial.print("\n");
  
    readState = false;
    enableRead = false;
  }

}
