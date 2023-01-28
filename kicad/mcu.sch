EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4900 2800 2    39   Input ~ 0
ENC1_B
Text HLabel 2750 4000 0    39   Input ~ 0
ENC1_SW
$Comp
L power:+3V3 #PWR0206
U 1 1 5FD1EBE9
P 3600 800
F 0 "#PWR0206" H 3600 650 50  0001 C CNN
F 1 "+3V3" H 3615 973 50  0000 C CNN
F 2 "" H 3600 800 50  0001 C CNN
F 3 "" H 3600 800 50  0001 C CNN
	1    3600 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1100 3600 950 
Wire Wire Line
	3700 1100 3700 950 
Wire Wire Line
	3700 950  3600 950 
Connection ~ 3600 950 
Wire Wire Line
	3600 950  3600 800 
Wire Wire Line
	3700 950  3800 950 
Wire Wire Line
	3800 950  3800 1100
Connection ~ 3700 950 
Wire Wire Line
	3800 950  3900 950 
Wire Wire Line
	3900 950  3900 1100
Connection ~ 3800 950 
Wire Wire Line
	3900 950  4000 950 
Wire Wire Line
	4000 950  4000 1100
Connection ~ 3900 950 
$Comp
L power:GND #PWR0205
U 1 1 5FD21D64
P 3500 5000
F 0 "#PWR0205" H 3500 4750 50  0001 C CNN
F 1 "GND" H 3505 4827 50  0000 C CNN
F 2 "" H 3500 5000 50  0001 C CNN
F 3 "" H 3500 5000 50  0001 C CNN
	1    3500 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5000 3500 4850
Wire Wire Line
	3600 4700 3600 4850
Wire Wire Line
	3600 4850 3500 4850
Connection ~ 3500 4850
Wire Wire Line
	3500 4850 3500 4700
Wire Wire Line
	3600 4850 3700 4850
Wire Wire Line
	3700 4850 3700 4700
Connection ~ 3600 4850
Wire Wire Line
	3700 4850 3800 4850
Wire Wire Line
	3800 4850 3800 4700
Connection ~ 3700 4850
Wire Wire Line
	3800 4850 3900 4850
Wire Wire Line
	3900 4850 3900 4700
Connection ~ 3800 4850
Wire Wire Line
	2750 1300 3100 1300
Text Label 2750 1300 0    39   ~ 0
~RESET~
Wire Wire Line
	4400 2700 4800 2700
Wire Wire Line
	4400 2600 4800 2600
Wire Wire Line
	3100 4100 2750 4100
Wire Wire Line
	2750 4000 3100 4000
Wire Wire Line
	4400 2800 4900 2800
Wire Wire Line
	3100 2400 2700 2400
Wire Wire Line
	3100 2500 2700 2500
Text Label 2700 2400 0    39   ~ 0
OSC_IN
Text Label 2700 2500 0    39   ~ 0
OSC_OUT
Wire Wire Line
	4400 3300 4800 3300
Text Label 4800 2600 2    39   ~ 0
SWDIO
Text Label 4800 2700 2    39   ~ 0
SWDCLK
Text Label 4800 3300 2    39   ~ 0
SWO
$Comp
L power:GND #PWR0214
U 1 1 5FD3F720
P 8850 5450
F 0 "#PWR0214" H 8850 5200 50  0001 C CNN
F 1 "GND" H 8855 5277 50  0000 C CNN
F 2 "" H 8850 5450 50  0001 C CNN
F 3 "" H 8850 5450 50  0001 C CNN
	1    8850 5450
	1    0    0    -1  
$EndComp
Text HLabel 2750 3200 0    39   Input ~ 0
ANA0_VOL
Text HLabel 2750 3300 0    39   Input ~ 0
ANA0_CUR
Text HLabel 4900 1500 2    39   Input ~ 0
ANA2_VOL
Text HLabel 4900 1600 2    39   Input ~ 0
ANA2_CUR
Wire Wire Line
	4400 3600 4800 3600
Wire Wire Line
	4400 3700 4800 3700
