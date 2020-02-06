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
    
    SET_SOUND_CE_LO;
    SET_SOUND_WE_HI;
}

void write_sn76489(uint8_t byte)
{
    /* without READY an 4MHz Clock for sn76489
    SET_SOUND_WE_HI;
    SOUND_DATA_PORT = byte;
    SET_SOUND_WE_LO;
    _delay_us(8);
    SET_SOUND_WE_HI;
    */
    
    /* with READY wait */
    SOUND_DATA_PORT = byte;
    
    SET_SOUND_CE_LO;
    SET_SOUND_WE_LO;
    
    while(!GET_SOUND_READY){}
    
    SET_SOUND_CE_HI;
    SET_SOUND_WE_HI;
}

// tone_nr 0-2 (Tone1-3) 
// frequ 10Bit f=N/(32*n)   N = ref Clock in Hz / n = 10 bit binary number
void set_sn76489_frequency(uint8_t tone_nr, uint16_t frequ)
{
    if(tone_nr > 2) return;
    
    uint8_t reg_idx = tone_nr;
    reg_idx &= 0x03;
    reg_idx <<= 1;
    
    frequ &= 0x3ff;
    
    uint8_t data_word0 = REG_ADR_TBL[reg_idx] | 0b00000001;
    
    uint8_t f_tmp = frequ << 4;
        for(int8_t i=7; i>=4; i--)
            if(f_tmp & (1<<i)) data_word0 |= 1 << ((7-i)+4);
        
    f_tmp = frequ >> 2;
    uint8_t data_word1 = 0;
    for(int8_t i=7; i>=2; i--)
        if(f_tmp & (1<<i)) data_word1 |= 1 << ((7-i)+2);
    
    write_sn76489(data_word0);
    write_sn76489(data_word1);
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

// value
// Noise Feedback Conrol
// bit0 - 0=Preriodic Noise / 1=White Noise
// Noise Shift Rate
// bit1-2 - 00=N/512 10=N/1024 01=N/2048 11= Tone Generator 3 Output
void set_sn76489_noise(uint8_t value)
{
    uint8_t data_word = REG_ADR_TBL[6] | 0b00000001;
    data_word |= value << 5;
    write_sn76489(data_word);
}
