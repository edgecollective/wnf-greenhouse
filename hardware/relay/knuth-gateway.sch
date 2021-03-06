EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
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
$Comp
L knuth-gateway-rescue:Conn_01x12_Female-Connector J3
U 1 1 5D3A6009
P 6400 3600
F 0 "J3" H 6200 4250 50  0000 L CNN
F 1 "FeatherLora1" V 5750 3250 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x12_P2.54mm_Vertical" H 6400 3600 50  0001 C CNN
F 3 "~" H 6400 3600 50  0001 C CNN
	1    6400 3600
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:Conn_01x16_Female-Connector J4
U 1 1 5D3A613C
P 7550 3800
F 0 "J4" H 7400 4650 50  0000 L CNN
F 1 "FeatherLora2" V 7700 3550 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x16_P2.54mm_Vertical" H 7550 3800 50  0001 C CNN
F 3 "~" H 7550 3800 50  0001 C CNN
	1    7550 3800
	1    0    0    -1  
$EndComp
Text GLabel 6200 3100 0    50   Input ~ 0
VBAT
Text GLabel 6200 3200 0    50   Input ~ 0
EN
Text GLabel 6200 3300 0    50   Input ~ 0
VBUS
Text GLabel 6200 3400 0    50   Input ~ 0
D13
Text GLabel 6200 3500 0    50   Input ~ 0
D12
Text GLabel 6200 3600 0    50   Input ~ 0
D11
Text GLabel 6200 3700 0    50   Input ~ 0
D10
Text GLabel 6200 3800 0    50   Input ~ 0
D9
Text GLabel 6200 3900 0    50   Input ~ 0
D6
Text GLabel 6200 4000 0    50   Input ~ 0
D5
Text GLabel 6200 4100 0    50   Input ~ 0
SCL
Text GLabel 6200 4200 0    50   Input ~ 0
SDA
Text GLabel 7350 3100 0    50   Input ~ 0
RESET
Wire Wire Line
	7350 3200 7000 3200
$Comp
L knuth-gateway-rescue:+3V3-power #PWR06
U 1 1 5D3A928A
P 7000 2650
F 0 "#PWR06" H 7000 2500 50  0001 C CNN
F 1 "+3V3" H 7015 2823 50  0000 C CNN
F 2 "" H 7000 2650 50  0001 C CNN
F 3 "" H 7000 2650 50  0001 C CNN
	1    7000 2650
	1    0    0    -1  
$EndComp
Text GLabel 7350 3300 0    50   Input ~ 0
AREF
Wire Wire Line
	7350 3400 7000 3400
Wire Wire Line
	7000 3400 7000 3450
$Comp
L knuth-gateway-rescue:GND-power #PWR07
U 1 1 5D3AC17C
P 7000 3450
F 0 "#PWR07" H 7000 3200 50  0001 C CNN
F 1 "GND" H 7005 3277 50  0000 C CNN
F 2 "" H 7000 3450 50  0001 C CNN
F 3 "" H 7000 3450 50  0001 C CNN
	1    7000 3450
	1    0    0    -1  
$EndComp
Text GLabel 7350 3500 0    50   Input ~ 0
A0
Text GLabel 7350 3600 0    50   Input ~ 0
A1
Text GLabel 7350 3700 0    50   Input ~ 0
A2
Text GLabel 7350 3800 0    50   Input ~ 0
A3
Text GLabel 7350 3900 0    50   Input ~ 0
A4
Text GLabel 7350 4000 0    50   Input ~ 0
A5
Text GLabel 7350 4100 0    50   Input ~ 0
SCK
Text GLabel 7350 4200 0    50   Input ~ 0
MOSI
Text GLabel 7350 4300 0    50   Input ~ 0
MISO
Text GLabel 7350 4400 0    50   Input ~ 0
D0
Text GLabel 7350 4500 0    50   Input ~ 0
D1
Text GLabel 7350 4600 0    50   Input ~ 0
DI01
Wire Wire Line
	6200 3900 6800 3900
$Comp
L knuth-gateway-rescue:R-Device R13
U 1 1 5E667905
P 5500 4600
F 0 "R13" H 5570 4646 50  0000 L CNN
F 1 "1K" H 5570 4555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 5430 4600 50  0001 C CNN
F 3 "~" H 5500 4600 50  0001 C CNN
	1    5500 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:LED D13
