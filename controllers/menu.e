menu call function_clear_screen function_clear_screen_ra

     // Set the initial position of the pointer.
     cp pointer_x pointer_left
     cp pointer_y pointer_top

     // The initial position also is the default next position.
     // When a key is pressed, the next position will be updated
     // according.
     cp pointer_new_x pointer_left
     cp pointer_new_y pointer_top

     call function_add_pointer function_add_pointer_ra

// Let the user move/select the pointer using the arrow keys.
read_key call function_keyboard_on_press function_keyboard_on_press_ra
         be move_left    keyboard_value key_left
         be move_right   keyboard_value key_right
         be move_up      keyboard_value key_up
         be move_down    keyboard_value key_down
         be select_menu  keyboard_value key_enter

// Move the pointer to the left-side of the menu.
move_left  call function_move_pointer_left function_move_pointer_left_ra
           be read_key true true

// Move the pointer to the right-side of the menu.
move_right  call function_move_pointer_right function_move_pointer_right_ra
            be read_key true true

// Move the pointer to the top of the menu.
move_up  call function_move_pointer_up function_move_pointer_up_ra
         be read_key true true

// Move the pointer to the bottom of the menu.
move_down  call function_move_pointer_down function_move_pointer_down_ra
           be read_key true true

// Select the menu that the pointer is on.
select_menu call function_clear_screen function_clear_screen_ra
            be select_right_menu pointer_x pointer_right

select_left_menu be record   pointer_y pointer_top
                 be playback true true

select_right_menu be comparison pointer_y pointer_top
                  be analysis   true true
    
    halt
