// Feather9x_TX
// -*- mode: C++ -*-
// Example sketch showing how to create a simple messaging client (transmitter)
// with the RH_RF95 class. RH_RF95 class does not provide for addressing or
// reliability, so you should only use RH_RF95 if you do not need the higher
// level messaging abilities.
// It is designed to work with the other example Feather9x_RX

// the onewire code uses the recommended libraries here: https://lastminuteengineers.com/ds18b20-arduino-tutorial/


#define deviceName "wnf_remote_101"
#define devEUI "101"

#include <SPI.h>
#include <RH_RF95.h>

#include <Wire.h>

#include "SparkFunBME280.h"
#include "RTCZero.h" // https://github.com/arduino-libraries/RTCZero
#include <ArduinoJson.h> // https://github.com/bblanchon/ArduinoJson

#define VBATPIN A7
#define LED 13
#define INTERVALSWITCH A2

const unsigned SHORT_INTERVAL = 10; // 10 second interval
const unsigned LONG_INTERVAL = 1800; // 30 minute interval

int TX_INTERVAL = SHORT_INTERVAL; // default short interval

//const unsigned TX_INTERVAL = 300; //default is 30 minutes

// for feather m0  
#define RFM95_CS 8
#define RFM95_RST 4
#define RFM95_INT 3


// Change to 434.0 or other frequency, must match RX's freq!
#define RF95_FREQ 915.0

#define RTC_SLEEP 1

// Include the libraries we need
#include <OneWire.h>
#include <DallasTemperature.h>

// Data wire is plugged into port 2 on the Arduino
#define ONE_WIRE_BUS 10
#define TEMPERATURE_PRECISION 12

// Setup a oneWire instance to communicate with any OneWire devices (not just Maxim/Dallas temperature ICs)
OneWire oneWire(ONE_WIRE_BUS);

// Pass our oneWire reference to Dallas Temperature.
DallasTemperature sensors(&oneWire);

// arrays to hold device addresses
//DeviceAddress insideThermometer, outsideThermometer;

// inside:284480420B00005A -- thick grey
// outside:28AAD663131302FC -- thick blue
// oustide:28FF287F201704CB -- 
// outside:28A968A01F1301A0 -- thick blue

DeviceAddress insideThermometer = { 0x28, 0x44, 0x80, 0x42, 0x0B, 0x00, 0x00, 0x5A };
//DeviceAddress outsideThermometer   = { 0x28, 0xAA, 0xD6, 0x63, 0x13, 0x13, 0x02, 0xFC };
DeviceAddress outsideThermometer   = { 0x28, 0xA9, 0x68, 0xA0, 0x1F, 0x13, 0x01, 0xA0 };


// Singleton instance of the radio driver
RH_RF95 rf95(RFM95_CS, RFM95_INT);

BME280 mySensor;

RTCZero rtc;

StaticJsonDocument<200> doc;

double round2(double value) {
   return (int)(value * 100 + 0.5) / 100.0;
}


// main function to print information about a device
void printData(DeviceAddress deviceAddress)
{
  Serial.print("Device Address: ");
  printAddress(deviceAddress);
  Serial.print(" ");
  printTemperature(deviceAddress);
  Serial.println();
}


// function to print a device address
void printAddress(DeviceAddress deviceAddress)
{
  for (uint8_t i = 0; i < 8; i++)
  {
    // zero pad the address if necessary
    if (deviceAddress[i] < 16) Serial.print("0");
    Serial.print(deviceAddress[i], HEX);
  }
}

// function to print the temperature for a device
void printTemperature(DeviceAddress deviceAddress)
{
  float tempC = sensors.getTempC(deviceAddress);
  Serial.print("Temp C: ");
  Serial.print(tempC);
  Serial.print(" Temp F: ");
  Serial.print(DallasTemperature::toFahrenheit(tempC));
}