U 1 1 5E66790B
P 5500 4900
F 0 "D13" V 5539 4783 50  0000 R CNN
F 1 "LED" V 5448 4783 50  0000 R CNN
F 2 "LED_THT:LED_D3.0mm" H 5500 4900 50  0001 C CNN
F 3 "~" H 5500 4900 50  0001 C CNN
	1    5500 4900
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 2000 2750 2500
$Comp
L knuth-gateway-rescue:Screw_Terminal_01x03-Connector J1
U 1 1 5D3E8A32
P 3850 2400
F 0 "J1" H 3770 2075 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 3770 2166 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-3-3.5-H_1x03_P3.50mm_Horizontal" H 3850 2400 50  0001 C CNN
F 3 "~" H 3850 2400 50  0001 C CNN
	1    3850 2400
	-1   0    0    1   
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR02
U 1 1 5D3D5056
P 2450 2400
F 0 "#PWR02" H 2450 2150 50  0001 C CNN
F 1 "GND" H 2455 2227 50  0000 C CNN
F 2 "" H 2450 2400 50  0001 C CNN
F 3 "" H 2450 2400 50  0001 C CNN
	1    2450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 1700 6350 1700
$Comp
L Switch:SW_SPDT SW2
U 1 1 5E6B15DA
P 6150 1600
F 0 "SW2" H 6150 1885 50  0000 C CNN
F 1 "SW_SPDT" H 6150 1794 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 6150 1600 50  0001 C CNN
F 3 "~" H 6150 1600 50  0001 C CNN
	1    6150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 2300 4050 2300
Wire Wire Line
	2450 2400 4050 2400
Wire Wire Line
	2750 2500 4050 2500
$Comp
L Device:Battery BT1
U 1 1 5E6AC2A2
P 6800 1900
F 0 "BT1" H 6908 1946 50  0000 L CNN
F 1 "Battery" H 6908 1855 50  0000 L CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-2-3.5-H_1x02_P3.50mm_Horizontal" V 6800 1960 50  0001 C CNN
F 3 "~" V 6800 1960 50  0001 C CNN
	1    6800 1900
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 5E641806
P 4350 1200
F 0 "H1" H 4450 1246 50  0000 L CNN
F 1 "MountingHole" H 4450 1155 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 4350 1200 50  0001 C CNN
F 3 "~" H 4350 1200 50  0001 C CNN
	1    4350 1200
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5E641C08
P 4350 1550
F 0 "H2" H 4450 1596 50  0000 L CNN
F 1 "MountingHole" H 4450 1505 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 4350 1550 50  0001 C CNN
F 3 "~" H 4350 1550 50  0001 C CNN
	1    4350 1550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6800 4600 7350 4600
Wire Wire Line
	6800 3900 6800 4600
$Comp
L Connector:Conn_01x07_Female J5
U 1 1 5EE4655A
P 8800 3600
F 0 "J5" H 8828 3626 50  0000 L CNN
F 1 "Conn_01x07_Female" H 8828 3535 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x07_P2.54mm_Vertical" H 8800 3600 50  0001 C CNN
F 3 "~" H 8800 3600 50  0001 C CNN
	1    8800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2650 7000 3200
$Comp
L knuth-gateway-rescue:+3V3-power #PWR011
U 1 1 5EE52C56
P 8600 3300
F 0 "#PWR011" H 8600 3150 50  0001 C CNN
F 1 "+3V3" H 8615 3473 50  0000 C CNN
F 2 "" H 8600 3300 50  0001 C CNN
F 3 "" H 8600 3300 50  0001 C CNN
	1    8600 3300
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR010
U 1 1 5EE530E3
P 8150 3500
F 0 "#PWR010" H 8150 3250 50  0001 C CNN
F 1 "GND" H 8155 3327 50  0000 C CNN
F 2 "" H 8150 3500 50  0001 C CNN
F 3 "" H 8150 3500 50  0001 C CNN
	1    8150 3500
	1    0    0    -1  
$EndComp
Text GLabel 8600 3600 0    50   Input ~ 0
SCL
Text GLabel 8600 3800 0    50   Input ~ 0
SDA
Text GLabel 3000 2300 0    50   Input ~ 0
D10
Wire Wire Line
	6200 3500 5500 3500
Wire Wire Line
	5500 3500 5500 4450
$Comp
L Device:R R1
U 1 1 5EE6DA1A
P 4950 2600
F 0 "R1" H 5020 2646 50  0000 L CNN
F 1 "R" H 5020 2555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 4880 2600 50  0001 C CNN
F 3 "~" H 4950 2600 50  0001 C CNN
	1    4950 2600
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:+3V3-power #PWR03
U 1 1 5EE6E678
P 4950 2450
F 0 "#PWR03" H 4950 2300 50  0001 C CNN
F 1 "+3V3" H 4965 2623 50  0000 C CNN
F 2 "" H 4950 2450 50  0001 C CNN
F 3 "" H 4950 2450 50  0001 C CNN
	1    4950 2450
	1    0    0    -1  
