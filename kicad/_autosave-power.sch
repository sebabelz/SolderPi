EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
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
	5250 3950 5250 3850
Connection ~ 5250 3950
Wire Wire Line
	5350 3950 5250 3950
Wire Wire Line
	5350 3850 5350 3950
Wire Wire Line
	5250 4050 5250 3950
$Comp
L power:GND #PWR?
U 1 1 5FD37F7F
P 5250 4050
AR Path="/5FD37F7F" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD37F7F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5250 3800 50  0001 C CNN
F 1 "GND" H 5255 3877 50  0000 C CNN
F 2 "" H 5250 4050 50  0001 C CNN
F 3 "" H 5250 4050 50  0001 C CNN
	1    5250 4050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5FD37F85
P 5900 3750
AR Path="/5FD37F85" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD37F85" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5900 3500 50  0001 C CNN
F 1 "GND" H 5905 3577 50  0000 C CNN
F 2 "" H 5900 3750 50  0001 C CNN
F 3 "" H 5900 3750 50  0001 C CNN
	1    5900 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3350 5900 3750
Wire Wire Line
	5750 3350 5900 3350
$Comp
L Device:R R?
U 1 1 5FD37F8D
P 6300 3500
AR Path="/5FD37F8D" Ref="R?"  Part="1" 
AR Path="/5FD1616A/5FD37F8D" Ref="R?"  Part="1" 
F 0 "R?" H 6230 3454 50  0000 R CNN
F 1 "R" H 6230 3545 50  0000 R CNN
F 2 "" V 6230 3500 50  0001 C CNN
F 3 "~" H 6300 3500 50  0001 C CNN
	1    6300 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:C C?
U 1 1 5FD37F93
P 6750 3500
AR Path="/5FD37F93" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD37F93" Ref="C?"  Part="1" 
F 0 "C?" H 6865 3546 50  0000 L CNN
F 1 "C" H 6865 3455 50  0000 L CNN
F 2 "" H 6788 3350 50  0001 C CNN
F 3 "~" H 6750 3500 50  0001 C CNN
	1    6750 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:L L?
U 1 1 5FD37F99
P 6050 3150
AR Path="/5FD37F99" Ref="L?"  Part="1" 
AR Path="/5FD1616A/5FD37F99" Ref="L?"  Part="1" 
F 0 "L?" V 6240 3150 50  0000 C CNN
F 1 "L" V 6149 3150 50  0000 C CNN
F 2 "" H 6050 3150 50  0001 C CNN
F 3 "~" H 6050 3150 50  0001 C CNN
	1    6050 3150
	0    -1   -1   0   
$EndComp
$Comp
L Device:C C?
U 1 1 5FD37F9F
P 4300 3350
AR Path="/5FD37F9F" Ref="C?"  Part="1" 
AR Path="/5FD1616A/5FD37F9F" Ref="C?"  Part="1" 
F 0 "C?" H 4415 3396 50  0000 L CNN
F 1 "C" H 4415 3305 50  0000 L CNN
F 2 "" H 4338 3200 50  0001 C CNN
F 3 "~" H 4300 3350 50  0001 C CNN
	1    4300 3350
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:TPS62162DSG U?
U 1 1 5FD37FA5
P 5350 3450
AR Path="/5FD37FA5" Ref="U?"  Part="1" 
AR Path="/5FD1616A/5FD37FA5" Ref="U?"  Part="1" 
F 0 "U?" H 5350 4017 50  0000 C CNN
F 1 "TPS62162DSG" H 5350 3926 50  0000 C CNN
F 2 "Package_SON:WSON-8-1EP_2x2mm_P0.5mm_EP0.9x1.6mm_ThermalVias" H 5500 3100 50  0001 L CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps62160.pdf" H 5350 4000 50  0001 C CNN
	1    5350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 3150 5750 3150
Wire Wire Line
	6200 3150 6300 3150
Wire Wire Line
	6300 3150 6300 3250
Wire Wire Line
	5750 3250 6300 3250
Wire Wire Line
	6300 3350 6300 3250
Connection ~ 6300 3250
$Comp
L power:GND #PWR?
U 1 1 5FD42069
P 6300 3750
AR Path="/5FD42069" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD42069" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6300 3500 50  0001 C CNN
F 1 "GND" H 6305 3577 50  0000 C CNN
F 2 "" H 6300 3750 50  0001 C CNN
F 3 "" H 6300 3750 50  0001 C CNN
	1    6300 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 3750 6300 3650
Wire Wire Line
	6300 3150 6750 3150
Wire Wire Line
	6750 3150 6750 3350
Connection ~ 6300 3150
$Comp
L power:GND #PWR?
U 1 1 5FD446C8
P 6750 3750
AR Path="/5FD446C8" Ref="#PWR?"  Part="1" 
AR Path="/5FD1616A/5FD446C8" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6750 3500 50  0001 C CNN
F 1 "GND" H 6755 3577 50  0000 C CNN
F 2 "" H 6750 3750 50  0001 C CNN
F 3 "" H 6750 3750 50  0001 C CNN
	1    6750 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 3650 6750 3750
$EndSCHEMATC