Wire Wire Line
	4400 4000 4800 4000
Wire Wire Line
	4400 4100 4800 4100
Wire Wire Line
	4400 4200 4800 4200
Text Label 4800 4200 2    39   ~ 0
OLED_~CS~
Wire Wire Line
	4400 4300 4800 4300
Wire Wire Line
	4400 4400 4800 4400
Wire Wire Line
	4400 4500 4800 4500
Text Label 4800 4300 2    39   ~ 0
OLED_SDCLK
Text Label 4800 4400 2    39   ~ 0
OLED_~RESET~
Text Label 4800 4500 2    39   ~ 0
OLED_SDIN
Wire Wire Line
	3100 3600 2800 3600
Text Label 2800 3600 0    39   ~ 0
OLED_DC
Text HLabel 4900 2400 2    39   Output ~ 0
CHA0_PWM_0
Text HLabel 4900 2300 2    39   Output ~ 0
CHA0_PWM_1
Text HLabel 2750 3900 0    39   Output ~ 0
CHA1_PWM_0
Text HLabel 2750 3800 0    39   Output ~ 0
CHA1_PWM_1
Wire Wire Line
	4900 2300 4400 2300
Wire Wire Line
	4400 2400 4900 2400
Wire Wire Line
	2750 3800 3100 3800
Wire Wire Line
	3100 3900 2750 3900
Text HLabel 4800 3700 2    39   Input ~ 0
CHA0_SDA
Text HLabel 2750 4100 0    39   Input ~ 0
ENC1_A
Wire Wire Line
	2750 3300 3100 3300
Wire Wire Line
	2750 3200 3100 3200
Wire Wire Line
	4900 1600 4400 1600
Wire Wire Line
	4900 1500 4400 1500
$Comp
L Device:C C205
U 1 1 5FE0A0BD
P 3150 6800
F 0 "C205" H 3265 6846 50  0000 L CNN
F 1 "1µF" H 3265 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3188 6650 50  0001 C CNN
F 3 "~" H 3150 6800 50  0001 C CNN
F 4 "1276-1067-1-ND" H 3150 6800 50  0001 C CNN "Digikey"
	1    3150 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C206
U 1 1 5FE0A776
P 3600 6800
F 0 "C206" H 3715 6846 50  0000 L CNN
F 1 "10n" H 3715 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 3638 6650 50  0001 C CNN
F 3 "~" H 3600 6800 50  0001 C CNN
F 4 "311-1042-1-ND" H 3600 6800 50  0001 C CNN "Digikey"
	1    3600 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C207
U 1 1 5FE0ABF9
P 4050 6800
F 0 "C207" H 4165 6846 50  0000 L CNN
F 1 "100n" H 4165 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 4088 6650 50  0001 C CNN
F 3 "~" H 4050 6800 50  0001 C CNN
F 4 "1276-1001-1-ND" H 4050 6800 50  0001 C CNN "Digikey"
	1    4050 6800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0203
U 1 1 5FE0AF20
P 3150 6450
F 0 "#PWR0203" H 3150 6300 50  0001 C CNN
F 1 "+3V3" H 3165 6623 50  0000 C CNN
F 2 "" H 3150 6450 50  0001 C CNN
F 3 "" H 3150 6450 50  0001 C CNN
	1    3150 6450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0204
U 1 1 5FE0B85B
P 3150 7150
F 0 "#PWR0204" H 3150 6900 50  0001 C CNN
F 1 "GND" H 3155 6977 50  0000 C CNN
F 2 "" H 3150 7150 50  0001 C CNN
F 3 "" H 3150 7150 50  0001 C CNN
	1    3150 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6650 3150 6550
Wire Wire Line
	3150 6550 3600 6550
Wire Wire Line
	4050 6550 4050 6650
Connection ~ 3150 6550
Wire Wire Line
	3150 6550 3150 6450
Wire Wire Line
	3600 6650 3600 6550
Connection ~ 3600 6550
Wire Wire Line
	3600 6550 4050 6550
Wire Wire Line
	3600 6950 3600 7050
