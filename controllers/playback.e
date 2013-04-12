function_playback       be      playback_row_loop               true                    true 

playback_row_loop       be      reset_vga_write_y_count         vga_write_y_count       resY
playback_col_loop       be      reset_vga_write_x_count         vga_write_x_count       resX        

get_pixel_color         cp      sd_addr_low                     addr_low_count
                        call    function_sd_read                function_sd_read_ra 

set_pixel_data          cp      vga_x1                          vga_write_x_count
                        cp      vga_y1                          vga_write_y_count
                        cp      vga_x2                          vga_write_x_count
                        cp      vga_y2                          vga_write_y_count
                        cp      vga_color                       sd_read_data
                        
                        call    function_vga_write              function_vga_write_ra
                        call    function_vga_write              function_vga_write_ra
                        call    function_vga_write              function_vga_write_ra
                        call    function_vga_write              function_vga_write_ra                        
                        
                        add     addr_low_count                  addr_low_count          num1         
                        add     vga_write_x_count               vga_write_x_count       num1

                        bne     playback_col_loop               addr_low_count          sd_addr_max

reset_addr_low_count    add     addr_high_count                 addr_high_count         num1
                        cp      addr_low_count                  num0
                        cp      sd_addr_high                    addr_high_count
                        be      get_pixel_color                 true                    true                 

reset_vga_write_x_count add     vga_write_y_count               vga_write_y_count       num1
                        cp      vga_write_x_count               num0
                        be      playback_row_loop               true                    true 
                
reset_vga_write_y_count cp      vga_write_y_count               num0
                        cp      vga_write_x_count               num0
                        call    function_keybaord_playback      function_keyboard_key_press_ra
                        be      function_playback               true                    true

                        halt