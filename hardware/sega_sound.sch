EESchema Schematic File Version 4
LIBS:sega_sound-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Sega Sound with SN76489AN"
Date "2020-01-21"
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR03
U 1 1 5E271210
P 7250 4400
F 0 "#PWR03" H 7250 4250 50  0001 C CNN
F 1 "+5V" H 7265 4573 50  0000 C CNN
F 2 "" H 7250 4400 50  0001 C CNN
F 3 "" H 7250 4400 50  0001 C CNN
	1    7250 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5E27218C
P 4600 1650
F 0 "#PWR02" H 4600 1500 50  0001 C CNN
F 1 "+5V" H 4615 1823 50  0000 C CNN
F 2 "" H 4600 1650 50  0001 C CNN
F 3 "" H 4600 1650 50  0001 C CNN
	1    4600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1900 4550 1850
Wire Wire Line
	4550 1850 4600 1850
Wire Wire Line
	4600 1850 4600 1650
Wire Wire Line
	4600 1850 4650 1850
Wire Wire Line
	4650 1850 4650 1900
Connection ~ 4600 1850
$Comp
L power:GND #PWR04
U 1 1 5E273378
P 4600 4850
F 0 "#PWR04" H 4600 4600 50  0001 C CNN
F 1 "GND" H 4605 4677 50  0000 C CNN
F 2 "" H 4600 4850 50  0001 C CNN
F 3 "" H 4600 4850 50  0001 C CNN
	1    4600 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 4700 4550 4750
Wire Wire Line
	4550 4750 4600 4750
Wire Wire Line
	4600 4750 4600 4850
Wire Wire Line
	4600 4750 4650 4750
Wire Wire Line
	4650 4750 4650 4700
Connection ~ 4600 4750
$Comp
L power:GND #PWR06
U 1 1 5E2743A8
P 7250 4850
F 0 "#PWR06" H 7250 4600 50  0001 C CNN
F 1 "GND" H 7255 4677 50  0000 C CNN
F 2 "" H 7250 4850 50  0001 C CNN
F 3 "" H 7250 4850 50  0001 C CNN
	1    7250 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4500 7250 4500
Wire Wire Line
	7250 4500 7250 4400
Wire Wire Line
	7150 4600 7250 4600
Wire Wire Line
	7250 4600 7250 4850
$Comp
L power:GND #PWR05
U 1 1 5E275910
P 6150 4850
F 0 "#PWR05" H 6150 4600 50  0001 C CNN
F 1 "GND" H 6155 4677 50  0000 C CNN
F 2 "" H 6150 4850 50  0001 C CNN
F 3 "" H 6150 4850 50  0001 C CNN
	1    6150 4850
	1    0    0    -1  
$EndComp
$Sheet
S 7550 3600 950  400 
U 5E27A080
F0 "audio_amplifire" 50
F1 "audio_amplifire.sch" 50
F2 "audio_in" I L 7550 3800 50 
$EndSheet
Wire Wire Line
	7150 3800 7550 3800
$Comp
L Device:R R1
U 1 1 5E27CDAA
P 3600 1900
F 0 "R1" H 3670 1946 50  0000 L CNN
F 1 "47k" H 3670 1855 50  0000 L CNN
F 2 "" V 3530 1900 50  0001 C CNN
F 3 "~" H 3600 1900 50  0001 C CNN
	1    3600 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2050 3600 2200
Wire Wire Line
	3600 2200 3950 2200
$Comp
L power:+5V #PWR01
U 1 1 5E27D79E
P 3600 1650
F 0 "#PWR01" H 3600 1500 50  0001 C CNN
F 1 "+5V" H 3615 1823 50  0000 C CNN
F 2 "" H 3600 1650 50  0001 C CNN
F 3 "" H 3600 1650 50  0001 C CNN
	1    3600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1650 3600 1750
Wire Wire Line
	5850 4500 5850 2900
Wire Wire Line
	5850 2900 5150 2900
Wire Wire Line
	6250 4600 6150 4600
Wire Wire Line
	6250 4500 5850 4500
Wire Wire Line
	6250 4300 5150 4300
Wire Wire Line
	5150 4200 6250 4200