Wire Wire Line
	3600 7050 3150 7050
Wire Wire Line
	3150 7050 3150 7150
Wire Wire Line
	3150 6950 3150 7050
Connection ~ 3150 7050
Wire Wire Line
	4050 6950 4050 7050
Wire Wire Line
	4050 7050 3600 7050
Connection ~ 3600 7050
$Comp
L Device:C C201
U 1 1 5FE24B0F
P 1050 6800
F 0 "C201" H 1165 6846 50  0000 L CNN
F 1 "100n" H 1165 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1088 6650 50  0001 C CNN
F 3 "~" H 1050 6800 50  0001 C CNN
F 4 "1276-1001-1-ND" H 1050 6800 50  0001 C CNN "Digikey"
	1    1050 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C202
U 1 1 5FE254D8
P 1500 6800
F 0 "C202" H 1615 6846 50  0000 L CNN
F 1 "100n" H 1615 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1538 6650 50  0001 C CNN
F 3 "~" H 1500 6800 50  0001 C CNN
F 4 "1276-1001-1-ND" H 1500 6800 50  0001 C CNN "Digikey"
	1    1500 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C203
U 1 1 5FE25949
P 1950 6800
F 0 "C203" H 2065 6846 50  0000 L CNN
F 1 "100n" H 2065 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 1988 6650 50  0001 C CNN
F 3 "~" H 1950 6800 50  0001 C CNN
F 4 "1276-1001-1-ND" H 1950 6800 50  0001 C CNN "Digikey"
	1    1950 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C204
U 1 1 5FE25C0D
P 2400 6800
F 0 "C204" H 2515 6846 50  0000 L CNN
F 1 "100n" H 2515 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0402_1005Metric" H 2438 6650 50  0001 C CNN
F 3 "~" H 2400 6800 50  0001 C CNN
F 4 "1276-1001-1-ND" H 2400 6800 50  0001 C CNN "Digikey"
	1    2400 6800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0202
U 1 1 5FE25E99
P 1050 7100
F 0 "#PWR0202" H 1050 6850 50  0001 C CNN
F 1 "GND" H 1055 6927 50  0000 C CNN
F 2 "" H 1050 7100 50  0001 C CNN
F 3 "" H 1050 7100 50  0001 C CNN
	1    1050 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0201
U 1 1 5FE2D1F0
P 1050 6500
F 0 "#PWR0201" H 1050 6350 50  0001 C CNN
F 1 "+3V3" H 1065 6673 50  0000 C CNN
F 2 "" H 1050 6500 50  0001 C CNN
F 3 "" H 1050 6500 50  0001 C CNN
	1    1050 6500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1050 6500 1050 6550
Wire Wire Line
	1050 6550 1500 6550
Wire Wire Line
	1500 6550 1500 6650
Connection ~ 1050 6550
Wire Wire Line
	1050 6550 1050 6650
Wire Wire Line
	1500 6550 1950 6550
Wire Wire Line
	1950 6550 1950 6650
Connection ~ 1500 6550
Wire Wire Line
	1950 6550 2400 6550
Wire Wire Line
	2400 6550 2400 6650
Connection ~ 1950 6550
Wire Wire Line
	2400 6950 2400 7050
Wire Wire Line
	1050 7050 1050 7100
Wire Wire Line
	1050 7050 1050 6950
Connection ~ 1050 7050
Wire Wire Line
	1500 6950 1500 7050
Connection ~ 1500 7050
Wire Wire Line
	1500 7050 1050 7050
Wire Wire Line
	1950 6950 1950 7050
Wire Wire Line
	1500 7050 1950 7050
Connection ~ 1950 7050
Wire Wire Line
	1950 7050 2400 7050
