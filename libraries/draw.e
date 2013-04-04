function_draw_background cp vga_x1 num0
                         cp vga_x2 screen_width

                         cp vga_y1 num0
                         cp vga_y2 screen_height

                         cp vga_color color_white
                         
                         call function_vga_write  function_vga_write_ra
                        
                         // Creates a rectangle at the top of the screen to hold the
                         // Golfintosh name.
                         cp vga_y2 num60
                         cp vga_color color_blue
                         
                         call function_vga_write function_vga_write_ra

                         ret function_draw_background_ra

function_draw_button cp  vga_x1 draw_x
                     add vga_x2 draw_x button_width

                     cp  vga_y1 draw_y
                     add vga_y2 draw_y button_height

                     cp vga_color color_purple

                     call function_vga_write function_vga_write_ra

                     ret function_draw_button_ra

function_draw_image cp draw_image_x_offset num0
                    cp draw_image_y_offset num0
                    cp draw_image_pixel draw_image

                    sub draw_image_width  draw_image_width  num1
                    sub draw_image_height draw_image_height num1

                    // Send the current pixel's information to the VGA driver.
send_pixel          add vga_x1 draw_x draw_image_x_offset
                    cp vga_x2 vga_x1

                    add vga_y1 draw_y draw_image_y_offset
                    cp vga_y2 vga_y1

                    // cpfa vga_color playvideo_array draw_image_pixel 
                    cpfa vga_color 0 draw_image_pixel

                    // Skip the current pixel if its color is meant to be skipped. 
                    be draw_prepare vga_color draw_skip_color

                    // Draw the pixel.
                    call function_vga_write function_vga_write_ra

                    // Prepare the next pixel.
draw_prepare        add draw_image_pixel draw_image_pixel num1

                    // Draw the next row of pixels if we're at the end of the current one.
                    be draw_move_down draw_image_width draw_image_x_offset

                    add draw_image_x_offset draw_image_x_offset num1

                    // Loop back to the beginning to draw the next pixel.
                    be send_pixel true true

                    // We're done if the image is at the end of the rows.
draw_move_down      be draw_end draw_image_height draw_image_y_offset

                    // Otherwise, move on to the next row.
                    cp  draw_image_x_offset num0
                    add draw_image_y_offset draw_image_y_offset num1

                    // Loop back to the beginning to draw the next pixel.
                    be send_pixel true true

draw_end            ret function_draw_image_ra

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