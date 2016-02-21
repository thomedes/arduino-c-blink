CC := avr-gcc -Os -DF_CPU=16000000UL -mmcu=atmega328p -Wall -Werror -Wpedantic

all: backup blink.lst

clean:
	rm *.o
	rm blink

burn:	blink.hex backup
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:w:$<

backup: flash_backup.hex

flash_backup.hex:
	avrdude -F -V -c arduino -p ATMEGA328P -P /dev/ttyACM0 -b 115200 -U flash:r:$@:i

%.hex: %
	avr-objcopy -O ihex -R .eeprom $< $@

%.lst: %
	avr-objdump -d $^ > $@
