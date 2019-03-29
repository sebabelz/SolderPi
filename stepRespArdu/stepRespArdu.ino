#include <Wire.h>

#define ADC_ADDR  0x28
#define TESTPIN 4
#define PWMPIN 3
#define BUTTON 2

uint16_t sensorData[2] = {0};

bool isActive = false;
int enabled = 0;
bool readState = false;
volatile bool buttonPressed = false;
volatile int prevButtonState = LOW;

void sensorInit()
{
  uint8_t configMask = 0x68;       //enable CH1, CH0      B11110000

  Wire.begin();
  Wire.setClock(600000);
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

void buttonIntput()
{
  buttonPressed = true;
}

void pwmOff()
{
  readState = true;
  
}

void setup()
{
  Serial.begin(115200);
  while (!Serial);        // wait for Serial port to connect
  Serial.println("Started");

  sensorInit();
  Serial.println("I2C Initialised");

  pinMode(PWMPIN, OUTPUT);
  TCCR2A = bit(COM2B1) | bit(WGM20);
  TCCR2B = bit(WGM22) | bit(CS22);
  OCR2A = 124;
  OCR2B = 0;

  pinMode(BUTTON, INPUT);

  pinMode(TESTPIN, OUTPUT);

  attachInterrupt(digitalPinToInterrupt(BUTTON), buttonIntput , FALLING);
  attachInterrupt(digitalPinToInterrupt(PWMPIN), pwmOff , FALLING);
}

void loop()
{
  char c = Serial.read();

  if(c == 'X')
  {
    Serial.println("Leck mich");
    OCR2B = 0;
  }
  
  if(buttonPressed) 
  {
    OCR2B = 99;
    Serial.print("R");
    buttonPressed = false;
  }
  
  if (readState)
  {
    digitalWrite(TESTPIN, HIGH);
    sensorRead(sensorData);
    digitalWrite(TESTPIN, LOW);
    Serial.print(sensorData[0]);
    Serial.print(", ");
    Serial.print(sensorData[1]);
    Serial.print("\n");
  
    readState = false;
  }


}