$EndComp
Text GLabel 4800 2750 0    50   Input ~ 0
D10
Wire Wire Line
	4950 2750 4800 2750
Wire Wire Line
	8600 3500 8150 3500
$Comp
L knuth-gateway-rescue:GND-power #PWR0101
U 1 1 5EE83F3B
P 5500 5050
F 0 "#PWR0101" H 5500 4800 50  0001 C CNN
F 1 "GND" H 5505 4877 50  0000 C CNN
F 2 "" H 5500 5050 50  0001 C CNN
F 3 "" H 5500 5050 50  0001 C CNN
	1    5500 5050
	1    0    0    -1  
$EndComp
Text GLabel 5950 1600 0    50   Input ~ 0
VBAT
$Comp
L knuth-gateway-rescue:GND-power #PWR05
U 1 1 5E6AF9FF
P 6800 2100
F 0 "#PWR05" H 6800 1850 50  0001 C CNN
F 1 "GND" H 6805 1927 50  0000 C CNN
F 2 "" H 6800 2100 50  0001 C CNN
F 3 "" H 6800 2100 50  0001 C CNN
	1    6800 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3050 2750 3550
$Comp
L knuth-gateway-rescue:Screw_Terminal_01x03-Connector J2
U 1 1 5EED09F8
P 3850 3450
F 0 "J2" H 3770 3125 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 3770 3216 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-3-3.5-H_1x03_P3.50mm_Horizontal" H 3850 3450 50  0001 C CNN
F 3 "~" H 3850 3450 50  0001 C CNN
	1    3850 3450
	-1   0    0    1   
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR0102
U 1 1 5EED09FE
P 2450 3450
F 0 "#PWR0102" H 2450 3200 50  0001 C CNN
F 1 "GND" H 2455 3277 50  0000 C CNN
F 2 "" H 2450 3450 50  0001 C CNN
F 3 "" H 2450 3450 50  0001 C CNN
	1    2450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 3350 4050 3350
Wire Wire Line
	2450 3450 4050 3450
Wire Wire Line
	2750 3550 4050 3550
Text GLabel 3000 3350 0    50   Input ~ 0
D10
$Comp
L knuth-gateway-rescue:+3V3-power #PWR0103
U 1 1 5EED4B78
P 2750 2000
F 0 "#PWR0103" H 2750 1850 50  0001 C CNN
F 1 "+3V3" H 2765 2173 50  0000 C CNN
F 2 "" H 2750 2000 50  0001 C CNN
F 3 "" H 2750 2000 50  0001 C CNN
	1    2750 2000
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:+3V3-power #PWR0104
U 1 1 5EED84B2
P 2750 3050
F 0 "#PWR0104" H 2750 2900 50  0001 C CNN
F 1 "+3V3" H 2765 3223 50  0000 C CNN
F 2 "" H 2750 3050 50  0001 C CNN
F 3 "" H 2750 3050 50  0001 C CNN
	1    2750 3050
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 5EE2C0E6
P 8050 1750
F 0 "SW1" H 8050 2035 50  0000 C CNN
F 1 "SW_SPDT" H 8050 1944 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 8050 1750 50  0001 C CNN
F 3 "~" H 8050 1750 50  0001 C CNN
	1    8050 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R RA1
U 1 1 5EE34F4A
P 8250 1500
F 0 "RA1" H 8320 1546 50  0000 L CNN
F 1 "R" H 8320 1455 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P2.54mm_Vertical" V 8180 1500 50  0001 C CNN
F 3 "~" H 8250 1500 50  0001 C CNN
	1    8250 1500
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:+3V3-power #PWR0105
U 1 1 5EE35FA8
P 8250 1350
F 0 "#PWR0105" H 8250 1200 50  0001 C CNN
F 1 "+3V3" H 8265 1523 50  0000 C CNN
F 2 "" H 8250 1350 50  0001 C CNN
F 3 "" H 8250 1350 50  0001 C CNN
	1    8250 1350
	1    0    0    -1  
$EndComp
$Comp
L knuth-gateway-rescue:GND-power #PWR0106
U 1 1 5EE3680D
P 8250 1850
F 0 "#PWR0106" H 8250 1600 50  0001 C CNN
F 1 "GND" H 8255 1677 50  0000 C CNN
F 2 "" H 8250 1850 50  0001 C CNN
F 3 "" H 8250 1850 50  0001 C CNN
	1    8250 1850
	1    0    0    -1  
$EndComp
Text GLabel 7850 1750 0    50   Input ~ 0
A1
$EndSCHEMATC
