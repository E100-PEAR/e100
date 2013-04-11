//y count will be the same for both always
//xcount for the first one will need to be reset at the same time it will
//for the second one.
//The addr_high will need to be incremented at the same time also because each
//new video starts with addr_low starting at 0, so they will end at the same time

function_playback       cp      second_vga_write_x_count        resX
                        add     second_vga_write_x_count        second_vga_write_x_count        num1
                        be      playback_row_loop               true                            true 

playback_row_loop       be      reset_vga_write_y_count vga_write_y_count       resY
playback_col_loop       be      reset_vga_write_x_count vga_write_x_count       resX        

get_pixel_color         cp      sd_addr_low             addr_low_count
                        call    function_sd_read        function_sd_read_ra 

set_pixel_data          cp      vga_x1                  vga_write_x_count
                        cp      vga_y1                  vga_write_y_count
                        cp      vga_x2                  vga_write_x_count
                        cp      vga_y2                  vga_write_y_count
                        cp      vga_color               sd_read_data
                        
                        call    function_vga_write      function_vga_write_ra

get_second_pixel_color  cp      sd_addr_high            second_addr_high_count
                        call    function_sd_read        function_sd_read_ra 

second_set_pixel_data   cp      vga_x1                  second_vga_write_x_count
                        cp      vga_y1                  vga_write_y_count
                        cp      vga_x2                  second_vga_write_x_count
                        cp      vga_y2                  vga_write_y_count
                        cp      vga_color               sd_read_data                        

                        call    function_vga_write      function_vga_write_ra                    
                        
                        add     addr_low_count                  addr_low_count                  num1         
                        add     vga_write_x_count               vga_write_x_count               num1
                        add     second_vga_write_x_count        second_vga_write_x_count        num1
                        cp      sd_addr_high                    addr_high_count

                        bne     playback_col_loop       addr_low_count          sd_addr_max

reset_addr_low_count    add     addr_high_count         addr_high_count         num1
                        add     second_addr_high_count  second_addr_high_count  num1
                        cp      addr_low_count          num0
                        cp      sd_addr_high            addr_high_count
                        call    get_pixel_color         get_pixel_color_ra       
                        call    set_pixel_data          set_pixel_data_ra

                        add     addr_low_count          addr_low_count          num1

                        be      playback_col_loop       true                    true          

reset_vga_write_x_count add     vga_write_y_count               vga_write_y_count       num1
                        add     vga_write_x_count               vga_write_x_count       num1
                        cp      second_vga_write_x_count        vga_write_x_count 
                        cp      vga_write_x_count               num0
                        be      playback_row_loop               true                    true 
                
reset_vga_write_y_count cp      vga_write_y_count       num0
                        cp      vga_write_x_count       num0
                        be      function_playback       true                    true

addr_low_count                  .data   0
addr_high_count                 .data   19
second_addr_high_count          .data   35

vga_write_x_count               .data   0
vga_write_y_count               .data   0
second_vga_write_x_count        .data   0

get_pixel_color_ra              .data   0
set_pixel_data_ra               .data   0