NoConn ~ 3500 1100
NoConn ~ 4400 1700
NoConn ~ 4400 2500
NoConn ~ 4400 3000
NoConn ~ 4400 3100
NoConn ~ 4400 3200
NoConn ~ 4400 3400
NoConn ~ 4400 3500
NoConn ~ 4400 3800
NoConn ~ 4400 3900
NoConn ~ 3100 4500
NoConn ~ 3100 4400
NoConn ~ 3100 4300
NoConn ~ 3100 4200
NoConn ~ 3100 3700
NoConn ~ 3100 2800
Text HLabel 4800 3600 2    39   Input ~ 0
CHA0_SCL
Text HLabel 4800 4100 2    39   Input ~ 0
CHA1_SDA
Text HLabel 4800 4000 2    39   Input ~ 0
CHA1_SCL
Text Label 8350 1450 0    39   ~ 0
OLED_DC
Wire Wire Line
	8900 1450 8350 1450
Text Label 8350 1750 0    39   ~ 0
OLED_SDCLK
Wire Wire Line
	8900 1750 8350 1750
Wire Wire Line
	8900 1850 8350 1850
Text Label 8350 1850 0    39   ~ 0
OLED_SDIN
Wire Wire Line
	8200 3200 8200 3100
$Comp
L power:GND #PWR0209
U 1 1 5FDEE785
P 8200 3200
F 0 "#PWR0209" H 8200 2950 50  0001 C CNN
F 1 "GND" H 8205 3027 50  0000 C CNN
F 2 "" H 8200 3200 50  0001 C CNN
F 3 "" H 8200 3200 50  0001 C CNN
	1    8200 3200
	-1   0    0    -1  
$EndComp
Text Label 8350 2750 0    39   ~ 0
OLED_~CS~
Text Label 8250 2650 0    39   ~ 0
OLED_~RESET~
Wire Wire Line
	8200 2800 8200 2650
$Comp
L Device:R R201
U 1 1 5FDE5F3F
P 8200 2950
F 0 "R201" H 8270 2996 50  0000 L CNN
F 1 "10k" H 8270 2905 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 8130 2950 50  0001 C CNN
F 3 "~" H 8200 2950 50  0001 C CNN
F 4 "RMCF0603FT10K0CT-ND" H 8200 2950 50  0001 C CNN "Digikey"
	1    8200 2950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8900 2650 8200 2650
Wire Wire Line
	8900 2750 8350 2750
Wire Wire Line
	8800 2150 8800 2250
Connection ~ 8800 2150
Wire Wire Line
	8900 2150 8800 2150
Wire Wire Line
	8800 2050 8800 2150
Connection ~ 8800 2050
Wire Wire Line
	8900 2050 8800 2050
Wire Wire Line
	8800 2250 8800 2350
Connection ~ 8800 2250
Wire Wire Line
	8900 2250 8800 2250
Wire Wire Line
	8800 2350 8800 2450
Connection ~ 8800 2350
Wire Wire Line
	8900 2350 8800 2350
Wire Wire Line
	8800 2450 8800 2950
Connection ~ 8800 2450
Wire Wire Line
	8900 2450 8800 2450
Wire Wire Line
	8800 3050 8800 3200
Connection ~ 8800 3050
Wire Wire Line
	8900 3050 8800 3050
Wire Wire Line
	8800 2950 8800 3050
Connection ~ 8800 2950
Wire Wire Line
	8900 2950 8800 2950
NoConn ~ 8900 2850
NoConn ~ 8900 2550
NoConn ~ 8900 1950
NoConn ~ 8900 1350
Wire Wire Line
	8800 1650 8800 2050
Connection ~ 8800 1650
Wire Wire Line
	8900 1650 8800 1650
Wire Wire Line
	8800 1550 8800 1650
Connection ~ 8800 1550
Wire Wire Line
	8900 1550 8800 1550
$Comp
L power:GND #PWR0213
U 1 1 5FDA6469
P 8800 3200
F 0 "#PWR0213" H 8800 2950 50  0001 C CNN
F 1 "GND" H 8805 3027 50  0000 C CNN
F 2 "" H 8800 3200 50  0001 C CNN
F 3 "" H 8800 3200 50  0001 C CNN
	1    8800 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8800 1150 8800 1550
Wire Wire Line
	8900 1150 8800 1150
Wire Wire Line
	8600 1250 8600 1000
Wire Wire Line
	8900 1250 8600 1250
