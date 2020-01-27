/* Name: main.c
 * Projekt: sega_sound
 * Author: Thorsten Kattanek
 * Geändert am: 22.01.2020
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 * Version: 1.0
 */
    
#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>   /* benötigt von usbdrv.h */

#include "./main.h"
#include "./sn76489.h"

int main(void)
{    
    status_led_init();
    status_led_on();

    init_sn76489();
    
    clock_out_init();
    
    while(1)
    {
    }
}

/* ------------------------------------------------------------------------- */

void clock_out_init(void)
{
    DDRB |= 1 << PIN1;
    
    TCCR1A |= (1 << COM1A0);            //toggle OC1A
    TCCR1B |= (1 << WGM12)|(1 << CS10); //CTC,  div64
    TCNT1 = 0;                          //unnecessary
    OCR1A = 0 ;    //toggle @ 8MHz -> 4MHz Clock
}

void status_led_init(void)
{
    STATUS_LED_PORT |= 1 << STATUS_LED_PIN;
}

void status_led_on(void)
{
    // PIN as source
    STATUS_LED_DDR |= 1 << STATUS_LED_PIN;
}

void status_led_off(void)
{
    // PIN as HiZ
    STATUS_LED_DDR &= ~(1 << STATUS_LED_PIN);
}
