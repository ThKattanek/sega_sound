/* Name: main.c
 * Projekt: sega_sound
 * Author: Thorsten Kattanek
 * Geändert am: 22.01.2020
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 * Version: 1.0
 */
    
#define F_CPU 8000000UL

//const unsigned char streaming_data[];
//const int streaming_data_length = 3007;

#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>
#include <util/delay.h>
#include <avr/pgmspace.h>   /* benötigt von usbdrv.h */

#include "./sonic_title_vgm.h"

#include "./main.h"
#include "./sn76489.h"

int main(void)
{    
    status_led_init();
    status_led_off();

    init_sn76489();
    
    clock_out_init();
        
    set_sn76489_volume(0,0);
    set_sn76489_volume(1,0);
    set_sn76489_volume(2,0);
    set_sn76489_volume(3,0);

    set_sn76489_volume(2,15);
    set_sn76489_frequency(2,440);
    
    status_led_on();
    
    volatile uint16_t streaming_pos = 0;
    
    uint8_t     is_playing = 1;
    uint8_t     samples_waiting = 0;
    uint32_t    samples_wait_counter;

    uint8_t command;
    uint16_t value16;
    uint8_t value8;
    
    while(1)
    {
        if(is_playing)
        {
            if(samples_waiting)
            {
                samples_wait_counter--;
                if(samples_wait_counter == 0)
                    samples_waiting = 0;
            }
            else
            {
                while(!samples_waiting && is_playing)
                {
                   // if(streaming_pos >= streaming_data_length)
                   //     streaming_pos = 0;
                    
                    // Next Streaming Command
                    command = pgm_read_byte(&streaming_data[streaming_pos++]);

                    switch(command)
                    {
                    // 0x4F dd    : Game Gear PSG stereo, write dd to port 0x06
                    case 0x4f:
                        streaming_pos += 1;
                    break;
                    // 0x50 dd    : PSG (SN76489/SN76496) write value dd
                    case 0x50:
                        write_sn76489(pgm_read_byte(&streaming_data[streaming_pos]));
                        streaming_pos ++;
                    break;
                    // 0x61 nn nn : Wait n samples, n can range from 0 to 65535 (approx 1.49 seconds).
                    // Longer pauses than this are represented by multiple wait commands.
                    case 0x61:
                        value16 = (uint16_t)(pgm_read_byte(&streaming_data[streaming_pos+1])) << 8;
                        value16 |= (uint16_t)pgm_read_byte(&streaming_data[streaming_pos]);
                        samples_waiting = 1;
                        samples_wait_counter = value16;
                        samples_wait_counter--;
                        streaming_pos += 2;
                        break;
                    // 0x62       : wait 735 samples (60th of a second), a shortcut for 0x61 0xdf 0x02
                    case 0x62:
                        samples_waiting = 1;
                        samples_wait_counter = 735;
                        samples_wait_counter--;
                        break;
                    // 0x63       : wait 882 samples (50th of a second), a shortcut for 0x61 0x72 0x03
                    case 0x63:
                        samples_waiting = 1;
                        samples_wait_counter = 882;
                        samples_wait_counter--;
                        break;
                    // 0x66       : end of sound data
                    case 0x66:
                    //is_playing = 0;
                        streaming_pos = 0;
                        break;
                    // 0x7n       : wait n+1 samples, n can range from 0 to 15.
                    case 0x70: case 0x71: case 0x72: case 0x73: case 0x74: case 0x75: case 0x76: case 0x77: case 0x78: case 0x79: case 0x7a: case 0x7b: case 0x7c: case 0x7d: case 0x7e: case 0x7f:
                        value8 = (command & 0x0f) + 1;
                        samples_waiting = 1;
                        samples_wait_counter = value8;
                        break;
                    default:
                        status_led_off();
                        break;
                    }
                }
            }
            _delay_us(20);
        }
    }
}

/* ------------------------------------------------------------------------- */

void clock_out_init(void)
{
    DDRB |= 1 << PIN1;
    
    TCCR1A |= (1 << COM1A0);            //toggle OC1A
    TCCR1B |= (1 << WGM12)|(1 << CS10); //CTC,  div64
    TCNT1 = 0;                          //unnecessary
    OCR1A = 0;    //toggle @ 8MHz -> 4MHz Clock
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

