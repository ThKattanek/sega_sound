/* Name: main.h
 * Projekt: sega_sound
 * Author: Thorsten Kattanek
 * Geändert am: 22.01.2020
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 * Version: 1.0
 */

/// CPU Clock
#define F_CPU   8000000UL

/// Hardware configuration

/* PinOut
PIN_14  PortB_0 -> STATUS_LED
*/

#define STATUS_LED_PORT PORTB
#define STATUS_LED_DDR DDRB
#define STATUS_LED_PIN PIN0

/// Declarations

void status_led_init(void);
void status_led_on(void);
void status_led_off(void);
