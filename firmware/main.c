/* Name: main.c
 * Projekt: sega_sound
 * Author: Thorsten Kattanek
 * Geändert am: 22.01.2020
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 * Version: 1.0
 */

#define F_CPU   8000000UL
    
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>   /* benötigt von usbdrv.h */

#include "./sn76489.h"

int main(void)
{
    init_sn76489();

    while(1)
    {
    }
}

/* ------------------------------------------------------------------------- */


