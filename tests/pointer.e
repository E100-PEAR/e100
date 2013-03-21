//
// This test should make a black box move horizontally across the screen each time
// a key is pressed. However, if the 'q' key is pressed, the test should end.
//
	cp pointer_new_x 40
	cp pointer_new_y 40

	call function_move_pointer function_move_pointer_ra

move_pointer call function_keyboard_on_press function_keyboard_on_press_ra

	// End the program if the user presses 'q'
    be end keyboard_value charq

	// Otherwise, move the pointer.
	add pointer_new_x pointer_new_x num10
	add pointer_new_y pointer_new_y num10

	call function_move_pointer function_move_pointer_ra

	// Loop back and see if we should move the pointer again.
	be move_pointer num0 num0 


end halt

#include ../libraries/pointer.e
#include ../bootstrap.e