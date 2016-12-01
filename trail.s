/* 	Alex Ward, Lisa Hieftje-Conley
 *	atward, lhieftj
 *	CPSC 2310
 *	Section: 001
 *	Program 4
 *	Description: This program counts the number of trailing zeros
 *		in a number sent in from main.c.
 */

	.text
	.global trailing_zeros
	.type trailing_zeros, %function

data	.req r0
count	.req r1
temp	.req r2

/* trailing_zeros
 *
 * prototype
 *   int trailing_zeros( int word );
 *
 * input parameter
 *   r0 - the C "float" number (i.e., the IEEE single precision 
 *        floating point format
 *
 * return value
 *   r0  - the number of trailing zeros in word
 *
 *
 * local register map
 *      r0: the number sent in
 *		also used to send count back
 *	r1: count of trailing zeros
 *	r2: a temporary variable to hold the masked number
 */

trailing_zeros:

	push { lr}

	loop:
		and temp, data, #0x1	@ Mask number by 0001 and save in temp 
		cmp temp, #0		
		bne done
		add count, count, #1
		lsr data, #1
		cmp count, #23
		blt loop

	done:
		mov data, count		@ Move count to r0 to be sent back
		pop { pc}

	.section	.rodata

.unreq count
.unreq data
.unreq temp




