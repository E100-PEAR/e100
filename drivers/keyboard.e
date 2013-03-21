//
// Read a value from the keyboard.
//
// key_pressed: If the key was pressed the value will be 1. If the key
//              key was released, the value will be 0.
//
// key_value: The ASCII value of the pressed key.
//
function_keyboard out 20 num1
keyboard_read in 21 keyboard_response

    blt keyboard_read keyboard_response num1

    in 22 keyboard_pressed
    in 23 keyboard_value
	out 20 num0

keyboard_finish in 21 keyboard_response
	bne keyboard_finish keyboard_response num0

    ret function_keyboard_ra

//
// Handle a pressed-key event on the keyboard.
//
// keyboard_value: The ASCII value of the pressed key.
//
function_keyboard_on_press call function_keyboard function_keyboard_ra
	bne function_keyboard_on_press keyboard_pressed num1

	ret function_keyboard_on_press_ra

//
// Handle a released-key event on the keyboard.
//
// keyboard_value: The ASCII value of the released key.
//
function_keyboard_on_release call function_keyboard function_keyboard_ra
	bne function_keyboard_on_release keyboard_pressed num0

	ret function_keyboard_on_release_ra

function_keyboard_ra .data 0
keyboard_response .data 0
keyboard_pressed .data 0
keyboard_value .data 0

function_keyboard_on_press_ra .data 0
function_keyboard_on_release_ra .data 0