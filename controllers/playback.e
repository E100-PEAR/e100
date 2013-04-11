function_playback       be      playback_row_loop       true                    true 

playback_row_loop       be      reset_vga_write_y_count vga_write_y_count       resY
playback_col_loop       be      reset_vga_write_x_count vga_write_x_count       resX        

get_pixel_color         cp      sd_addr_low             addr_low_count
                        call    function_sd_read        function_sd_read_ra 

set_pixel_data          cp      vga_x1                  vga_write_x_count
                        cp      vga_y1                  vga_write_y_count
                        cp      vga_x2                  vga_write_x_count
                        cp      vga_y2                  vga_write_y_count
                        cp      vga_color               sd_read_data       
                        be      low_vga_write_data      vga_write_counter       num0
                        be      high_vga_write_data     vga_write_counter       num1         
 call_vga_write         call    function_vga_write      function_vga_write_ra
                        
                        add     addr_low_count          addr_low_count          num1         
                        add     vga_write_x_count       vga_write_x_count       num1

                        bne     playback_col_loop       addr_low_count          sd_addr_max

reset_addr_low_count    add     addr_high_count         addr_high_count         num1
                        cp      addr_low_count          num0
                        cp      sd_addr_high            addr_high_count
                        call    get_pixel_color         get_pixel_color_ra       
                        call    set_pixel_data          set_pixel_data_ra

                        add     addr_low_count          addr_low_count          num1

                        be      playback_col_loop       true                    true          

reset_vga_write_x_count add     vga_write_y_count       vga_write_y_count       num1
                        cp      vga_write_x_count       num0
                        be      playback_row_loop       true                    true 
                
reset_vga_write_y_count cp      vga_write_y_count       num0
                        cp      vga_write_x_count       num0
                        be      function_playback       true                    true

low_vga_write_data      and     vga_color               vga_color               num255
                        add     vga_write_counter       vga_write_counter       num1
                        be      call_vga_write          true                    true

high_vga_write_data     and     vga_color               vga_color               num65280
                        cp      vga_write_counter       num0
                        be      call_vga_write          true                    true

vga_write_counter       .data   0

addr_low_count  .data   0
addr_high_count .data   0

vga_write_x_count       .data   0
vga_write_y_count       .data   0

get_pixel_color_ra      .data   0
set_pixel_data_ra       .data   0