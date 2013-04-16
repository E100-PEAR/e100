function_comparison         
                            // start by clearing screen
			                call    function_clear_screen      function_clear_screen_ra
		                    mult    comparison_resY            resY                    num3
                            mult    comparison_resX            resX                    num3
                            be      high_addr_compare          last_video_recorded     num2
                            cp      addr_high_count            current_sd_addr_high
                            cp      temp_addr_high_count       addr_high_count
                            sub     addr_high_count            addr_high_count         num20
                            be      skip_to_low                last_video_recorded     num1
high_addr_compare           cp      addr_high_count            num140
                            cp      temp_addr_high_count       num160                 
skip_to_low                 cp      temp_addr_low_count        num0
                            cp      addr_low_count             num0

                            call    function_erase_buttons     function_erase_buttons_ra
                            call    function_draw_play_buttons function_draw_play_buttons_ra

function_comparison_start   be      comparison_row_loop_1      comparison_counter      num0
                            be      comparison_second_frame    comparison_counter      num1
 
comparison_row_loop_1       be      reset_vga_write_y_count_1  vga_write_y_count       comparison_resY
comparison_col_loop_1       be      reset_vga_write_x_count_1  vga_write_x_count       comparison_resX        

comp_get_pixel_color_1      cp      sd_addr_low                addr_low_count
                            cp      sd_addr_high               addr_high_count
                            call    function_sd_read           function_sd_read_ra
                            cp      play_or_compare            num0
                            be      external_stop_video        sd_read_data            num256  

comp_set_pixel_data_1       cp      vga_x1                     vga_write_x_count
                            cp      vga_y1                     vga_write_y_count
                            add     vga_write_y_count          vga_write_y_count       num2
                            add     vga_write_x_count          vga_write_x_count       num2
                            cp      vga_x2                     vga_write_x_count
                            cp      vga_y2                     vga_write_y_count
                            sub     vga_write_y_count          vga_write_y_count       num2
                            cp      vga_color                  sd_read_data
                        
                            call    function_vga_write         function_vga_write_ra                             
                        
                            add     addr_low_count             addr_low_count          num1         
                            add     vga_write_x_count          vga_write_x_count       num1

                            bne     comparison_col_loop_1      addr_low_count          sd_addr_max

reset_addr_low_count_1      add     addr_high_count            addr_high_count         num1
                            cp      addr_low_count             num0
                            be      comp_get_pixel_color_1     true                    true                 

reset_vga_write_x_count_1   add     vga_write_y_count          vga_write_y_count       num3
                            cp      vga_write_x_count          num0
                            be      comparison_row_loop_1      true                    true 
                
reset_vga_write_y_count_1   cp      vga_write_y_count          num0
                            cp      vga_write_x_count          num0
                            add     comparison_counter         comparison_counter      num1
                            be      function_comparison_start  true                    true

comparison_second_frame     cp      vga_write_x_count_2        comparison_resX
                            add     vga_write_x_count_2        vga_write_x_count_2     num1
                            be      comparison_row_loop_2      true                    true 

comparison_row_loop_2       be      reset_vga_write_y_count_2  vga_write_y_count       comparison_resY
comparison_col_loop_2       be      reset_vga_write_x_count_2  vga_write_x_count       comparison_resX        

comp_get_pixel_color_2      cp      sd_addr_low                addr_low_count_2
                            cp      sd_addr_high               addr_high_count_2
                            call    function_sd_read           function_sd_read_ra 
                            cp      play_or_compare            num0
                            be      external_stop_video        sd_read_data            num256

                            be      comp_check_finish               temp_addr_low_count_2   addr_low_count_2

comp_set_pixel_data_2       cp      vga_x1                     vga_write_x_count_2
                            cp      vga_y1                     vga_write_y_count
                            add     vga_write_y_count          vga_write_y_count       num2
                            add     vga_write_x_count_2        vga_write_x_count_2     num2
                            cp      vga_x2                     vga_write_x_count_2
                            cp      vga_y2                     vga_write_y_count
                            sub     vga_write_y_count          vga_write_y_count       num2
                            cp      vga_color                  sd_read_data 
                        
                            call    function_vga_write         function_vga_write_ra                      
                        
                            add     addr_low_count_2           addr_low_count_2        num1         
                            add     vga_write_x_count          vga_write_x_count       num3
                            add     vga_write_x_count_2        vga_write_x_count_2     num1

                            bne     comparison_col_loop_2      addr_low_count_2        sd_addr_max

reset_addr_low_count_2      add     addr_high_count_2          addr_high_count_2       num1
                            cp      addr_low_count_2           num0
                            cp      sd_addr_high               addr_high_count_2
                            cp      play_or_compare            num0

                            // new additions below this line ////////////////////////
                            be      comp_not_tiger_video        user_or_tiger_video     num0
                            // skip extra code that only applies to tiger videos if we're watching a user video. 
                        
                            cp      vga_x1                      vga_write_x_count_2
                            cp      vga_y1                      vga_write_y_count
                            cp      vga_x2                      vga_write_x_count_2
                            cp      vga_y2                      vga_write_y_count
                            cp      vga_color                   sd_read_data
                        
                            call    function_vga_write          function_vga_write_ra                          
                        
                            sub     addr_low_count_2            addr_low_count_2       num1  
comp_not_tiger_video         
                            be      external_stop_video        temp_addr_high_count    addr_high_count
                            be      finish_comparison          temp_addr_high_count_2  addr_high_count_2
comp_pixel_continue         be      comp_get_pixel_color_2     true                    true                 

reset_vga_write_x_count_2   add     vga_write_y_count           vga_write_y_count      num3
                            cp      vga_write_x_count_2         comparison_resX
                            add     vga_write_x_count_2         vga_write_x_count_2    num1
                            cp      vga_write_x_count           num0
                            be      comparison_row_loop_2       true                   true 
                
reset_vga_write_y_count_2   cp      vga_write_y_count           num0
                            cp      vga_write_x_count           num0
                            cp      comparison_counter          num0
                            cp      play_or_compare             num0
                            call    function_keyboard_playback  function_keyboard_key_press_ra 
                            be      function_comparison_start   true                   true

finish_comparison       cp      time_to_stop                num1
                        be      comp_pixel_continue         true                    true

comp_check_finish            bne     comp_set_pixel_data_2       time_to_stop            num1
                        cp      time_to_stop                num0
                        be      external_stop_video         true                    true
