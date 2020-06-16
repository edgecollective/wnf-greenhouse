EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr User 12296 8468
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	8250 2400 8850 2400
Text Label 8850 2400 2    70   ~ 0
MOSI
Wire Wire Line
	8850 2300 8250 2300
Text Label 8850 2300 2    70   ~ 0
MISO
Wire Wire Line
	8250 2500 8850 2500
Text Label 8850 2500 2    70   ~ 0
SCK
Wire Wire Line
	8850 2600 8250 2600
Text Label 8850 2600 2    70   ~ 0
A5
Wire Wire Line
	8250 2700 8850 2700
Text Label 8850 2700 2    70   ~ 0
A4
Wire Wire Line
	8850 2800 8250 2800
Text Label 8850 2800 2    70   ~ 0
A3
Wire Wire Line
	8250 2900 8850 2900
Text Label 8850 2900 2    70   ~ 0
A2
Text Label 8850 3000 2    70   ~ 0
A1
Wire Wire Line
	4200 3100 5900 3100
Text Label 5900 3100 2    70   ~ 0
D11
Wire Wire Line
	5900 3200 4200 3200
Text Label 5900 3200 2    70   ~ 0
D12
Wire Wire Line
	8250 3300 7750 3300
Text Label 8050 3300 2    70   ~ 0
AREF
Wire Wire Line
	8850 3500 8850 3400
Wire Wire Line
	8850 3400 8250 3400
Text Label 8850 3500 2    10   ~ 0
+3V3
Wire Wire Line
	4200 3400 5300 3400
Text Label 4200 3400 2    10   ~ 0
VBUS
Wire Wire Line
	5300 3600 4200 3600
Text Label 5300 3600 2    10   ~ 0
VBAT
Wire Wire Line
	4200 3300 5900 3300
Text Label 5900 3300 2    70   ~ 0
D13
Text Label 8850 3100 2    70   ~ 0
A0
Wire Wire Line
	4200 2600 5900 2600
Text Label 5900 2600 2    70   ~ 0
SCL
Wire Wire Line
	5900 2500 4200 2500
Text Label 5900 2500 2    70   ~ 0
SDA
Wire Wire Line
	4200 2900 5900 2900
Text Label 5900 2900 2    70   ~ 0
D9
Wire Wire Line
	5900 2800 4200 2800
Text Label 5900 2800 2    70   ~ 0
D7
Wire Wire Line
	4200 2400 5900 2400
Text Label 5900 2400 2    70   ~ 0
TX_D1
Wire Wire Line
	5900 2300 4200 2300
Text Label 5900 2300 2    70   ~ 0
RX_D0
Wire Wire Line
	5900 3000 4200 3000
Text Label 5900 3000 2    70   ~ 0
D10
Wire Wire Line
	8250 3500 8750 3500
Text Label 8750 3500 2    70   ~ 0
~RESET
Wire Wire Line
	8250 2200 8850 2200
Text Label 8850 2200 2    70   ~ 0
D2
Wire Wire Line
	8250 3200 7850 3200
Text Label 8050 3200 2    70   ~ 0
VHI
Wire Wire Line
	4200 2700 6000 2700
Text Label 5900 2700 2    70   ~ 0
D5_5V
$Comp
L ib4-eagle-import:VBUS #U$019
U 1 1 E246D3EE
P 5400 3400
F 0 "#U$019" H 5400 3400 50  0001 C CNN
F 1 "VBUS" H 5340 3440 42  0000 L BNN
F 2 "" H 5400 3400 50  0001 C CNN
F 3 "" H 5400 3400 50  0001 C CNN
	1    5400 3400
	0    1    1    0   
$EndComp
$Comp
L ib4-eagle-import:VBAT #U$020
U 1 1 F3FE4F2D
P 5400 3600
F 0 "#U$020" H 5400 3600 50  0001 C CNN
F 1 "VBAT" H 5340 3640 42  0000 L BNN
F 2 "" H 5400 3600 50  0001 C CNN
F 3 "" H 5400 3600 50  0001 C CNN
	1    5400 3600
	0    1    1    0   
$EndComp
$Comp
L ib4-eagle-import:+3V3 #+3V01
U 1 1 406B5002
P 8850 3600
F 0 "#+3V01" H 8850 3600 50  0001 C CNN
F 1 "+3V3" V 8750 3400 59  0000 L BNN
F 2 "" H 8850 3600 50  0001 C CNN
F 3 "" H 8850 3600 50  0001 C CNN
	1    8850 3600
	-1   0    0    1   
$EndComp
$Comp
L ib4-eagle-import:HEADER-1X14 JP2
U 1 1 FA93C76E
P 4100 2900
F 0 "JP2" H 3850 3725 59  0000 L BNN
F 1 "HEADER-1X14" H 3850 2100 59  0000 L BNN
F 2 "ib4:1X14_ROUND70" H 4100 2900 50  0001 C CNN
F 3 "" H 4100 2900 50  0001 C CNN
	1    4100 2900
	-1   0    0    1   
$EndComp
$Comp
L ib4-eagle-import:HEADER-1X14 JP4
U 1 1 47274FB3
P 8350 2900
F 0 "JP4" H 8100 3725 59  0000 L BNN
F 1 "HEADER-1X14" H 8100 2100 59  0000 L BNN
F 2 "ib4:1X14_ROUND70" H 8350 2900 50  0001 C CNN
F 3 "" H 8350 2900 50  0001 C CNN
	1    8350 2900
	1    0    0    -1  
$EndComp
$Comp
L ib4-eagle-import:GND #GND02
U 1 1 13A376EC
P 4300 3500
F 0 "#GND02" H 4300 3500 50  0001 C CNN
F 1 "GND" H 4200 3400 59  0000 L BNN
F 2 "" H 4300 3500 50  0001 C CNN
F 3 "" H 4300 3500 50  0001 C CNN
	1    4300 3500
	0    -1   -1   0   
