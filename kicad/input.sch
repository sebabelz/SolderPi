EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
	3350 4100 3350 4000
Connection ~ 3350 4100
Wire Wire Line
	3450 4100 3350 4100
Wire Wire Line
	3450 4000 3450 4100
Wire Wire Line
	3350 4200 3350 4100
$Comp
L power:GND #PWR?
U 1 1 5FDCB166
P 3350 4200
AR Path="/5FDCB166" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FDCB166" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FDCB166" Ref="#PWR07"  Part="1" 
F 0 "#PWR07" H 3350 3950 50  0001 C CNN
F 1 "GND" H 3355 4027 50  0000 C CNN
F 2 "" H 3350 4200 50  0001 C CNN
F 3 "" H 3350 4200 50  0001 C CNN
	1    3350 4200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FDCB16C
P 4000 3900
AR Path="/5FDCB16C" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FDCB16C" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FDCB16C" Ref="#PWR08"  Part="1" 
F 0 "#PWR08" H 4000 3650 50  0001 C CNN
F 1 "GND" H 4005 3727 50  0000 C CNN
F 2 "" H 4000 3900 50  0001 C CNN
F 3 "" H 4000 3900 50  0001 C CNN
	1    4000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3500 4000 3900
Wire Wire Line
	3850 3500 4000 3500
$Comp
L Device:R R?
U 1 1 5FDCB174
P 4700 3300
AR Path="/5FDCB174" Ref="R?"  Part="1" 
AR Path="/5FD1616A/5FDCB174" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FDCB174" Ref="R1"  Part="1" 
F 0 "R1" H 4630 3254 50  0000 R CNN
F 1 "100k" H 4630 3345 50  0000 R CNN
F 2 "" V 4630 3300 50  0001 C CNN
F 3 "~" H 4700 3300 50  0001 C CNN
	1    4700 3300
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FDCB17A
P 4400 3650
AR Path="/5FDCB17A" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FDCB17A" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FDCB17A" Ref="C4"  Part="1" 
F 0 "C4" H 4515 3696 50  0000 L CNN
F 1 "22µ" H 4515 3605 50  0000 L CNN
F 2 "" H 4438 3500 50  0001 C CNN
F 3 "~" H 4400 3650 50  0001 C CNN
	1    4400 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FDCB180
P 4150 3300
AR Path="/5FDCB180" Ref="L?"  Part="1" 
AR Path="/5FD1616A/5FDCB180" Ref="L?"  Part="1" 
AR Path="/5FD9192A/5FDCB180" Ref="L1"  Part="1" 
F 0 "L1" V 4340 3300 50  0000 C CNN
F 1 "2µ2" V 4249 3300 50  0000 C CNN
F 2 "" H 4150 3300 50  0001 C CNN
F 3 "~" H 4150 3300 50  0001 C CNN
	1    4150 3300
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FDCB186
P 7550 2600
AR Path="/5FDCB186" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FDCB186" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FDCB186" Ref="C7"  Part="1" 
F 0 "C7" H 7665 2646 50  0000 L CNN
F 1 "10n" H 7665 2555 50  0000 L CNN
F 2 "" H 7588 2450 50  0001 C CNN
F 3 "~" H 7550 2600 50  0001 C CNN
	1    7550 2600
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:TPS62162DSG U?
U 1 1 5FDCB18C
P 3450 3600
AR Path="/5FDCB18C" Ref="U?"  Part="1" 
AR Path="/5FD1616A/5FDCB18C" Ref="U?"  Part="1" 
AR Path="/5FD9192A/5FDCB18C" Ref="U2"  Part="1" 
F 0 "U2" H 3450 4167 50  0000 C CNN
F 1 "TPS62162DSG" H 3450 4076 50  0000 C CNN
F 2 "Package_SON:WSON-8-1EP_2x2mm_P0.5mm_EP0.9x1.6mm_ThermalVias" H 3600 3250 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62160.pdf" H 3450 4150 50  0001 C CNN
	1    3450 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3300 3850 3300
