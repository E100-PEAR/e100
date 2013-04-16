function_playback       call    function_clear_screen       function_clear_screen_ra
			mult    playback_resY               resY                    num3
                        mult    playback_resX               resX                    num3           

                        call    function_erase_buttons      function_erase_buttons_ra
                        call    function_draw_play_buttons  function_draw_play_buttons_ra
                        
function_playback_start be      playback_row_loop           true                    true 

playback_row_loop       be      reset_vga_write_y_count     vga_write_y_count       playback_resY
playback_col_loop       be      reset_vga_write_x_count     vga_write_x_count       playback_resX        

get_pixel_color         cp      sd_addr_low                 addr_low_count
                        cp      sd_addr_high                addr_high_count
                        call    function_sd_read            function_sd_read_ra
                        cp      play_or_compare             num1
                        be      external_stop_video         sd_read_data            num256  

                        be      check_finish                temp_addr_low_count     addr_low_count

set_pixel_data          cp      vga_x1                      vga_write_x_count
                        cp      vga_y1                      vga_write_y_count
                        add     vga_write_y_count           vga_write_y_count       num2
                        add     vga_write_x_count           vga_write_x_count       num2
                        cp      vga_x2                      vga_write_x_count
                        cp      vga_y2                      vga_write_y_count
                        sub     vga_write_y_count           vga_write_y_count       num2
                        cp      vga_color                   sd_read_data

                        
                        
                        call    function_vga_write          function_vga_write_ra
                        call    function_vga_write          function_vga_write_ra
                        call    function_vga_write          function_vga_write_ra
                        call    function_vga_write          function_vga_write_ra
                         
                        add     addr_low_count              addr_low_count          num1         
                        add     vga_write_x_count           vga_write_x_count       num1

                        bne     playback_col_loop           addr_low_count          sd_addr_max

reset_addr_low_count    add     addr_high_count             addr_high_count         num1
                        cp      addr_low_count              num0
                        cp      sd_addr_high                addr_high_count
                        cp      play_or_compare             num1
                        be      finish_playback             temp_addr_high_count    addr_high_count
play_pixel_continue     be      get_pixel_color             true                    true                 

reset_vga_write_x_count add     vga_write_y_count           vga_write_y_count       num3
                        cp      vga_write_x_count           num0
                        be      playback_row_loop           true                    true 
                
reset_vga_write_y_count cp      vga_write_y_count           num0
                        cp      vga_write_x_count           num0
                        cp      play_or_compare             num1
                        call    function_keyboard_playback  function_keyboard_key_press_ra
                        be      playback_row_loop           true                    true

finish_playback         cp      time_to_stop                num1
                        be      play_pixel_continue         true                    true

check_finish            bne     set_pixel_data              time_to_stop            num1
                        cp      time_to_stop                num0
                        be      external_stop_video         true                    true

                        halt

