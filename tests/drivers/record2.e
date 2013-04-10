function_record         cp      cam_scale                       num0 
                        call    function_camera                 function_camera_ra

record_row_loop         be      reset_record_y_count            record_y_count          resY
record_col_loop         be      reset_record_x_count            record_x_count          resX        


get_vga_data            cp      vga_read_x_count        record_x_count
                        cp      vga_read_y_count        record_y_count
                        call    function_vga_read       function_vga_read_ra
                        cp      temp_sd_write_data      vga_read_data

                        add     record_x_count          record_x_count          num1

                        be      set_low_eight           camera_counter          num0
                        be      set_high_eight          camera_counter          num1

call_sd_write           call    function_sd_write       function_sd_write_ra

sd_increment            add     sd_addr_low             sd_addr_low             num1
                        and     sd_write_data           sd_write_data           num0

                        be      record_col_loop         true                    true   

reset_record_x_count    add     record_y_count          record_y_count          num1
                        cp      record_x_count          num0
                        be      record_row_loop         true                    true    
                
reset_record_y_count    cp      record_y_count          num0
                        be      function_record         true                    true

set_low_eight           cp      sd_write_data           temp_sd_write_data
                        add     camera_counter          camera_counter          num1
                        be      record_col_loop         true                    true  

set_high_eight          mult    temp_sd_write_data      temp_sd_write_data      num256
                        or      sd_write_data           sd_write_data           temp_sd_write_data
                        cp      camera_counter          num0
                        be      call_sd_write           true                    true
                        
temp_sd_write_data      .data   0

record_x_count          .data   0
record_y_count          .data   0

camera_counter          .data   0

#include ../../constants.e
#include ../../drivers/camera.e
#include ../../drivers/vga.e
#include ../../drivers/sd_write.e
#include ../../drivers/sd_vars.e