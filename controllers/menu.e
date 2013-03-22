menu call function_add_pointer function_add_pointer_ra

// Let the user move/select the pointer using the arrow keys.
read_key call function_keyboard_on_press function_keyboard_on_press_ra
         be move_left    keyboard_value key_left
         be move_right   keyboard_value key_right
         be move_up      keyboard_value key_up
         be move_down    keyboard_value key_down
         be select_menu  keyboard_value key_enter

// Move the pointer to the left-side of the menu.
move_left  cp pointer_x_new pointer_left
           call function_move_pointer function_move_pointer_ra
           be read_key true true

// Move the pointer to the right-side of the menu.
move_right  cp pointer_x_new pointer_right
            call function_move_pointer function_move_pointer_ra
            be read_key true true

// Move the pointer to the top of the menu.
move_up  cp pointer_y_new pointer_top
         call function_move_pointer function_move_pointer_ra
         be read_key true true

// Move the pointer to the bottom of the menu.
move_down  cp pointer_y_new pointer_bottom
           call function_move_pointer function_move_pointer_ra
           be read_key true true

// Select the menu that the pointer is on.
select_menu be select_right_menu pointer_x pointer_right

select_left_menu be record   pointer_y pointer_top
                 be playback true true

select_right_menu be comparison pointer_y pointer_top
                  be analysis   true true