Wire Wire Line
	4300 3300 4400 3300
Wire Wire Line
	4400 3300 4400 3400
Wire Wire Line
	3850 3400 4400 3400
Wire Wire Line
	4950 3300 4850 3300
Connection ~ 4400 3300
$Comp
L power:GND #PWR?
U 1 1 5FDCB1A2
P 4400 3900
AR Path="/5FDCB1A2" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FDCB1A2" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FDCB1A2" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 4400 3650 50  0001 C CNN
F 1 "GND" H 4405 3727 50  0000 C CNN
F 2 "" H 4400 3900 50  0001 C CNN
F 3 "" H 4400 3900 50  0001 C CNN
	1    4400 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3800 4400 3900
$Comp
L power:+3V3 #PWR010
U 1 1 5FDCDF81
P 4400 3200
F 0 "#PWR010" H 4400 3050 50  0001 C CNN
F 1 "+3V3" H 4415 3373 50  0000 C CNN
F 2 "" H 4400 3200 50  0001 C CNN
F 3 "" H 4400 3200 50  0001 C CNN
	1    4400 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3300 4400 3200
$Comp
L power:+12V #PWR05
U 1 1 5FDDB1A2
P 2950 3100
F 0 "#PWR05" H 2950 2950 50  0001 C CNN
F 1 "+12V" H 2965 3273 50  0000 C CNN
F 2 "" H 2950 3100 50  0001 C CNN
F 3 "" H 2950 3100 50  0001 C CNN
	1    2950 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3400 2950 3400
Wire Wire Line
	2950 3400 2950 3300
Wire Wire Line
	3050 3300 2950 3300
Connection ~ 2950 3300
Wire Wire Line
	2950 3300 2950 3100
$Comp
L Device:R R?
U 1 1 5FE13802
P 7050 2050
AR Path="/5FE13802" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FE13802" Ref="R3"  Part="1" 
F 0 "R3" V 6843 2050 50  0000 C CNN
F 1 "10k" V 6934 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6980 2050 50  0001 C CNN
F 3 "~" H 7050 2050 50  0001 C CNN
	1    7050 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FE1512D
P 6650 2050
AR Path="/5FE1512D" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FE1512D" Ref="R2"  Part="1" 
F 0 "R2" V 6443 2050 50  0000 C CNN
F 1 "10k" V 6534 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6580 2050 50  0001 C CNN
F 3 "~" H 6650 2050 50  0001 C CNN
	1    6650 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD0CCA6
P 7300 2350
AR Path="/5FD0CCA6" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD0CCA6" Ref="R8"  Part="1" 
F 0 "R8" V 7093 2350 50  0000 C CNN
F 1 "10k" V 7184 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7230 2350 50  0001 C CNN
F 3 "~" H 7300 2350 50  0001 C CNN
	1    7300 2350
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FD123DE
P 6400 2350
AR Path="/5FD123DE" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD123DE" Ref="R4"  Part="1" 
F 0 "R4" V 6193 2350 50  0000 C CNN
F 1 "10k" V 6284 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6330 2350 50  0001 C CNN
F 3 "~" H 6400 2350 50  0001 C CNN
	1    6400 2350
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FD16D12
P 6150 2600
AR Path="/5FD16D12" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD16D12" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD16D12" Ref="C6"  Part="1" 
F 0 "C6" H 6265 2646 50  0000 L CNN
F 1 "10n" H 6265 2555 50  0000 L CNN
F 2 "" H 6188 2450 50  0001 C CNN
F 3 "~" H 6150 2600 50  0001 C CNN
	1    6150 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 2350 6150 2350
Wire Wire Line
	6150 2350 6150 2450
Wire Wire Line
	6550 2350 6650 2350
Wire Wire Line
	6650 2350 6650 2200
Wire Wire Line
	6750 2450 6750 2350
Wire Wire Line
	6750 2350 6650 2350
Connection ~ 6650 2350
Wire Wire Line
	6950 2450 6950 2350
Wire Wire Line
	6950 2350 7050 2350
