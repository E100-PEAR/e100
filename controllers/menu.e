menu call function_draw_background function_draw_background_ra

     cp draw_image_width  num200
     cp draw_image_height num60
     cp draw_skip_color color_white

     // Draw the first button
     cp draw_x button_x1
     cp draw_y button_y1
     cpfa draw_image images num0

     call function_draw_button function_draw_button_ra
     call function_draw_image  function_draw_image_ra

     // Draw the second button.
     cp draw_x button_x2

     call function_draw_button function_draw_button_ra

     // Draw the third button.
     cp draw_y button_y2

     call function_draw_button function_draw_button_ra

     // Draw the fourth button.
     cp draw_x button_x1

     call function_draw_button function_draw_button_ra

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

         // The key that was pressed does not do anything. Wait for the user to
         // press another key.
         be read_key true true

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

select_left_menu be function_playback_menu pointer_y pointer_top
                 be function_record   true      true

select_right_menu be function_comparison pointer_y pointer_top
                  be function_frame_menu   true true
    
    halt