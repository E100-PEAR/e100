function_record cp      readwrite               num1
                call    function_camera         function_camera_ra

record_row_loop be      reset_y_count           y_count                 resY
record_col_loop be      reset_x_count           x_count                 resX        


reset_x_count   add     y_count                 y_count                 num1
                cp      x_count                 num0
                be      record_row_loop         true                    true

                call    function_vga_read       function_vga_read_ra
                call    function_sd             function_sd_ra

                add     sd_addr_low             sd_addr_low             num1
                add     x_count                 x_count                 num1

                be      record_col_loop         true                    true       
                
reset_y_count   cp      y_count                 num0
                be      function_record                  true                    true


                halt
resX                    .data   79
resY                    .data   59

x_count                 .data   0
y_count                 .data   0

#include ../../constants.e
#include ../../drivers/camera.e
#include ../../drivers/vga.e
#include ../../drivers/sd.e