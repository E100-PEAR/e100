function_record         cp      addr_high_count                 current_sd_addr_high
                        add     temp_addr_high_count            addr_high_count                 num20
function_record_start   cp      cam_scale                       num0 
                        call    function_camera                 function_camera_ra

record_row_loop         be      reset_record_y_count            record_y_count                  resY
record_col_loop         be      reset_record_x_count            record_x_count                  resX        
                        
                        cp      vga_read_x_count                record_x_count
                        cp      vga_read_y_count                record_y_count

                        call    function_vga_read               function_vga_read_ra
                        cp      sd_write_data                   vga_read_data

                        cp      sd_addr_high                    addr_high_count   
                        call    function_sd_write               function_sd_write_ra

                        add     sd_addr_low                     sd_addr_low                     num1

                        be      reset_sd_addr_low               sd_addr_low                     sd_addr_max

increm_record_x_count   add     record_x_count                  record_x_count                  num1

                        be      record_col_loop                 true                            true

reset_sd_addr_low       add     addr_high_count                 addr_high_count                 num1
                        cp      sd_addr_low                     num0
                        cp      play_or_compare                 num1
                        be      external_stop_video             temp_addr_high_count            addr_high_count    
                        be      increm_record_x_count           true                            true

reset_record_x_count    add     record_y_count                  record_y_count                  num1
                        cp      record_x_count                  num0
                        be      record_row_loop                 true                            true     
                
reset_record_y_count    cp      record_y_count                  num0
                        cp      play_or_compare                 num1
                        call    function_keyboard_record        function_keyboard_key_press_ra
                        be      function_record_start           true                            true

