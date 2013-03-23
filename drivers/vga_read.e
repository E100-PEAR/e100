function_vga_read   in 61   vga_response
                    be      vga_driver          vga_response    true

vga_request         out     62                  false
                    out     60                  true
                    in      61                  vga_response
                    bne     vga_request         vga_response    true
                    in      68                  color_num
                    out     60                  false
                    in      61                  vga_response
                    add     x_count             x_count         num1
                    ret     funtion_record_ra 

vga_response        .data   0    