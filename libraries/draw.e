//
// Draw an image off of an SD card.
//
function_sd_draw        cp      draw_resY                           screen_height
                        add     draw_resY                           draw_resY               num1
                        cp      draw_resX                           screen_width
                        add     draw_resX                           draw_resX               num1
                        cp      vga_write_y_count                   num0
                        cp      vga_write_x_count                   num0             

sd_draw_row_loop        be      end_sd_draw                         vga_write_y_count       draw_resY    
sd_draw_col_loop        be      sd_draw_reset_vga_write_x_count     vga_write_x_count       draw_resX            

sd_draw_get_pixel_color cp      sd_addr_low                         addr_low_count
                        cp      sd_addr_high                        addr_high_count
                        call    function_sd_read                    function_sd_read_ra

sd_draw_set_pixel_data  cp      vga_x1                              vga_write_x_count
                        cp      vga_y1                              vga_write_y_count
                        cp      vga_x2                              vga_write_x_count
                        cp      vga_y2                              vga_write_y_count
                        cp      vga_color                           sd_read_data
                        
                        call    function_vga_write                  function_vga_write_ra                          
                        
                        add     addr_low_count                      addr_low_count          num1         
                        add     vga_write_x_count                   vga_write_x_count       num1

                        bne     sd_draw_col_loop                    addr_low_count          sd_addr_max 



sd_draw_reset_addr_low_count    
                        add     addr_high_count                     addr_high_count         num1
                        cp      addr_low_count                      num0
                        cp      sd_addr_high                        addr_high_count
			            cp      vga_x1                              vga_write_x_count
                        cp      vga_y1                              vga_write_y_count
                        cp      vga_x2                              vga_write_x_count
                        cp      vga_y2                              vga_write_y_count
                        cp      vga_color                           sd_read_data
                        
                        call    function_vga_write                  function_vga_write_ra                          
                        
                        sub     addr_low_count                      addr_low_count          num1
                        be      sd_draw_get_pixel_color             true                    true                 

sd_draw_reset_vga_write_x_count 
                        add     vga_write_y_count                   vga_write_y_count       num1
                        cp      vga_write_x_count                   num0
                        be      sd_draw_row_loop                    true                    true 
                
end_sd_draw             cp      vga_write_y_count                   num0
                        cp      vga_write_x_count                   num0
                        ret     function_sd_draw_ra

button_width  .data 200
button_height .data 60

draw_image        .data 0
draw_x            .data 0
draw_y            .data 0
draw_skip_color   .data 500
draw_image_pixel  .data 0
draw_image_pixels .data 0
draw_image_width  .data 0
draw_image_height .data 0

draw_image_x_offset .data 0
draw_image_y_offset .data 0

function_draw_background_ra .data 0
function_draw_button_ra     .data 0
function_draw_image_ra      .data 0
function_sd_draw_ra         .data 0

