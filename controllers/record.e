row_loop        be      reset_y_count   y_count         resY
col_loop        be      reset_x_count   x_count         resX        

vga_driver      in      61              vga_response
                be      vga_driver      vga_response    true

vga_request     out     62              false
                out     60              true
                in      61              vga_response
                bne     vga_request     vga_response    true
                in      68              color_num
                out     60              false
                in      61              vga_response
                add     x_count         x_count         num1
                be      col_loop        true            true

reset_x_count   add     y_count         y_count         num1
                cp      x_count         num0
                be      row_loop        true            true
                
reset_y_count   cp      y_count         num0
                be      cam_driver      true            true

vga_response    .data   0

color_num       .data   0

resX            .data   79
resY            .data   59
x_count         .data   0
y_count         .data   0

#include ../constants.e
#include ../drivers/camera.e