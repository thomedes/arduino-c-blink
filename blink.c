#include <avr/io.h>
#include <util/delay.h>

#define BLINK_PERIOD_MS 1000

int main(int argc, char *argv[])
{
    /* set pin 5 of PORTB for output*/
    DDRB |= _BV(DDB5);

    for (;;) {
        /* set pin 5 high to turn led on */
        PORTB |= _BV(PORTB5);
        _delay_ms(BLINK_PERIOD_MS / 2);

        /* set pin 5 low to turn led off */
        PORTB &= ~_BV(PORTB5);
        _delay_ms(BLINK_PERIOD_MS / 2);
    }
}
