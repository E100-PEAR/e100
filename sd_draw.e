function_sd_draw       	cp    	draw_resY                   screen_height
                        cp    	draw_resX                   screen_width
                        cp 		addr_high_count 			num0  
                        cp      addr_low_count              num0
                        cp 		vga_write_y_count 			num0
                        cp 		vga_write_x_count 			num0             

sd_draw_row_loop        be      end_sd_draw 			    vga_write_y_count       draw_resY    
sd_draw_col_loop        be      reset_vga_write_x_count     vga_write_x_count       draw_resX            

get_pixel_color         cp      sd_addr_low                 addr_low_count
                        cp      sd_addr_high                addr_high_count
                        call    function_sd_read            function_sd_read_ra

set_pixel_data          cp      vga_x1                      vga_write_x_count
                        cp      vga_y1                      vga_write_y_count
                        cp      vga_x2                      vga_write_x_count
                        cp      vga_y2                      vga_write_y_count
                        cp      vga_color                   sd_read_data
                        
                        call    function_vga_write          function_vga_write_ra                          
                        
                        add     addr_low_count              addr_low_count          num1         
                        add     vga_write_x_count           vga_write_x_count       num1

                        bne     sd_draw_col_loop            addr_low_count          sd_addr_max

reset_addr_low_count    add     addr_high_count             addr_high_count         num1
                        cp      addr_low_count              num0
                        cp      sd_addr_high                addr_high_count
                        be      get_pixel_color             true                    true                 

reset_vga_write_x_count add     vga_write_y_count           vga_write_y_count       num1
                        cp      vga_write_x_count           num0
                        be      sd_draw_row_loop            true                    true 
                
reset_vga_write_y_count cp      vga_write_y_count           num0
                        cp      vga_write_x_count           num0
                        be      menu 			          	true                    true

                        halt
