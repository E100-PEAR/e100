function_record cp	cam_scale		        num0 
                call    function_camera                 function_camera_ra

record_row_loop be      reset_record_y_count            record_y_count          resY
record_col_loop be      reset_record_x_count            record_x_count          resX        


reset_record_x_count    add     record_y_count          record_y_count          num1
                        cp      record_x_count          num0
                        be      record_row_loop         true                    true

                        call    function_vga_read       function_vga_read_ra
                        cp      sd_write_data           vga_read_data
                        call    function_sd_write       function_sd_write_ra

                        add     sd_addr_low             sd_addr_low             num1
                        add     record_x_count          record_x_count          num1

                        be      record_col_loop         true                    true       
                
reset_record_y_count    cp      record_y_count          num0
                        be      function_record         true                    true

resX                    .data   79
resY                    .data   59

record_x_count          .data   0
record_y_count          .data   0
