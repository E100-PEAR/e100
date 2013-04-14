function_analysis           mult    analysis_resY               resY                    num3
                            mult    analysis_resX               resX                    num3

                            cp      addr_low_count              num0
                            add     temp_addr_high_count        addr_high_count         num19

function_analysis_start     be      analysis_row_loop           true                    true 

analysis_row_loop           be      a_reset_vga_write_y_count   vga_write_y_count       analysis_resY
analysis_col_loop           be      a_reset_vga_write_x_count   vga_write_x_count       analysis_resX        

a_get_pixel_color           cp      sd_addr_high                addr_high_count
                            cp      sd_addr_low                 addr_low_count
                            call    function_sd_read            function_sd_read_ra
                            cp      play_or_compare             num2 
                            be      external_stop_video         sd_read_data            num256

a_set_pixel_data            cp      vga_x1                      vga_write_x_count
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

                            bne     analysis_col_loop           addr_low_count          sd_addr_max

a_reset_addr_low_count      add     addr_high_count             addr_high_count         num1
                            cp      addr_low_count              num0
                            cp      sd_addr_high                addr_high_count
                            cp      play_or_compare             num2
                            be      external_stop_video         temp_addr_high_count    addr_high_count
                            call    a_get_pixel_color           get_pixel_color_ra       
                            call    a_set_pixel_data            set_pixel_data_ra

                            add     addr_low_count              addr_low_count          num1

                            be      analysis_col_loop           true                    true          

a_reset_vga_write_x_count   add     vga_write_y_count           vga_write_y_count       num3
                            cp      vga_write_x_count           num0
                            be      analysis_row_loop           true                    true 
                
a_reset_vga_write_y_count   cp      vga_write_y_count           num0
                            cp      vga_write_x_count           num0

                            cp      play_or_compare             num2
                            call    function_analysis_key_press function_keyboard_key_press_ra

                            be      function_analysis_start     true                    true


                            halt