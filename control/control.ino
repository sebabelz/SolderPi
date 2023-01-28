#include <AutoPID.h>
#include <Wire.h>

#define ADC_ADDR  0x28
#define ADC_RES 0.0048828125
#define ADC_REF 5
#define ADC_GAIN 0.54
#define TESTPIN 4
#define PWMPIN 3

#define OUTPUT_MIN 2
#define OUTPUT_MAX 128

#define KP 7.8
#define KI .13
#define KD 1.5

#define BETA 3940
#define INV_BETA 0.00025316455
#define REFTEMP 298.15
#define INV_REFTEMP 0.00335401643
#define KELVIN 273.15

uint16_t sensorData[2] = {0};
double refTemperature;
double temperature;
double setPoint = 350;
double outputVal = 0;
bool enabled = false;
volatile bool readState = false;

AutoPID myPID(&temperature, &setPoint, &outputVal, OUTPUT_MIN, OUTPUT_MAX, KP, KI, KD);

void initSensor()
{
  uint8_t configMask = 0x68;       //enable CH1, CH0      B11110000

  Wire.begin();
  Wire.setClock(400000);
  Wire.beginTransmission(ADC_ADDR);
  Wire.write(configMask);
  Wire.endTransmission();
}

double getRefTemperature(uint16_t rawData)
{
  double u_t = ADC_RES * rawData;
  double invTemp = INV_REFTEMP + INV_BETA * log(u_t / (ADC_REF - u_t)); 
  refTemperature = 1/invTemp - KELVIN;
  return refTemperature;
}

double getTemperature(uint16_t rawData)
{
  return double(ADC_GAIN * rawData) + refTemperature;
}

void readSensor(uint16_t *data)
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

  initSensor();
  Serial.println("I2C Initialised");

  pinMode(TESTPIN, OUTPUT);
  pinMode(PWMPIN, OUTPUT);
  setPwmFrequency(PWMPIN, 256);

  attachInterrupt(digitalPinToInterrupt(PWMPIN), pwmOff , FALLING);

  myPID.setTimeStep(100);
}

void loop() 
{
  char c = Serial.read();

  if(enabled)
  {
    myPID.run();
  }

  if(c == 'E')
  {
    analogWrite(PWMPIN, outputVal);
    enabled = true;
    return;
  }
  if(c == 'X')
  {
    analogWrite(PWMPIN, 0);
    enabled = false;
    return;
  }
   
  if (readState)
  {
    analogWrite(PWMPIN, outputVal);
    delayMicroseconds(50);
    initSensor();
    digitalWrite(TESTPIN, HIGH);
    readSensor(sensorData);
    digitalWrite(TESTPIN, LOW);
    refTemperature = getRefTemperature(sensorData[0]);
    temperature = getTemperature(sensorData[1]);
    Serial.print(refTemperature);
    Serial.print("\t");
    Serial.print(temperature);
    Serial.print("\t");
    Serial.print(outputVal);
    Serial.print("\n");
    readState = false;
  }
}
