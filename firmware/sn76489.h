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

PortC_0 -> SOUND_WE
PortC_1 <- SOUND_READY
*/

#include <avr/io.h>

void init_sn76489();
