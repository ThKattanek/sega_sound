/* Name: sn76489.c
 * Description:
 * Author: Thorsten Kattanek
 * Changed: 22.01.2020
 * License: GNU GPL v2 (see License.txt), GNU GPL v3 or proprietary (CommercialLicense.txt)
 */

/* PinOut
PIN_2  PortD_0 -> Sound_D0
PIN_3  PortD_1 -> Sound_D1
PIN_4  PortD_2 -> Sound_D2
PIN_5  PortD_3 -> Sound_D3
PIN_6  PortD_4 -> Sound_D4
PIN_11 PortD_5 -> Sound_D5
PIN_12 PortD_6 -> Sound_D6
PIN_13 PortD_7 -> Sound_D7

PIN_23 PortC_0 -> SOUND_WE
PIN_24 PortC_1 <- SOUND_READY
*/

#include <avr/io.h>

void init_sn76489();
