//
// This test should make a black box move horizontally across the screen each time
// a key is pressed. The pointer wil turn green if the 'c' key is pressed. However,
// if the 'q' key is pressed, the test will end.
//
	cp pointer_new_x 40
	cp pointer_new_y 40

	call function_move_pointer function_move_pointer_ra

read_key call function_keyboard_on_press function_keyboard_on_press_ra

	// End the program if the user presses 'q'
    be end keyboard_value charq
    be change_color keyboard_value charc

move_pointer add pointer_new_x pointer_new_x num10
	add pointer_new_y pointer_new_y num10

	call function_move_pointer function_move_pointer_ra

	// Loop back and see if we should move the pointer again.
	be read_key num0 num0 

	// Change the color of the pointer:
change_color cp pointer_new_color color_green
             call function_change_pointer_color function_change_pointer_color_ra
             be move_pointer num0 num0

end halt

#include ../libraries/pointer.e
#include ../bootstrap.e