void setup() 
{

   
  pinMode(INTERVALSWITCH, INPUT_PULLUP);

   pinMode(LED, OUTPUT);
  

if(RTC_SLEEP) {
      // Initialize RTC
    rtc.begin();
    // Use RTC as a second timer instead of calendar
    rtc.setEpoch(0);
}





    sensors.begin();



/*
    if (!sensors.getAddress(insideThermometer, 0)) Serial.println("Unable to find address for Device 0");
  if (!sensors.getAddress(outsideThermometer, 1)) Serial.println("Unable to find address for Device 1");
*/

Serial.print("inside:");
printAddress(insideThermometer);
Serial.println();
Serial.print("outside:");
printAddress(outsideThermometer);
Serial.println();

// set the resolution to 9 bit per device
  sensors.setResolution(insideThermometer, TEMPERATURE_PRECISION);
  sensors.setResolution(outsideThermometer, TEMPERATURE_PRECISION);


  pinMode(RFM95_RST, OUTPUT);
  digitalWrite(RFM95_RST, HIGH);

  Serial.begin(9600);

  /*
  while (!Serial) {
    delay(1);
  }
  */
  
  

  delay(100);

  Serial.println("Feather LoRa TX Test!");

  Wire.begin();

Wire.begin();
  Wire.setClock(400000); //Increase to fast I2C speed!
  
  if (mySensor.beginI2C() == false) //Begin communication over I2C
  {
    Serial.println("The sensor did not respond. Please check wiring.");
    while(1); //Freeze
  }

  mySensor.setMode(MODE_SLEEP); //Sleep for now

  
  // manual reset
  digitalWrite(RFM95_RST, LOW);
  delay(10);
  digitalWrite(RFM95_RST, HIGH);
  delay(10);

  while (!rf95.init()) {
    Serial.println("LoRa radio init failed");
    Serial.println("Uncomment '#define SERIAL_DEBUG' in RH_RF95.cpp for detailed debug info");
    while (1);
  }
  Serial.println("LoRa radio init OK!");

  // Defaults after init are 434.0MHz, modulation GFSK_Rb250Fd250, +13dbM
  if (!rf95.setFrequency(RF95_FREQ)) {
    Serial.println("setFrequency failed");
    while (1);
  }
  Serial.print("Set Freq to: "); Serial.println(RF95_FREQ);
  
  // Defaults after init are 434.0MHz, 13dBm, Bw = 125 kHz, Cr = 4/5, Sf = 128chips/symbol, CRC on

  // The default transmitter power is 13dBm, using PA_BOOST.
  // If you are using RFM95/96/97/98 modules which uses the PA_BOOST transmitter pin, then 
  // you can set transmitter powers from 5 to 23 dBm:
  rf95.setTxPower(23, false);
}

int16_t packetnum = 0;  // packet counter, we increment per xmission