Wire Wire Line
	6250 4100 5150 4100
Wire Wire Line
	5150 4000 6250 4000
Wire Wire Line
	6250 3900 5150 3900
Wire Wire Line
	5150 3800 6250 3800
Wire Wire Line
	6250 3700 5150 3700
Wire Wire Line
	5150 3600 6250 3600
Wire Wire Line
	6150 4600 6150 4850
$Comp
L Audio_tk:SN76489AN U2
U 1 1 5E26D3F3
P 6700 4050
F 0 "U2" H 6700 4925 50  0000 C CNN
F 1 "SN76489AN" H 6700 4834 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 6700 4050 50  0001 C CNN
F 3 "${TK_DATASHEETS}/SN76489AN_-_Manual.pdf" H 6700 4050 50  0001 C CNN
	1    6700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 4700 5750 4700
Wire Wire Line
	5750 4700 5750 3000
Wire Wire Line
	5750 3000 5150 3000
$Comp
L MCU_Microchip_ATmega:ATmega8-16PU U1
U 1 1 5E276247
P 4550 3300
F 0 "U1" H 4150 4650 50  0000 C CNN
F 1 "ATmega8-16PU" V 4200 3100 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 4550 3300 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2486-8-bit-avr-microcontroller-atmega8_l_datasheet.pdf" H 4550 3300 50  0001 C CNN
	1    4550 3300
	1    0    0    -1  
$EndComp
$Comp
L Connector:AVR-ISP-6 J1
U 1 1 5E274AFE
P 1650 6950
F 0 "J1" H 1370 7046 50  0000 R CNN
F 1 "AVR-ISP-6" H 1370 6955 50  0000 R CNN
F 2 "" V 1400 7000 50  0001 C CNN
F 3 " ~" H 375 6400 50  0001 C CNN
	1    1650 6950
	-1   0    0    -1  
$EndComp
Text GLabel 3250 2200 0    50   Input ~ 0
RESET
Text GLabel 1050 7050 0    50   Input ~ 0
RESET
Wire Wire Line
	1050 7050 1250 7050
Wire Wire Line
	3250 2200 3600 2200
Connection ~ 3600 2200
$Comp
L power:+5V #PWR07
U 1 1 5E279685
P 1750 6350
F 0 "#PWR07" H 1750 6200 50  0001 C CNN
F 1 "+5V" H 1765 6523 50  0000 C CNN
F 2 "" H 1750 6350 50  0001 C CNN
F 3 "" H 1750 6350 50  0001 C CNN
	1    1750 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E279E4E
P 1750 7450
F 0 "#PWR08" H 1750 7200 50  0001 C CNN
F 1 "GND" H 1755 7277 50  0000 C CNN
F 2 "" H 1750 7450 50  0001 C CNN
F 3 "" H 1750 7450 50  0001 C CNN
	1    1750 7450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 7350 1750 7450
Wire Wire Line
	1750 6350 1750 6450
Text GLabel 5300 2700 2    50   Input ~ 0
SCK
Text GLabel 5300 2600 2    50   Input ~ 0
MISO
Text GLabel 5300 2500 2    50   Input ~ 0
MOSI
Wire Wire Line
	5150 2500 5300 2500
Wire Wire Line
	5150 2600 5300 2600
Wire Wire Line
	5150 2700 5300 2700
Text GLabel 1050 6850 0    50   Input ~ 0
MOSI
Text GLabel 1050 6750 0    50   Input ~ 0
MISO
Text GLabel 1050 6950 0    50   Input ~ 0
SCK
Wire Wire Line
	1050 6750 1250 6750
Wire Wire Line
	1050 6850 1250 6850
Wire Wire Line
	1050 6950 1250 6950
Text Notes 1200 6000 0    50   ~ 0
ISP (6 Pin Connector)
NoConn ~ 5150 2200
NoConn ~ 5150 2300
NoConn ~ 5150 2400
NoConn ~ 5150 3100
NoConn ~ 5150 3200
NoConn ~ 5150 3300
NoConn ~ 5150 3400
NoConn ~ 3950 2800
NoConn ~ 3950 2600
NoConn ~ 3950 2400
NoConn ~ 6250 3400
$EndSCHEMATC
