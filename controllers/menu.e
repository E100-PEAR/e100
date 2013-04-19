//This function outputs the menu to the screen and selects where to go from there
//Depending on where the pointer is upon selection the approriate function is called

menu                cp      addr_high_count             num0
                    cp      addr_low_count              num0
                    call    function_sd_draw            function_sd_draw_ra

                    //
                    // set the initial position of the pointer.
                    //
                    cp      pointer_x                   pointer_left
                    cp      pointer_y                   pointer_top

                    // the initial position also is the default next position.
                    // when a key is pressed, the next position will be updated
                    // according.
                    cp      pointer_new_x               pointer_left
                    cp      pointer_new_y               pointer_top

                    call    function_add_pointer        function_add_pointer_ra

//
// let the user move/select the pointer using the arrow keys.
//
read_key            call    function_keyboard_on_press function_keyboard_on_press_ra
                    be      move_left                   keyboard_value key_left
                    be      move_right                  keyboard_value key_right
                    be      move_up                     keyboard_value key_up
                    be      move_down                   keyboard_value key_down
                    be      select_menu                 keyboard_value key_enter
                    be      read_key                    true                        true

move_left           call    function_move_pointer_left  function_move_pointer_left_ra
                    be      read_key                    true                        true

move_right          call    function_move_pointer_right function_move_pointer_right_ra
                    be      read_key                    true                        true

move_up             call    function_move_pointer_up    function_move_pointer_up_ra
                    be      read_key                    true                        true


move_down           call    function_move_pointer_down  function_move_pointer_down_ra
                    be      read_key                    true                        true

//
// select the menu that the pointer is on
//
select_menu         call    function_clear_screen       function_clear_screen_ra
                    be      select_right_menu           pointer_x                   pointer_right

select_left_menu    be      function_playback_menu      pointer_y                   pointer_top
                    be      function_record             true                        true

select_right_menu   be      function_comparison_menu    pointer_y                   pointer_top
                    be      function_frame_menu         true                        true
    
                    halt