Wire Wire Line
	7050 2350 7050 2200
Wire Wire Line
	7150 2350 7050 2350
Connection ~ 7050 2350
Wire Wire Line
	7450 2350 7550 2350
Wire Wire Line
	7550 2350 7550 2450
Wire Wire Line
	7550 2750 7550 2850
Wire Wire Line
	6850 2850 6850 2800
Wire Wire Line
	6150 2750 6150 2850
Wire Wire Line
	6150 2850 6850 2850
Connection ~ 6850 2850
$Comp
L power:GND #PWR?
U 1 1 5FD2880A
P 6850 2950
AR Path="/5FD2880A" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD2880A" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD2880A" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 6850 2700 50  0001 C CNN
F 1 "GND" H 6855 2777 50  0000 C CNN
F 2 "" H 6850 2950 50  0001 C CNN
F 3 "" H 6850 2950 50  0001 C CNN
	1    6850 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2850 6850 2850
Wire Wire Line
	6850 2950 6850 2850
$Comp
L Device:R R?
U 1 1 5FD2B94B
P 8400 2000
AR Path="/5FD2B94B" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD2B94B" Ref="R10"  Part="1" 
F 0 "R10" V 8193 2000 50  0000 C CNN
F 1 "10k" V 8284 2000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8330 2000 50  0001 C CNN
F 3 "~" H 8400 2000 50  0001 C CNN
	1    8400 2000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD2BE05
P 8750 2350
AR Path="/5FD2BE05" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD2BE05" Ref="R12"  Part="1" 
F 0 "R12" V 8543 2350 50  0000 C CNN
F 1 "10k" V 8634 2350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8680 2350 50  0001 C CNN
F 3 "~" H 8750 2350 50  0001 C CNN
	1    8750 2350
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 2450 8400 2350
Wire Wire Line
	8600 2350 8400 2350
Connection ~ 8400 2350
Wire Wire Line
	8400 2350 8400 2150
$Comp
L Device:C C?
U 1 1 5FD2E9D6
P 9150 2550
AR Path="/5FD2E9D6" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD2E9D6" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD2E9D6" Ref="C10"  Part="1" 
F 0 "C10" H 9265 2596 50  0000 L CNN
F 1 "10n" H 9265 2505 50  0000 L CNN
F 2 "" H 9188 2400 50  0001 C CNN
F 3 "~" H 9150 2550 50  0001 C CNN
	1    9150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 2350 9150 2350
Wire Wire Line
	9150 2350 9150 2400
Wire Wire Line
	9150 2700 9150 2800
Wire Wire Line
	9150 2800 8400 2800
Wire Wire Line
	8400 2800 8400 2700
$Comp
L power:GND #PWR?
U 1 1 5FD3060B
P 8400 2900
AR Path="/5FD3060B" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD3060B" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD3060B" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 8400 2650 50  0001 C CNN
F 1 "GND" H 8405 2727 50  0000 C CNN
F 2 "" H 8400 2900 50  0001 C CNN
F 3 "" H 8400 2900 50  0001 C CNN
	1    8400 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 2900 8400 2800
Connection ~ 8400 2800
$Comp
L power:+3V3 #PWR0103
U 1 1 5FD352C2
P 6650 1750
F 0 "#PWR0103" H 6650 1600 50  0001 C CNN
F 1 "+3V3" H 6665 1923 50  0000 C CNN
F 2 "" H 6650 1750 50  0001 C CNN
F 3 "" H 6650 1750 50  0001 C CNN
	1    6650 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0104
U 1 1 5FD3646F
P 7050 1750
F 0 "#PWR0104" H 7050 1600 50  0001 C CNN
F 1 "+3V3" H 7065 1923 50  0000 C CNN
F 2 "" H 7050 1750 50  0001 C CNN
F 3 "" H 7050 1750 50  0001 C CNN
	1    7050 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0105
