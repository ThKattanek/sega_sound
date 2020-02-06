#include "./sn76489.h"

#define F_CPU 8000000UL

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
    // Swap all bits 0 <--> 7
    uint8_t send_byte = CONV_NIBBLE[byte & 0x0f] << 4;
    send_byte |= CONV_NIBBLE[byte >> 4];
    
    /* without READY an 4MHz Clock for sn76489
    SET_SOUND_WE_HI;
    SOUND_DATA_PORT = byte;
    SET_SOUND_WE_LO;
    _delay_us(8);
    SET_SOUND_WE_HI;
    */
    
    /* with READY wait */
    SOUND_DATA_PORT = send_byte;
    
    SET_SOUND_CE_LO;
    SET_SOUND_WE_LO;
    
    while(!GET_SOUND_READY){}
    
    SET_SOUND_CE_HI;
    SET_SOUND_WE_HI;
}

// tone_nr 0-2 (Tone1-3) 
// frequ 10Bit f=N/(32*n)   N = ref Clock in Hz / n = 10 bit binary number
void set_sn76489_frequency(uint8_t tone_nr, uint16_t freq)
{
    if(tone_nr < 3)
    {
        uint8_t reg_nr = tone_nr;
        reg_nr <<= 1;   // mul 2
        
        uint16_t n = MASTER_SOUND_CLOCK / ((uint32_t)freq << 5);
        
        uint8_t data_word0 = 0x80 | (reg_nr << 4) | (n & 0x0f);
        uint8_t data_word1 = (n >> 4) & 0x3f;
                
        write_sn76489(data_word0);
        write_sn76489(data_word1);
    }
}

// tone_nr 0-3 (0-2 = Tone1-3 / 3 = Noise) volume 0-15 (0 = off / 15 = maximum)
void set_sn76489_volume(uint8_t tone_nr, uint8_t volume)
{
    if(tone_nr < 4)
    {
        uint8_t reg_nr = tone_nr;
        reg_nr <<= 1;   // mul 2
        reg_nr += 1;    // add 1
        
        uint8_t data_word = 0x80 | (reg_nr << 4) | ((0xf - volume) & 0x0f);
        write_sn76489(data_word);
    }
}

// value
// Noise Shift Rate
// bit0-1 - 00=N/512 01=N/1024 10=N/2048 11= Tone Generator 3 Output
// Noise Feedback Conrol
// bit2 - 0 = Preriodic Noise / 1 = White Noise
void set_sn76489_noise(uint8_t value)
{
    uint8_t data_word = 0x80 | (0x06 << 4) | (value & 0x07);
    write_sn76489(data_word);
}
