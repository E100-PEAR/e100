start call function_check function_check_ra

	// If the input was incorrect check will redirect to the error.
	// If we're here, valid input was given. Check i to see if we're done.
	// If we're not, redirect back to check.
	blt start i length

	// The password has been correctly validated. Redirect to valid.
	be valid 0 0

// If the password was incorrect light up the red LEDs,
// and redirect to the end of the program.
invalid out 1 num1
	    be end 0 0

// The password has been correctly inputted. Redirect to the
// end of the program after lighting up the green LEDs.
valid out 2 num1
	  be end 0 0

end halt

//
// Check the current character of the password
// against the keyboard input. Also, increment i
// for the next check (if the input was correct).
//
// current: The current correct character for the password.
// keyboard_value: The inputted character for the password.
// i: The current password character identifier.
//
function_check cpfa current password i

	call function_keyboard_on_press function_keyboard_on_press_ra

	bne invalid current keyboard_value

	add i i num1

	ret function_check_ra

function_check_ra .data 0

i .data 0
length .data 4
current .data 0

password .data 116
         .data 101
         .data 115
         .data 116

// Include libraries
#include ../bootstrap.e