U 1 1 5FD369D3
P 8400 1750
F 0 "#PWR0105" H 8400 1600 50  0001 C CNN
F 1 "+3V3" H 8415 1923 50  0000 C CNN
F 2 "" H 8400 1750 50  0001 C CNN
F 3 "" H 8400 1750 50  0001 C CNN
	1    8400 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 1850 8400 1750
Wire Wire Line
	7050 1750 7050 1900
Wire Wire Line
	6650 1750 6650 1900
$Comp
L Device:C C?
U 1 1 5FD52804
P 7550 4650
AR Path="/5FD52804" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD52804" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD52804" Ref="C9"  Part="1" 
F 0 "C9" H 7665 4696 50  0000 L CNN
F 1 "10n" H 7665 4605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 7588 4500 50  0001 C CNN
F 3 "~" H 7550 4650 50  0001 C CNN
	1    7550 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD5280A
P 7050 4100
AR Path="/5FD5280A" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD5280A" Ref="R7"  Part="1" 
F 0 "R7" V 6843 4100 50  0000 C CNN
F 1 "10k" V 6934 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6980 4100 50  0001 C CNN
F 3 "~" H 7050 4100 50  0001 C CNN
	1    7050 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD52810
P 6650 4100
AR Path="/5FD52810" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD52810" Ref="R6"  Part="1" 
F 0 "R6" V 6443 4100 50  0000 C CNN
F 1 "10k" V 6534 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6580 4100 50  0001 C CNN
F 3 "~" H 6650 4100 50  0001 C CNN
	1    6650 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD52822
P 7300 4400
AR Path="/5FD52822" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD52822" Ref="R9"  Part="1" 
F 0 "R9" V 7093 4400 50  0000 C CNN
F 1 "10k" V 7184 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 7230 4400 50  0001 C CNN
F 3 "~" H 7300 4400 50  0001 C CNN
	1    7300 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 5FD52828
P 6400 4400
AR Path="/5FD52828" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD52828" Ref="R5"  Part="1" 
F 0 "R5" V 6193 4400 50  0000 C CNN
F 1 "10k" V 6284 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 6330 4400 50  0001 C CNN
F 3 "~" H 6400 4400 50  0001 C CNN
	1    6400 4400
	0    1    1    0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FD5282E
P 6150 4650
AR Path="/5FD5282E" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD5282E" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD5282E" Ref="C8"  Part="1" 
F 0 "C8" H 6265 4696 50  0000 L CNN
F 1 "10n" H 6265 4605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6188 4500 50  0001 C CNN
F 3 "~" H 6150 4650 50  0001 C CNN
	1    6150 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4400 6150 4400
Wire Wire Line
	6150 4400 6150 4500
Wire Wire Line
	6550 4400 6650 4400
Wire Wire Line
	6650 4400 6650 4250
Wire Wire Line
	6750 4500 6750 4400
Wire Wire Line
	6750 4400 6650 4400
Connection ~ 6650 4400
Wire Wire Line
	6950 4500 6950 4400
Wire Wire Line
	6950 4400 7050 4400
Wire Wire Line
	7050 4400 7050 4250
Wire Wire Line
	7150 4400 7050 4400
Connection ~ 7050 4400
Wire Wire Line
	7450 4400 7550 4400
Wire Wire Line
	7550 4400 7550 4500
Wire Wire Line
	7550 4800 7550 4900
Wire Wire Line
	6850 4900 6850 4850
Wire Wire Line
	6150 4800 6150 4900
Wire Wire Line
	6150 4900 6850 4900
Connection ~ 6850 4900
$Comp
L power:GND #PWR?
U 1 1 5FD52847
P 6850 5000
AR Path="/5FD52847" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD52847" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD52847" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 6850 4750 50  0001 C CNN
F 1 "GND" H 6855 4827 50  0000 C CNN
F 2 "" H 6850 5000 50  0001 C CNN
F 3 "" H 6850 5000 50  0001 C CNN
	1    6850 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4900 6850 4900
Wire Wire Line
	6850 5000 6850 4900