$Comp
L power:+3V3 #PWR0212
U 1 1 5FDA1179
P 8600 1000
F 0 "#PWR0212" H 8600 850 50  0001 C CNN
F 1 "+3V3" H 8615 1173 50  0000 C CNN
F 2 "" H 8600 1000 50  0001 C CNN
F 3 "" H 8600 1000 50  0001 C CNN
	1    8600 1000
	-1   0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x20 J202
U 1 1 5FD52C16
P 9100 2050
F 0 "J202" H 9050 3100 50  0000 C CNN
F 1 "OLED" H 9050 950 50  0000 C CNN
F 2 "solder_station:NewHaven_OLED_256x64" H 9100 2050 50  0001 C CNN
F 3 "~" H 9100 2050 50  0001 C CNN
F 4 "SAM1093-20-ND" H 9100 2050 50  0001 C CNN "Digikey"
	1    9100 2050
	1    0    0    -1  
$EndComp
Text HLabel 4900 2000 2    39   Input ~ 0
ENC2_A
Text HLabel 4900 1900 2    39   Input ~ 0
ENC2_SW
Wire Wire Line
	4900 1900 4400 1900
Wire Wire Line
	4400 2000 4900 2000
Wire Wire Line
	4900 1800 4400 1800
Text HLabel 4900 1800 2    39   Input ~ 0
ENC2_B
Text HLabel 2750 3000 0    39   Input ~ 0
ANA1_VOL
Text HLabel 2750 3100 0    39   Input ~ 0
ANA1_CUR
Wire Wire Line
	2750 3000 3100 3000
Wire Wire Line
	2750 3100 3100 3100
Wire Wire Line
	4400 1400 4900 1400
Wire Wire Line
	4900 1300 4400 1300
Text HLabel 4900 1300 2    39   Input ~ 0
ANA3_CUR
Text HLabel 4900 1400 2    39   Input ~ 0
ANA3_VOL
Wire Wire Line
	3100 2600 2700 2600
Wire Wire Line
	2700 2600 2700 2700
$Comp
L power:GND #PWR0117
U 1 1 603C9C24
P 2700 2700
F 0 "#PWR0117" H 2700 2450 50  0001 C CNN
F 1 "GND" H 2705 2527 50  0000 C CNN
F 2 "" H 2700 2700 50  0001 C CNN
F 3 "" H 2700 2700 50  0001 C CNN
	1    2700 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 4750 8000 4750
Text Label 5200 6300 0    39   ~ 0
OSC_OUT
Text Label 4650 6300 0    39   ~ 0
OSC_IN
Wire Wire Line
	5450 6300 5450 6650
Wire Wire Line
	5200 6300 5450 6300
Wire Wire Line
	4650 6300 4900 6300
Wire Wire Line
	4650 6650 4650 6300
Wire Wire Line
	4650 6950 4650 7100
Wire Wire Line
	5450 7100 5450 6950
$Comp
L power:GND #PWR0208
U 1 1 5FD6B2BD
P 5450 7100
F 0 "#PWR0208" H 5450 6850 50  0001 C CNN
F 1 "GND" H 5455 6927 50  0000 C CNN
F 2 "" H 5450 7100 50  0001 C CNN
F 3 "" H 5450 7100 50  0001 C CNN
	1    5450 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0207
U 1 1 5FD6B2B7
P 4650 7100
F 0 "#PWR0207" H 4650 6850 50  0001 C CNN
F 1 "GND" H 4655 6927 50  0000 C CNN
F 2 "" H 4650 7100 50  0001 C CNN
F 3 "" H 4650 7100 50  0001 C CNN
	1    4650 7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C C209
U 1 1 5FD6B2B1
P 5450 6800
F 0 "C209" H 5565 6846 50  0000 L CNN
F 1 "12p" H 5565 6755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5488 6650 50  0001 C CNN
F 3 "~" H 5450 6800 50  0001 C CNN
F 4 "478-11444-1-ND" H 5450 6800 50  0001 C CNN "Digikey"
	1    5450 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:C C208
