/* Name: sn76489.c
 * Description:
 * Author: Thorsten Kattanek
 * Changed: 22.01.2020
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 */

/* PinOut
PortD_0 -> Sound_D0
PortD_1 -> Sound_D1
PortD_2 -> Sound_D2
PortD_3 -> Sound_D3
PortD_4 -> Sound_D4
PortD_5 -> Sound_D5
PortD_6 -> Sound_D6
PortD_7 -> Sound_D7

PortC_0 <- SOUND_READY
PortC_1 -> SOUND_CE
PortC_2 -> SOUND_WE
*/

#define SOUND_READY_PORT PORTC
#define SOUND_READY_DDR DDRC
#define SOUND_READY_PINS PINC
#define SOUND_READY_PIN PIN0

#define SOUND_CE_PORT PORTC
#define SOUND_CE_DDR DDRC
#define SOUND_CE_PIN PIN1

#define SOUND_WE_PORT PORTC
#define SOUND_WE_DDR DDRC
#define SOUND_WE_PIN PIN2

#define SOUND_DATA_PORT PORTD
#define SOUND_DATA_DDR DDRD

// MAKROS
#define GET_SOUND_READY (SOUND_READY_PINS & (1 << SOUND_READY_PIN))
#define SET_SOUND_CE_LO SOUND_CE_PORT &= ~(1 << SOUND_CE_PIN)
#define SET_SOUND_CE_HI SOUND_CE_PORT |= (1 << SOUND_CE_PIN)
#define SET_SOUND_WE_LO SOUND_WE_PORT &= ~(1 << SOUND_WE_PIN)
#define SET_SOUND_WE_HI SOUND_WE_PORT |= (1 << SOUND_WE_PIN)


#include <avr/io.h>

static const uint32_t MASTER_SOUND_CLOCK = 4000000UL;
static const uint8_t CONV_NIBBLE[16] = {0x0, 0x8, 0x4, 0xc, 0x2, 0xa, 0x6, 0xe, 0x1, 0x9, 0x5, 0xd, 0x3, 0xb, 0x7, 0xf};

void init_sn76489();
void write_sn76489(uint8_t byte);

void set_sn76489_frequency(uint8_t tone_nr, uint16_t frequ);
void set_sn76489_attenuation(uint8_t tone_nr, uint8_t volume);
void set_sn76489_noise(uint8_t value);