$Comp
L Device:R R?
U 1 1 5FD5284F
P 8400 4050
AR Path="/5FD5284F" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD5284F" Ref="R11"  Part="1" 
F 0 "R11" V 8193 4050 50  0000 C CNN
F 1 "10k" V 8284 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8330 4050 50  0001 C CNN
F 3 "~" H 8400 4050 50  0001 C CNN
	1    8400 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5FD52855
P 8750 4400
AR Path="/5FD52855" Ref="R?"  Part="1" 
AR Path="/5FD9192A/5FD52855" Ref="R13"  Part="1" 
F 0 "R13" V 8543 4400 50  0000 C CNN
F 1 "10k" V 8634 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8680 4400 50  0001 C CNN
F 3 "~" H 8750 4400 50  0001 C CNN
	1    8750 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	8400 4500 8400 4400
Wire Wire Line
	8600 4400 8400 4400
Connection ~ 8400 4400
Wire Wire Line
	8400 4400 8400 4200
$Comp
L Device:C C?
U 1 1 5FD5285F
P 9150 4600
AR Path="/5FD5285F" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD5285F" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD5285F" Ref="C11"  Part="1" 
F 0 "C11" H 9265 4646 50  0000 L CNN
F 1 "10n" H 9265 4555 50  0000 L CNN
F 2 "" H 9188 4450 50  0001 C CNN
F 3 "~" H 9150 4600 50  0001 C CNN
	1    9150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 4400 9150 4400
Wire Wire Line
	9150 4400 9150 4450
Wire Wire Line
	9150 4750 9150 4850
Wire Wire Line
	9150 4850 8400 4850
Wire Wire Line
	8400 4850 8400 4750
$Comp
L power:GND #PWR?
U 1 1 5FD5286A
P 8400 4950
AR Path="/5FD5286A" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD5286A" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD5286A" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 8400 4700 50  0001 C CNN
F 1 "GND" H 8405 4777 50  0000 C CNN
F 2 "" H 8400 4950 50  0001 C CNN
F 3 "" H 8400 4950 50  0001 C CNN
	1    8400 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 4950 8400 4850
Connection ~ 8400 4850
$Comp
L power:+3V3 #PWR0108
U 1 1 5FD52872
P 6650 3800
F 0 "#PWR0108" H 6650 3650 50  0001 C CNN
F 1 "+3V3" H 6665 3973 50  0000 C CNN
F 2 "" H 6650 3800 50  0001 C CNN
F 3 "" H 6650 3800 50  0001 C CNN
	1    6650 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0109
U 1 1 5FD52878
P 7050 3800
F 0 "#PWR0109" H 7050 3650 50  0001 C CNN
F 1 "+3V3" H 7065 3973 50  0000 C CNN
F 2 "" H 7050 3800 50  0001 C CNN
F 3 "" H 7050 3800 50  0001 C CNN
	1    7050 3800
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR0110
U 1 1 5FD5287E
P 8400 3800
F 0 "#PWR0110" H 8400 3650 50  0001 C CNN
F 1 "+3V3" H 8415 3973 50  0000 C CNN
F 2 "" H 8400 3800 50  0001 C CNN
F 3 "" H 8400 3800 50  0001 C CNN
	1    8400 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8400 3900 8400 3800
Wire Wire Line
	7050 3800 7050 3950
Wire Wire Line
	6650 3800 6650 3950
Text GLabel 4950 3300 2    50   Output ~ 0
PG
Text GLabel 3000 3700 0    50   Input ~ 0
PG
Wire Wire Line
	4550 3300 4400 3300
Wire Wire Line
	3000 3700 3050 3700
Connection ~ 4400 3400
Wire Wire Line
	4400 3400 4400 3500
$Comp
L Device:C C?
U 1 1 5FD8D87F
P 2400 3450
AR Path="/5FD8D87F" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD8D87F" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD8D87F" Ref="C5"  Part="1" 
F 0 "C5" H 2515 3496 50  0000 L CNN
F 1 "10µ" H 2515 3405 50  0000 L CNN
F 2 "" H 2438 3300 50  0001 C CNN
F 3 "~" H 2400 3450 50  0001 C CNN
	1    2400 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0111
