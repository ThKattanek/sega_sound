#include "./sn76489.h"

void init_sn76489()
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
