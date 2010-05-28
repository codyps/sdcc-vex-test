#include <pic18fregs.h>

void isr_high(void) {

}

void isr_low(void) {

}

#pragma code ivt_high 0x808
void ivt_high(void) __naked {
	__asm
		goto _isr_high
	__endasm;
}

#pragma code ivt_low 0x818
void ivt_low(void) __naked {
	__asm
		goto _isr_low
	__endasm;
}

void main(void) {

}