U 1 1 5FD963F9
P 2400 3100
F 0 "#PWR0111" H 2400 2950 50  0001 C CNN
F 1 "+12V" H 2415 3273 50  0000 C CNN
F 2 "" H 2400 3100 50  0001 C CNN
F 3 "" H 2400 3100 50  0001 C CNN
	1    2400 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3100 2400 3300
$Comp
L power:GND #PWR?
U 1 1 5FD988A4
P 2400 3750
AR Path="/5FD988A4" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD988A4" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD988A4" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 2400 3500 50  0001 C CNN
F 1 "GND" H 2405 3577 50  0000 C CNN
F 2 "" H 2400 3750 50  0001 C CNN
F 3 "" H 2400 3750 50  0001 C CNN
	1    2400 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 3600 2400 3750
$Comp
L power:GND #PWR?
U 1 1 5FD9B361
P 3550 4200
AR Path="/5FD9B361" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD9B361" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD9B361" Ref="#PWR0113"  Part="1" 
F 0 "#PWR0113" H 3550 3950 50  0001 C CNN
F 1 "GND" H 3555 4027 50  0000 C CNN
F 2 "" H 3550 4200 50  0001 C CNN
F 3 "" H 3550 4200 50  0001 C CNN
	1    3550 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 4200 3550 4000
Wire Wire Line
	9150 4850 9500 4850
Connection ~ 9150 4850
Wire Wire Line
	9600 4750 9500 4750
Wire Wire Line
	9500 4750 9500 4850
Connection ~ 9500 4850
Wire Wire Line
	9500 4850 9600 4850
Wire Wire Line
	9600 2700 9500 2700
Wire Wire Line
	9500 2700 9500 2800
Wire Wire Line
	9500 2800 9600 2800
Wire Wire Line
	9500 2800 9150 2800
Connection ~ 9500 2800
Connection ~ 9150 2800
$Comp
L solder_station:ROT_ENC_SWITCH SW1
U 3 1 5FD84206
P 9600 2750
F 0 "SW1" H 9753 2808 50  0000 L CNN
F 1 "ROT_ENC_SWITCH" H 9753 2717 50  0000 L CNN
F 2 "" H 9500 2825 50  0001 C CNN
F 3 "" H 9500 2825 50  0001 C CNN
	3    9600 2750
	1    0    0    -1  
$EndComp
$Comp
L solder_station:ROT_ENC_SWITCH SW1
U 2 1 5FD860A3
P 8400 2600
F 0 "SW1" H 8444 2671 50  0000 L CNN
F 1 "ROT_ENC_SWITCH" H 8444 2580 50  0000 L CNN
F 2 "" H 8300 2675 50  0001 C CNN
F 3 "" H 8300 2675 50  0001 C CNN
	2    8400 2600
	1    0    0    -1  
$EndComp
$Comp
L solder_station:ROT_ENC_SWITCH SW1
U 1 1 5FD87203
P 6850 2600
F 0 "SW1" H 7028 2621 50  0000 L CNN
F 1 "ROT_ENC_SWITCH" H 7028 2530 50  0000 L CNN
F 2 "" H 6750 2675 50  0001 C CNN
F 3 "" H 6750 2675 50  0001 C CNN
	1    6850 2600
	1    0    0    -1  
$EndComp
$Comp
L solder_station:ROT_ENC_SWITCH SW2
U 1 1 5FD89A20
P 6850 4650
F 0 "SW2" H 7028 4671 50  0000 L CNN
F 1 "ROT_ENC_SWITCH" H 7028 4580 50  0000 L CNN
F 2 "" H 6750 4725 50  0001 C CNN
F 3 "" H 6750 4725 50  0001 C CNN
	1    6850 4650
	1    0    0    -1  
$EndComp
$Comp
L solder_station:ROT_ENC_SWITCH SW2
U 2 1 5FD8A8A7
P 8400 4650
F 0 "SW2" H 8444 4721 50  0000 L CNN
F 1 "ROT_ENC_SWITCH" H 8444 4630 50  0000 L CNN
F 2 "" H 8300 4725 50  0001 C CNN
F 3 "" H 8300 4725 50  0001 C CNN
	2    8400 4650
	1    0    0    -1  