$EndComp
$Comp
L Connector:Conn_01x12_Female J1
U 1 1 5D953D46
P 2650 3000
F 0 "J1" H 2678 2976 50  0000 L CNN
F 1 "Conn_01x12_Female" H 2678 2885 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x12_P2.54mm_Vertical" H 2650 3000 50  0001 C CNN
F 3 "~" H 2650 3000 50  0001 C CNN
	1    2650 3000
	-1   0    0    1   
$EndComp
$Comp
L ib4-eagle-import:GND #GND0101
U 1 1 5D960432
P 3200 3200
F 0 "#GND0101" H 3200 3200 50  0001 C CNN
F 1 "GND" H 3100 3100 59  0000 L BNN
F 2 "" H 3200 3200 50  0001 C CNN
F 3 "" H 3200 3200 50  0001 C CNN
	1    3200 3200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2850 3300 3200 3300
Text GLabel 8850 2500 2    50   Input ~ 0
SCK
Text GLabel 2850 3200 2    50   Input ~ 0
SCK
Text GLabel 2850 3100 2    50   Input ~ 0
MISO
Text GLabel 2850 3000 2    50   Input ~ 0
MOSI
Text GLabel 2850 2700 2    50   Input ~ 0
E_~RST
Text GLabel 2850 2800 2    50   Input ~ 0
E_BUSY
Text GLabel 2850 2900 2    50   Input ~ 0
E_CS
Text GLabel 8850 2300 2    50   Input ~ 0
MISO
Text GLabel 8850 2400 2    50   Input ~ 0
MOSI
Text GLabel 5900 3100 2    50   Input ~ 0
E_BUSY
Text GLabel 5900 3000 2    50   Input ~ 0
E_~RST
Text GLabel 5900 3200 2    50   Input ~ 0
E_CS
Text GLabel 5900 2800 2    50   Input ~ 0
L_RST
Text GLabel 5900 2900 2    50   Input ~ 0
L_CS
$Comp
L Mechanical:MountingHole H1
U 1 1 5D99EBDD
P 9250 650
F 0 "H1" H 9350 696 50  0000 L CNN
F 1 "MountingHole" H 9350 605 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9250 650 50  0001 C CNN
F 3 "~" H 9250 650 50  0001 C CNN
	1    9250 650 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D99FC38
P 9250 850
F 0 "H2" H 9350 896 50  0000 L CNN
F 1 "MountingHole" H 9350 805 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9250 850 50  0001 C CNN
F 3 "~" H 9250 850 50  0001 C CNN
	1    9250 850 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5D99FE70
P 9250 1050
F 0 "H3" H 9350 1096 50  0000 L CNN
F 1 "MountingHole" H 9350 1005 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9250 1050 50  0001 C CNN
F 3 "~" H 9250 1050 50  0001 C CNN
	1    9250 1050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5D99FFF4
P 9250 1250
F 0 "H4" H 9350 1296 50  0000 L CNN
F 1 "MountingHole" H 9350 1205 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 9250 1250 50  0001 C CNN
F 3 "~" H 9250 1250 50  0001 C CNN
	1    9250 1250
	1    0    0    -1  
$EndComp
Text GLabel 8750 3500 3    50   Input ~ 0
DRV
$Comp
L Connector:Conn_01x09_Female J2
U 1 1 5EEA3416
P 10150 2350
F 0 "J2" H 10178 2376 50  0000 L CNN
F 1 "Conn_01x09_Female" H 10178 2285 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x09_P2.54mm_Vertical" H 10150 2350 50  0001 C CNN
F 3 "~" H 10150 2350 50  0001 C CNN
	1    10150 2350
	1    0    0    -1  
$EndComp
Text GLabel 9950 2550 0    50   Input ~ 0
MOSI
Text GLabel 9950 2450 0    50   Input ~ 0
MISO
Text GLabel 9950 2350 0    50   Input ~ 0
SCK
$Comp
L ib4-eagle-import:+3V3 #+3V0102
U 1 1 5EEA5AF3
P 9950 1750
F 0 "#+3V0102" H 9950 1750 50  0001 C CNN
F 1 "+3V3" V 9850 1550 59  0000 L BNN
F 2 "" H 9950 1750 50  0001 C CNN
F 3 "" H 9950 1750 50  0001 C CNN
	1    9950 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 1850 9950 1950
$Comp
L ib4-eagle-import:GND #GND0102
U 1 1 5EEA77CB
P 9400 2150
F 0 "#GND0102" H 9400 2150 50  0001 C CNN
F 1 "GND" H 9300 2050 59  0000 L BNN
F 2 "" H 9400 2150 50  0001 C CNN
F 3 "" H 9400 2150 50  0001 C CNN
	1    9400 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 2050 9400 2050
$Comp
L ib4-eagle-import:VBUS #U$0101
U 1 1 5EE9709C
P 2950 3500
F 0 "#U$0101" H 2950 3500 50  0001 C CNN
F 1 "VBUS" H 2890 3540 42  0000 L BNN
F 2 "" H 2950 3500 50  0001 C CNN
F 3 "" H 2950 3500 50  0001 C CNN
	1    2950 3500
	0    1    1    0   
$EndComp
Wire Wire Line
	9950 2750 9300 2750
Wire Wire Line
	9300 2750 9300 3100
Wire Wire Line
	8250 3100 9300 3100
Wire Wire Line
	9150 3000 9150 2650
Wire Wire Line
	9150 2650 9950 2650
Wire Wire Line
	8250 3000 9150 3000
$EndSCHEMATC
