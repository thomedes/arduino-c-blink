CC := avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -Wall -Werror -Wpedantic

all: blink

blink: blink.o

clean:
	rm *.o
	rm blink

burn:	blink.hex
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:$<

%.hex: %
	avr-objcopy -O ihex -R .eeprom $< $@




