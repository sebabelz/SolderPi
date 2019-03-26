#include <Wire.h>
//#include <I2C_ADC.h>
#define ADC_ADDR  0x28 
#define PWMPIN 3
#define BUTTON 2
#define PERIOD_TIME 10
#define DUTY_CYCLE 0.90

uint16_t sensorData[2] = {0};
unsigned long previousMillis;
unsigned long onInterval = DUTY_CYCLE * PERIOD_TIME;
unsigned long offInterval = PERIOD_TIME - onInterval;
bool offState = true;
bool enabled = false;

void sensorInit()
{
  uint8_t configMask = 0x68;       //enable CH1, CH0      B11110000
 
  Wire.begin();
  Wire.beginTransmission(ADC_ADDR);
  Wire.write(configMask);
  Wire.endTransmission();
}

void sensorReadBitWise()
{
  uint8_t rxByte[2];
  Wire.requestFrom(ADC_ADDR, 4);

  for(int i = 0; i < 2; ++i)
  {
    rxByte[0] = Wire.read();
    rxByte[1] = Wire.read();

    print_binary(rxByte[0], 8);
    Serial.print("\t");
    print_binary(rxByte[1], 8);
    Serial.print("\n");
  }
}

void sensorRead(uint16_t *data)
{
  uint8_t rxByte[2];
  Wire.requestFrom(ADC_ADDR, 4);

  for(int i = 0; i < 2; ++i)
  {
    rxByte[0] = Wire.read();
    rxByte[1] = Wire.read();
    data[i] = ((rxByte[0]<< 6) & 0x3C0) | ((rxByte[1] >> 2) & 0x3F); 
  }
}


void print_binary(int v, int num_places)
{
    int mask=0, n;

    for (n=1; n<=num_places; n++)
    {
        mask = (mask << 1) | 0x0001;
    }
    v = v & mask;  // truncate v to specified number of places

    while(num_places)
    {

        if (v & (0x0001 << num_places-1))
        {
             Serial.print("1");
        }
        else
        {
             Serial.print("0");
        }

        --num_places;
        if(((num_places%4) == 0) && (num_places != 0))
        {
            Serial.print("_");
        }
    }
}

void buttonIntput()
{
  digitalWrite(PWMPIN, LOW);
  if(enabled)
  {
    Serial.println("START");
  }
  enabled = !enabled;
}

void testing()
{
  Serial.println("test");
}

void setup()
{
  Serial.begin(9600);
  while (!Serial);        // wait for Serial port to connect
  Serial.println("Started");

  sensorInit();
  Serial.println("I2C Initialised");

  pinMode(PWMPIN, OUTPUT);
  TCCR2A = bit(COM2A1) | bit(COM2B1) | bit(WGM21) | bit(WGM20);
  TCCR2B = bit(WGM22) | bit(CS20);
  OCR2A = 63;
  OCR2B = 31;
  
  pinMode(BUTTON, INPUT);
  
  attachInterrupt(digitalPinToInterrupt(BUTTON), buttonIntput , FALLING);
  attachInterrupt(digitalPinToInterrupt(PWMPIN), testing , FALLING);
}

void loop()
{
  if (enabled)
  {
    if (millis() - previousMillis > onInterval && offState == false) 
    {
      previousMillis = millis();
      offState = true;
      //digitalWrite(PWMPIN, LOW);
      sensorRead(sensorData);
      Serial.print(sensorData[0]);
      Serial.print(", ");
      Serial.print(sensorData[1]);
      Serial.print("\n");
    }
  
    if (millis() - previousMillis > offInterval && offState == true) 
    {
      previousMillis = millis();
      offState = false;
      //digitalWrite(PWMPIN, HIGH);

    }
  }
}
