#include "./sn76489.h"

#define F_CPU 8000000
#include <util/delay.h>

void init_sn76489()
{
    // Init all IO Ports to Soundchip

    // Datalines
    SOUND_DATA_DDR = 0xff;    // all port_d io pins as output
    SOUND_DATA_PORT = 0x00;   // all dataline to low

    // CE Line
    SOUND_CE_DDR |= (1 << SOUND_CE_PIN);   // CE as Output
    SET_SOUND_CE_HI;
    
    // WE Line
    SOUND_WE_DDR |= (1 << SOUND_WE_PIN);   // WE as Output
    SET_SOUND_WE_HI;

    // READY Line
    SOUND_READY_DDR &= ~(1 << SOUND_READY_PIN);  // pin as input without pullup
    SOUND_READY_PORT &= ~(1 << SOUND_READY_PIN);
    
    SET_SOUND_CE_HI;
    SET_SOUND_CE_HI;
}

void write_sn76489(uint8_t byte)
{
    SOUND_DATA_PORT = byte;
    
    SET_SOUND_CE_LO;
    SET_SOUND_WE_LO;
    
    while(!GET_SOUND_READY){}
    
    SET_SOUND_CE_HI;
    SET_SOUND_WE_HI;
}

// tone_nr 0-3 (0-2=Tone1 - Tone3 / 3=Noise) volume 0-5 (6-7 is 5)
void set_sn76489_attenuation(uint8_t tone_nr, uint8_t volume)
{
    uint8_t reg_idx = tone_nr;
    reg_idx &= 0x03;
    reg_idx <<= 1;
    reg_idx += 1;
    uint8_t data_word = REG_ADR_TBL[reg_idx] | 0b00000001;
    
    data_word |= VOL_TBL[volume & 0x07];
    
    write_sn76489(data_word);
}