$EndComp
$Comp
L solder_station:ROT_ENC_SWITCH SW2
U 3 1 5FD8BA9C
P 9600 4800
F 0 "SW2" H 9753 4858 50  0000 L CNN
F 1 "ROT_ENC_SWITCH" H 9753 4767 50  0000 L CNN
F 2 "" H 9500 4875 50  0001 C CNN
F 3 "" H 9500 4875 50  0001 C CNN
	3    9600 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 5FD04CFF
P 1750 3450
AR Path="/5FD04CFF" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD04CFF" Ref="C?"  Part="1" 
AR Path="/5FD9192A/5FD04CFF" Ref="C?"  Part="1" 
F 0 "C?" H 1868 3496 50  0000 L CNN
F 1 "470µ" H 1868 3405 50  0000 L CNN
F 2 "" H 1788 3300 50  0001 C CNN
F 3 "~" H 1750 3450 50  0001 C CNN
	1    1750 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 5FD04D05
P 1750 3100
F 0 "#PWR?" H 1750 2950 50  0001 C CNN
F 1 "+12V" H 1765 3273 50  0000 C CNN
F 2 "" H 1750 3100 50  0001 C CNN
F 3 "" H 1750 3100 50  0001 C CNN
	1    1750 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD04D0B
P 1750 3750
AR Path="/5FD04D0B" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD04D0B" Ref="#PWR?"  Part="1" 
AR Path="/5FD9192A/5FD04D0B" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1750 3500 50  0001 C CNN
F 1 "GND" H 1755 3577 50  0000 C CNN
F 2 "" H 1750 3750 50  0001 C CNN
F 3 "" H 1750 3750 50  0001 C CNN
	1    1750 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3750 1750 3700
Wire Wire Line
	1750 3300 1750 3150
$Comp
L solder_station:CON_ULTRAFIT J?
U 1 1 5FD04D13
P 1200 3450
F 0 "J?" V 1038 3492 50  0000 C CNN
F 1 "CON_ULTRAFIT" V 1037 3492 50  0001 C CNN
F 2 "" H 1200 3450 50  0001 C CNN
F 3 "" H 1200 3450 50  0001 C CNN
	1    1200 3450
	0    -1   1    0   
$EndComp
Wire Wire Line
	1250 3400 1350 3400
Wire Wire Line
	1350 3400 1350 3150
Wire Wire Line
	1350 3150 1750 3150
Connection ~ 1750 3150
Wire Wire Line
	1750 3150 1750 3100
Wire Wire Line
	1250 3500 1350 3500
Wire Wire Line
	1350 3500 1350 3700
Wire Wire Line
	1350 3700 1750 3700
Connection ~ 1750 3700
Wire Wire Line
	1750 3700 1750 3600
Text HLabel 7550 2250 1    50   Input ~ 0
ENC1_B
Text HLabel 6150 2250 1    50   Input ~ 0
ENC1_A
Text HLabel 9250 2350 2    50   Input ~ 0
ENC1_SW
Text HLabel 9250 4400 2    50   Input ~ 0
ENC2_SW
Text HLabel 7550 4300 1    50   Input ~ 0
ENC2_B
Text HLabel 6150 4300 1    50   Input ~ 0
ENC2_A
Wire Wire Line
	7550 4400 7550 4300
Connection ~ 7550 4400
Wire Wire Line
	9150 4400 9250 4400
Connection ~ 9150 4400
Wire Wire Line
	6150 4400 6150 4300
Connection ~ 6150 4400
Wire Wire Line
	9150 2350 9250 2350
Connection ~ 9150 2350
Wire Wire Line
	7550 2250 7550 2350
Connection ~ 7550 2350
Wire Wire Line
	6150 2250 6150 2350
Connection ~ 6150 2350
$EndSCHEMATC
