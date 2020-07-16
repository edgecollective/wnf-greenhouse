import board
import busio
import digitalio
from digitalio import DigitalInOut
import time
import gc
import sys


SLEEP_TIME = 90 # number of seconds to wait for each posting cycle
MAX_ATTEMPTS = 2 # max number of attempts to connect to wifi before sleeping

# setting up wifi ...

try:
    from network_secrets import network_secrets
except ImportError:
    print("WiFi secrets are kept in network_secrets.py, please add them there!")
    raise

# these get automatically imported from the network_secrets.py file ...
WIFI_ESSID=network_secrets['ssid']
WIFI_PASS=network_secrets['password']
farmos_pubkey=network_secrets['farmos_pubkey']
farmos_privkey=network_secrets['farmos_privkey']

# url for remote logging site
base_url= "https://edgecollective.farmos.net/farm/sensor/listener/"

FARMOS_POST_URL = base_url+farmos_pubkey+"?private_key="+farmos_privkey

EDGE_POST_URL = "http://64.227.0.108:8400/api/user"

import adafruit_esp32spi.adafruit_esp32spi_socket as socket
from adafruit_esp32spi import adafruit_esp32spi
import adafruit_requests as requests

# wiring from AIRLIFT breakout to itsybitsy_m4:
# (AIRLIFT breakout --> itsybitsy_m4)
# VIN --> USB
# GND --> GND
# SCK --> SCK
# MISO --> MISO
# MOSI --> MOSI
# CS --> D12
# RST --> D10
# BUSY --> D11

esp32_cs = DigitalInOut(board.D12)
esp32_reset = DigitalInOut(board.D10)
esp32_ready = DigitalInOut(board.D11)

esp_spi = busio.SPI(board.SCK, board.MOSI, board.MISO)
esp = adafruit_esp32spi.ESP_SPIcontrol(esp_spi, esp32_cs, esp32_ready, esp32_reset)

def connect(essid,password): # note that these are arguments are b'essid' and b'password'
    print("Connecting to AP...")
    while not esp.is_connected:
        try:
            esp.connect_AP(essid, password)
        except RuntimeError as e:
            print("could not connect to AP, retrying: ",e)
            continue
    print("Connected to", str(esp.ssid, 'utf-8'), "\tRSSI:", esp.rssi)

    # Initialize a requests object with a socket and esp32spi interface
    requests.set_socket(socket, esp)

# setting up lora  ....

import adafruit_rfm9x

TIMEOUT=5

#wiring from LORA breakout to itsybitsy_m4
# 3V3 --> 3V3
# GND --> GND
# MISO --> MISO
# MOSI --> MOSI
# SCK --> SCK
# CS --> A1
# RST --> A0 


cs = digitalio.DigitalInOut(board.A1)
reset = digitalio.DigitalInOut(board.A0)
rfm9x = adafruit_rfm9x.RFM9x(esp_spi, cs, reset, 915.0)


# setting up an indicator LED for the itsy on-board red LED on pin 13
led = digitalio.DigitalInOut(board.D13)
led.direction = digitalio.Direction.OUTPUT
led.value = False

# main loop
attemptCount = 0

while True:

    gc.collect()

    try:

        print("radio waiting ...")
        packet = rfm9x.receive(timeout=TIMEOUT)
        if packet is not None:

            led.value=True
            time.sleep(.1)
            led.value=False

            p = str(packet, 'ascii').rstrip('\x00').strip().rstrip('\x00')

            print("Received: ",p)
            parts = p.strip('{').strip('}').split(",")
            print(parts)
            
            if len(parts)==8:
                print("Got here!")

                json_data={}
                for i in range(0,len(parts)):
                    q=parts[i].split(':')
                    print(q)
                    #field=str(q[0].strip('\"'))
                    field=q[0].strip('\"')
                    #value=float(q[1].strip('\"'))
                    value=q[1].strip('\"')
                    #value=q[1]
                    print(field,value)
                    json_data.update({field:value})
                    #json_data=json_data+field+":"+value
                    #if (i!=len(parts)-1):
                    #    json_data=json_data+","
                
                json_data.update({'rssi':rfm9x.rssi})
                #json_data=json_data+"}"
                print(json_data)
                #temp = parts[1]
                #print("temp=",temp)

                #json_data = {"cpu_temperature":temp}
                #json_data = p
                
                #json_data = {"cpu_temperature":32.2}
                print("json_data:",json_data)

                print("Posting to ",EDGE_POST_URL)
                
                connect(WIFI_ESSID,WIFI_PASS)
                response = requests.post(EDGE_POST_URL, json=json_data)
                response.close()

                print("Done. Sleeping for ", SLEEP_TIME, "seconds")

                for i in range(0,3):
                    led.value=True
                    time.sleep(.1)
                    led.value=False

                time.sleep(SLEEP_TIME) #in case no timer
    
    except Exception as e:
        if (attemptCount>MAX_ATTEMPTS):
            print("Error -- will try again in ", SLEEP_TIME, "seconds")
            time.sleep(SLEEP_TIME) #in case no timer
        print("error: "+str(e))


       
        
