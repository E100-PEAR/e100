function_record cp      cam_scale		        num0 
                call    function_camera                 function_camera_ra

record_row_loop be      reset_vga_read_y_count          vga_read_y_count        resY
record_col_loop be      reset_vga_read_x_count          vga_read_x_count        resX        

                        call    function_vga_read       function_vga_read_ra
                        cp      sd_write_data           vga_read_data
                        call    function_sd_write       function_sd_write_ra

                        add     sd_addr_low             sd_addr_low             num1
                        add     vga_read_x_count        vga_read_x_count        num1

                        be      record_col_loop         true                    true      

reset_vga_read_x_count  add     vga_read_y_count        vga_read_y_count        num1
                        cp      vga_read_x_count        num0
                        be      playback_row_loop       true                    true 
                
reset_vga_read_y_count  cp      vga_read_y_count        num0
                        be      function_record         true                    true
