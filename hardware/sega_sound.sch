EESchema Schematic File Version 4
LIBS:sega_sound-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "Sega Sound with SN76489AN"
Date "2020-01-27"
Rev "1.0"
Comp "Thorsten Kattanek"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:+5V #PWR09
U 1 1 5E271210
P 8650 3950
F 0 "#PWR09" H 8650 3800 50  0001 C CNN
F 1 "+5V" H 8665 4123 50  0000 C CNN
F 2 "" H 8650 3950 50  0001 C CNN
F 3 "" H 8650 3950 50  0001 C CNN
	1    8650 3950
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 5E27218C
P 3950 1950
F 0 "#PWR08" H 3950 1800 50  0001 C CNN
F 1 "+5V" H 3965 2123 50  0000 C CNN
F 2 "" H 3950 1950 50  0001 C CNN
F 3 "" H 3950 1950 50  0001 C CNN
	1    3950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 2200 3900 2150
Wire Wire Line
	3900 2150 3950 2150
Wire Wire Line
	3950 2150 3950 1950
Wire Wire Line
	3950 2150 4000 2150
Wire Wire Line
	4000 2150 4000 2200
Connection ~ 3950 2150
$Comp
L power:GND #PWR012
U 1 1 5E273378
P 3950 5150
F 0 "#PWR012" H 3950 4900 50  0001 C CNN
F 1 "GND" H 3955 4977 50  0000 C CNN
F 2 "" H 3950 5150 50  0001 C CNN
F 3 "" H 3950 5150 50  0001 C CNN
	1    3950 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 5000 3900 5050
Wire Wire Line
	3900 5050 3950 5050
Wire Wire Line
	3950 5050 3950 5150
Wire Wire Line
	3950 5050 4000 5050
Wire Wire Line
	4000 5050 4000 5000
Connection ~ 3950 5050
$Comp
L power:GND #PWR011
U 1 1 5E2743A8
P 8650 4400
F 0 "#PWR011" H 8650 4150 50  0001 C CNN
F 1 "GND" H 8655 4227 50  0000 C CNN
F 2 "" H 8650 4400 50  0001 C CNN
F 3 "" H 8650 4400 50  0001 C CNN
	1    8650 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4050 8650 4050
Wire Wire Line
	8650 4050 8650 3950
Wire Wire Line
	8550 4150 8650 4150
Wire Wire Line
	8650 4150 8650 4400
$Comp
L power:GND #PWR010
U 1 1 5E275910
P 7550 4400
F 0 "#PWR010" H 7550 4150 50  0001 C CNN
F 1 "GND" H 7555 4227 50  0000 C CNN
F 2 "" H 7550 4400 50  0001 C CNN
F 3 "" H 7550 4400 50  0001 C CNN
	1    7550 4400
	1    0    0    -1  
$EndComp
$Sheet
S 8950 3150 950  400 
U 5E27A080
F0 "audio_amplifire" 50
F1 "audio_amplifire.sch" 50
F2 "audio_in" I L 8950 3350 50 
$EndSheet
Wire Wire Line
	8550 3350 8950 3350
$Comp
L Device:R R1
U 1 1 5E27CDAA
P 2950 2200
F 0 "R1" H 3020 2246 50  0000 L CNN
F 1 "47k" H 3020 2155 50  0000 L CNN
F 2 "" V 2880 2200 50  0001 C CNN
F 3 "~" H 2950 2200 50  0001 C CNN
	1    2950 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2350 2950 2500
Wire Wire Line
	2950 2500 3300 2500
$Comp
L power:+5V #PWR07
U 1 1 5E27D79E
P 2950 1950
F 0 "#PWR07" H 2950 1800 50  0001 C CNN
F 1 "+5V" H 2965 2123 50  0000 C CNN
F 2 "" H 2950 1950 50  0001 C CNN
F 3 "" H 2950 1950 50  0001 C CNN
	1    2950 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 1950 2950 2050
Wire Wire Line
	7650 4150 7550 4150
Wire Wire Line
	7550 4150 7550 4400
$Comp
L MCU_Microchip_ATmega:ATmega8-16PU U1
U 1 1 5E276247
P 3900 3600
F 0 "U1" H 3500 4950 50  0000 C CNN
F 1 "ATmega8-16PU" V 3550 3400 50  0000 C CNN
F 2 "Package_DIP:DIP-28_W7.62mm" H 3900 3600 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/atmel-2486-8-bit-avr-microcontroller-atmega8_l_datasheet.pdf" H 3900 3600 50  0001 C CNN
	1    3900 3600
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
Text GLabel 2600 2500 0    50   Input ~ 0
RESET
Text GLabel 1050 7050 0    50   Input ~ 0
RESET
Wire Wire Line
	1050 7050 1250 7050
Wire Wire Line
	2600 2500 2950 2500
