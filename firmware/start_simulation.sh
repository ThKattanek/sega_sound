#!/bin/bash
simulavr -d atmega8 -o sega_sound.trc
simulavr -d atmega8 -c vcd:sega_sound.trc:sega_sound.vcd -f sega_sound.elf -m 100000 -F 8000000
gtkwave sega_sound.gtkw
