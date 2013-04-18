//This is a test function that gets the ASCII character value
//of different keys on the keyboard. It will store the ASCII 
//value to keyboard_value

	cp keyboard_wait true

	call function_keyboard function_keyboard_ra

	halt

#include ../../constants.e
#include ../../drivers/keyboard.e