Connection ~ 2950 2500
$Comp
L power:+5V #PWR013
U 1 1 5E279685
P 1750 6350
F 0 "#PWR013" H 1750 6200 50  0001 C CNN
F 1 "+5V" H 1765 6523 50  0000 C CNN
F 2 "" H 1750 6350 50  0001 C CNN
F 3 "" H 1750 6350 50  0001 C CNN
	1    1750 6350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5E279E4E
P 1750 7450
F 0 "#PWR015" H 1750 7200 50  0001 C CNN
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
Text GLabel 4650 3000 2    50   Input ~ 0
SCK
Text GLabel 4650 2900 2    50   Input ~ 0
MISO
Text GLabel 4650 2800 2    50   Input ~ 0
MOSI
Wire Wire Line
	4500 2800 4650 2800
Wire Wire Line
	4500 2900 4650 2900
Wire Wire Line
	4500 3000 4650 3000
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
NoConn ~ 4500 2700
NoConn ~ 4500 3400
NoConn ~ 4500 3500
NoConn ~ 4500 3600
NoConn ~ 4500 3700
NoConn ~ 3300 3100
NoConn ~ 3300 2900
NoConn ~ 3300 2700
$Comp
L Device:C C1
U 1 1 5E288481
P 750 1200
F 0 "C1" H 865 1246 50  0000 L CNN
F 1 "100n" H 865 1155 50  0000 L CNN
F 2 "" H 788 1050 50  0001 C CNN
F 3 "~" H 750 1200 50  0001 C CNN
	1    750  1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 5E2889DC
P 750 950
F 0 "#PWR01" H 750 800 50  0001 C CNN
F 1 "+5V" H 765 1123 50  0000 C CNN
F 2 "" H 750 950 50  0001 C CNN
F 3 "" H 750 950 50  0001 C CNN
	1    750  950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5E288DDB
P 750 1450
F 0 "#PWR04" H 750 1200 50  0001 C CNN
F 1 "GND" H 755 1277 50  0000 C CNN
F 2 "" H 750 1450 50  0001 C CNN
F 3 "" H 750 1450 50  0001 C CNN
	1    750  1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	750  950  750  1050
Wire Wire Line
	750  1350 750  1450
$Comp
L Device:C C2
U 1 1 5E28DBD3
P 1200 1200
F 0 "C2" H 1315 1246 50  0000 L CNN
F 1 "100n" H 1315 1155 50  0000 L CNN
F 2 "" H 1238 1050 50  0001 C CNN
F 3 "~" H 1200 1200 50  0001 C CNN
	1    1200 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR02
U 1 1 5E28DBD9
P 1200 950
F 0 "#PWR02" H 1200 800 50  0001 C CNN
F 1 "+5V" H 1215 1123 50  0000 C CNN
F 2 "" H 1200 950 50  0001 C CNN
F 3 "" H 1200 950 50  0001 C CNN
	1    1200 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E28DBDF
P 1200 1450
F 0 "#PWR05" H 1200 1200 50  0001 C CNN
F 1 "GND" H 1205 1277 50  0000 C CNN
F 2 "" H 1200 1450 50  0001 C CNN
F 3 "" H 1200 1450 50  0001 C CNN
	1    1200 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 950  1200 1050
Wire Wire Line
	1200 1350 1200 1450
$Comp
L Device:C C3
U 1 1 5E28EEB8
P 1650 1200
F 0 "C3" H 1765 1246 50  0000 L CNN
F 1 "100n" H 1765 1155 50  0000 L CNN
F 2 "" H 1688 1050 50  0001 C CNN
F 3 "~" H 1650 1200 50  0001 C CNN
	1    1650 1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5E28EEBE
P 1650 950
F 0 "#PWR03" H 1650 800 50  0001 C CNN
F 1 "+5V" H 1665 1123 50  0000 C CNN
F 2 "" H 1650 950 50  0001 C CNN
F 3 "" H 1650 950 50  0001 C CNN
	1    1650 950 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 5E28EEC4
P 1650 1450
F 0 "#PWR06" H 1650 1200 50  0001 C CNN
F 1 "GND" H 1655 1277 50  0000 C CNN
F 2 "" H 1650 1450 50  0001 C CNN
F 3 "" H 1650 1450 50  0001 C CNN
	1    1650 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 950  1650 1050
Wire Wire Line
	1650 1350 1650 1450
Text Notes 650  600  0    50   ~ 0
Abblockkondensatoren (U1, U2)
Text GLabel 4650 3200 2    50   Output ~ 0
SOUND_WE
Text GLabel 4650 3300 2    50   Input ~ 0
SOUND_READY
Text GLabel 7450 4050 0    50   Input ~ 0
SOUND_WE
Text GLabel 7450 4250 0    50   Output ~ 0
SOUND_READY
Wire Wire Line
	7450 4050 7650 4050
