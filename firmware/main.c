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
    clock_out_init();
    
    status_led_init();
    status_led_on();

    init_sn76489();
    
    TCCR1A &= 0x00111100;   // Compare Output Mode for channel A
    TCCR1A |= 0x01000000;

    TCCR1B &= 0x11100111;
    TCCR1B |= 0x00001001;

    OCR1AL = 1;

    while(1)
    {
    }
}

/* ------------------------------------------------------------------------- */

void clock_out_init(void)
{
    DDRB |= (1 << PIN1) | (1 << PIN2);
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