U 1 1 5FD6B2AB
P 4650 6800
F 0 "C208" H 4765 6846 50  0000 L CNN
F 1 "12p" H 4765 6755 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4688 6650 50  0001 C CNN
F 3 "~" H 4650 6800 50  0001 C CNN
F 4 "478-11444-1-ND" H 4650 6800 50  0001 C CNN "Digikey"
	1    4650 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y201
U 1 1 5FD6B2A5
P 5050 6300
F 0 "Y201" H 5050 6032 50  0000 C CNN
F 1 "Crystal" H 5050 6123 50  0000 C CNN
F 2 "solder_station:Crystal_SMD_Murata_XRCHA-2Pin_2,5x2mm" H 5050 6300 50  0001 C CNN
F 3 "~" H 5050 6300 50  0001 C CNN
F 4 "490-9652-1-ND" H 5050 6300 50  0001 C CNN "Digikey"
	1    5050 6300
	-1   0    0    1   
$EndComp
NoConn ~ 4400 2200
NoConn ~ 4400 2100
Wire Wire Line
	8350 4350 8000 4350
Wire Wire Line
	8350 4650 8000 4650
Wire Wire Line
	8350 4550 8000 4550
$Comp
L solderpi-rescue:Conn_ARM_JTAG_SWD_10-solder_station J401
U 1 1 611A9C60
P 8850 4650
AR Path="/611A9C60" Ref="J401"  Part="1" 
AR Path="/5FD1616A/611A9C60" Ref="J401"  Part="1" 
F 0 "J401" H 8420 4604 50  0000 R CNN
F 1 "Conn_ARM_JTAG_SWD_10" H 8750 5200 50  0000 R CNN
F 2 "Connector:Tag-Connect_TC2050-IDC-FP_2x05_P1.27mm_Vertical" H 8850 4650 50  0001 C CNN
F 3 "http://infocenter.arm.com/help/topic/com.arm.doc.ddi0314h/DDI0314H_coresight_components_trm.pdf" V 8500 3400 50  0001 C CNN
	1    8850 4650
	-1   0    0    -1  
$EndComp
$Comp
L MCU_ST_STM32L4:STM32L496RGTx U201
U 1 1 60006542
P 3800 2900
F 0 "U201" H 3300 4650 50  0000 C CNN
F 1 "STM32L496RGTx" H 4250 1150 50  0000 C CNN
F 2 "Package_QFP:LQFP-64_10x10mm_P0.5mm" H 3200 1200 50  0001 R CNN
F 3 "http://www.st.com/st-web-ui/static/active/en/resource/technical/document/datasheet/DM00284211.pdf" H 3800 2900 50  0001 C CNN
F 4 "497-17173-ND" H 3800 2900 50  0001 C CNN "Digikey"
	1    3800 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 3400 2800 3400
Wire Wire Line
	3100 3500 2800 3500
Text Label 2800 3400 0    39   ~ 0
USART_TX
Text Label 2800 3500 0    39   ~ 0
USART_RX
Wire Wire Line
	8350 4950 8000 4950
Wire Wire Line
	8350 4850 8000 4850
Text Label 8000 4950 0    39   ~ 0
USART_TX
Text Label 8000 4850 0    39   ~ 0
USART_RX
Text Label 8000 4350 0    39   ~ 0
~RESET~
Text Label 8000 4650 0    39   ~ 0
SWDIO
Text Label 8000 4550 0    39   ~ 0
SWDCLK
Text Label 8000 4750 0    39   ~ 0
SWO
$Comp
L power:+3V3 #PWR0411
U 1 1 611E98E4
P 8850 3900
F 0 "#PWR0411" H 8850 3750 50  0001 C CNN
F 1 "+3V3" H 8865 4073 50  0000 C CNN
F 2 "" H 8850 3900 50  0001 C CNN
F 3 "" H 8850 3900 50  0001 C CNN
	1    8850 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8850 4050 8850 3900
Wire Wire Line
	8850 5250 8850 5450
NoConn ~ 8950 5250
$EndSCHEMATC
