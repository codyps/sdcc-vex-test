#include <pic18fregs.h>

void isr_high(void) {

}

void isr_low(void) {

}

void ivt_high(void) __naked {
	__asm
		goto _isr_high
	__endasm;
}

void ivt_low(void) __naked {
	__asm
		goto _isr_low
	__endasm;
}

void main(void) {

}