void loop()
{


pinMode(LED, OUTPUT);

int sleepmode = digitalRead(INTERVALSWITCH);
Serial.print("sleep button:");
Serial.println(sleepmode);

if(sleepmode) {

TX_INTERVAL = SHORT_INTERVAL;

}
else {

TX_INTERVAL = LONG_INTERVAL;

}

  Serial.print("sleep interval = ");
  Serial.print(TX_INTERVAL);
  Serial.println(" seconds");
  
  // battery measurement
   float measuredvbat = analogRead(VBATPIN);
measuredvbat *= 2;    // we divided by 2, so multiply back
measuredvbat *= 3.3;  // Multiply by 3.3V, our reference voltage
measuredvbat /= 1024; // convert to voltage



Serial.print("inside:");
printAddress(insideThermometer);
Serial.println();
Serial.print("outside:");
printAddress(outsideThermometer);
Serial.println();

sensors.requestTemperatures();

Serial.print("1-wire Count:");
    Serial.println(sensors.getDeviceCount(), DEC);
    
  printData(insideThermometer);
  printData(outsideThermometer);

      float tempC1 = sensors.getTempC(insideThermometer);
Serial.print("inside:");
Serial.println(tempC1);
      float tempC1F = DallasTemperature::toFahrenheit(tempC1);

      float tempC2 = sensors.getTempC(outsideThermometer);
      float tempC2F = DallasTemperature::toFahrenheit(tempC2);
Serial.print("outside:");
Serial.println(tempC2);


// from BME280

mySensor.setMode(MODE_FORCED); //Wake up sensor and take reading
 
 //long startTime = millis();
  while(mySensor.isMeasuring() == false) ; //Wait for sensor to start measurment
  while(mySensor.isMeasuring() == true) ; //Hang out while sensor completes the reading    
 // long endTime = millis();
  

  float temp = mySensor.readTempF();
  float humidity = mySensor.readFloatHumidity();
  float pressure = mySensor.readFloatPressure();

doc["devEUI"] = devEUI;
doc["deviceName"]=deviceName;
doc["ta"] = round2(temp);
doc["ha"] = round2(humidity);
doc["pa"] = round2(pressure);
doc["tp1"] = round2(tempC1F);
doc["tp2"] = round2(tempC2F);
doc["BatV"] = round2(measuredvbat);

  Serial.println(temp);
  Serial.println(humidity);
  Serial.println(pressure); 
  
  delay(1000); // Wait 1 second between transmits, could also 'sleep' here!
  Serial.println("Transmitting..."); // Send a message to rf95_server
  
  char radiopacket[140] = "Hello World #      ";

  serializeJson(doc,radiopacket,140);
  
  //itoa(packetnum++, radiopacket+13, 10);
  Serial.print("Sending "); Serial.println(radiopacket);
  //radiopacket[19] = 0;
  
  Serial.println("Sending...");
  delay(10);
  rf95.send((uint8_t *)radiopacket, 140);

  Serial.println("Waiting for packet to complete..."); 
  delay(10);
  rf95.waitPacketSent();
  // Now wait for a reply

  rf95.sleep();

digitalWrite(LED, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(100);               // wait for a second
  digitalWrite(LED, LOW);    // turn the LED off by making the voltage LOW
  delay(100);               // wait for a second
  
digitalWrite(LED, HIGH);   // turn the LED on (HIGH is the voltage level)
  delay(100);               // wait for a second
  digitalWrite(LED, LOW);    // turn the LED off by making the voltage LOW
  delay(100);               // wait for a second


//delay(2000); // to make sure we wait before sleeping

  if(RTC_SLEEP) {

/*
pinMode(0,INPUT_PULLUP);
    pinMode(1,INPUT_PULLUP);
    pinMode(A0,INPUT_PULLUP);
    pinMode(A1,INPUT_PULLUP);
    pinMode(A2,INPUT_PULLUP);
    pinMode(A3,INPUT_PULLUP);
    pinMode(A4,INPUT_PULLUP);
    pinMode(A5,INPUT_PULLUP);
    pinMode(0,INPUT_PULLUP);
    pinMode(1,INPUT_PULLUP);
    pinMode(5,INPUT_PULLUP);
    pinMode(9,INPUT_PULLUP);
    pinMode(10,INPUT_PULLUP);
    pinMode(11,INPUT_PULLUP);
    pinMode(12,INPUT_PULLUP);
    */
    //pinMode(13,INPUT_PULLUP);
    
            // Sleep for a period of TX_INTERVAL using single shot alarm
            rtc.setAlarmEpoch(rtc.getEpoch() + TX_INTERVAL);
            rtc.enableAlarm(rtc.MATCH_YYMMDDHHMMSS);
            rtc.attachInterrupt(alarmMatch);
            
            // USB port consumes extra current
            USBDevice.detach();
           
            // Enter sleep mode
            rtc.standbyMode();
            
            
            // Reinitialize USB for debugging
            USBDevice.init();
            USBDevice.attach();
            }
            else {

              delay(TX_INTERVAL*1000); // delay regular way if not sleeping
            }
  
}

void alarmMatch()
{

}