Wire Wire Line
	7450 4250 7650 4250
Wire Wire Line
	4650 3200 4500 3200
Wire Wire Line
	4500 3300 4650 3300
$Comp
L Audio_tk:SN76489AN U2
U 1 1 5E29AFF0
P 8100 3600
F 0 "U2" H 8100 4475 50  0000 C CNN
F 1 "SN76489AN" H 8100 4384 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm" H 8100 3600 50  0001 C CNN
F 3 "${TK_DATASHEETS}/SN76489AN_-_Manual.pdf" H 8100 3600 50  0001 C CNN
	1    8100 3600
	1    0    0    -1  
$EndComp
Text GLabel 4650 3900 2    50   Output ~ 0
SOUND_D0
Text GLabel 4650 4000 2    50   Output ~ 0
SOUND_D1
Text GLabel 4650 4100 2    50   Output ~ 0
SOUND_D2
Text GLabel 4650 4200 2    50   Output ~ 0
SOUND_D3
Text GLabel 4650 4300 2    50   Output ~ 0
SOUND_D4
Text GLabel 4650 4400 2    50   Output ~ 0
SOUND_D5
Text GLabel 4650 4500 2    50   Output ~ 0
SOUND_D6
Text GLabel 4650 4600 2    50   Output ~ 0
SOUND_D7
Text GLabel 7550 3150 0    50   Input ~ 0
SOUND_D0
Text GLabel 7550 3250 0    50   Input ~ 0
SOUND_D1
Text GLabel 7550 3350 0    50   Input ~ 0
SOUND_D2
Text GLabel 7550 3450 0    50   Input ~ 0
SOUND_D3
Text GLabel 7550 3550 0    50   Input ~ 0
SOUND_D4
Text GLabel 7550 3650 0    50   Input ~ 0
SOUND_D5
Text GLabel 7550 3750 0    50   Input ~ 0
SOUND_D6
Text GLabel 7550 3850 0    50   Input ~ 0
SOUND_D7
Wire Wire Line
	4500 3900 4650 3900
Wire Wire Line
	4500 4000 4650 4000
Wire Wire Line
	4500 4100 4650 4100
Wire Wire Line
	4500 4200 4650 4200
Wire Wire Line
	4500 4300 4650 4300
Wire Wire Line
	4500 4400 4650 4400
Wire Wire Line
	4500 4500 4650 4500
Wire Wire Line
	4500 4600 4650 4600
Wire Wire Line
	7550 3150 7650 3150
Wire Wire Line
	7550 3250 7650 3250
Wire Wire Line
	7550 3350 7650 3350
Wire Wire Line
	7550 3450 7650 3450
Wire Wire Line
	7550 3550 7650 3550
Wire Wire Line
	7550 3650 7650 3650
Wire Wire Line
	7550 3750 7650 3750
Wire Wire Line
	7550 3850 7650 3850
$Comp
L Device:LED D1
U 1 1 5E289D6B
P 3100 7050
F 0 "D1" V 3047 6933 50  0000 R CNN
F 1 "LED" V 3138 6933 50  0000 R CNN
F 2 "" H 3100 7050 50  0001 C CNN
F 3 "~" H 3100 7050 50  0001 C CNN
	1    3100 7050
	0    1    -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E28CFF4
P 3100 6650
F 0 "R2" H 3170 6696 50  0000 L CNN
F 1 "200" H 3170 6605 50  0000 L CNN
F 2 "" V 3030 6650 50  0001 C CNN
F 3 "~" H 3100 6650 50  0001 C CNN
	1    3100 6650
	-1   0    0    1   
$EndComp
Text GLabel 4650 2500 2    50   Output ~ 0
STATUS_LED
Wire Wire Line
	4500 2500 4650 2500
Text GLabel 3100 6350 1    50   Input ~ 0
STATUS_LED
$Comp
L power:GND #PWR014
U 1 1 5E29C499
P 3100 7350
F 0 "#PWR014" H 3100 7100 50  0001 C CNN
F 1 "GND" H 3105 7177 50  0000 C CNN
F 2 "" H 3100 7350 50  0001 C CNN
F 3 "" H 3100 7350 50  0001 C CNN
	1    3100 7350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3100 7200 3100 7350
Wire Wire Line
	3100 6800 3100 6900
Wire Wire Line
	3100 6350 3100 6500
Text Notes 2750 5750 0    50   ~ 0
System Status LED
Text GLabel 4650 2600 2    50   Output ~ 0
CLOCK_4MHZ
Wire Wire Line
	4500 2600 4650 2600
Text GLabel 7550 2950 0    50   Input ~ 0
CLOCK_4MHZ
Wire Wire Line
	7550 2950 7650 2950
$EndSCHEMATC
