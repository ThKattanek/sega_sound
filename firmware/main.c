/* Name: main.c
 * Projekt: sega_sound
 * Author: Thorsten Kattanek
 * Geändert am: 21.01.2020
 * Copyright: Thorsten Kattanek
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 * Version: 1.0
 */

#define F_CPU   8000000UL
    
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>   /* benötigt von usbdrv.h */

/* PinOut
PIN_2  PortD_0 -> D0 Sound_Chip
PIN_3  PortD_1 -> D1 Sound_Chip
PIN_4  PortD_2 -> D2 Sound_Chip
PIN_5  PortD_3 -> D3 Sound_Chip
PIN_6  PortD_4 -> D4 Sound_Chip
PIN_11 PortD_5 -> D5 Sound_Chip
PIN_12 PortD_6 -> D6 Sound_Chip
PIN_13 PortD_7 -> D7 Sound_Chip

PIN_23 PortC_0 -> WE Sound_Chip
PIN_24 PortC_1 <- READY Sound_Chip
*/

void init_sound_chip();

int main(void)
{
    init_sound_chip();

    while(1)
    {
    }
}

/* ------------------------------------------------------------------------- */

void init_sound_chip()
{
    // Init all IO Ports to Soundchip

    // Datalines
    DDRD = 0xff;    // all port_d io pins as output
    PORTD = 0x00;   // all dataline to low

    // WE Line
    DDRC |= 0x01;   // pin0 as output
    PORTC &= ~0x01; // WE to low

    // READY Line
    DDRC &= ~0x02;  // pin1 as input with enable pullup
    PORTC |= 0x02;
}
