//
// Draw a rectangle on the VGA.
//
// vga_x1: the starting x-coordinate
// vga_x2: the ending x-coordinate
// vga_y1: the starting y-coordinate
// vga_y2: the ending y-coordinate
//
function_vga_write  blt     vga_quit            vga_x2          vga_x1
                    blt     vga_quit            vga_y2          vga_y1

                    out     62                  num0
                    out     63                  vga_x1
                    out     64                  vga_y1
                    out     65                  vga_x2   
                    out     66                  vga_y2
                    out     62                  num1
                    out     67	                vga_color
                    out     60	                num1

vga_wait0           in      61                  vga_response
                    bne     vga_wait0           vga_response    num1
                    out     60                  num0

vga_wait1           in      61                  vga_response
                    bne     vga_wait1           vga_response    num0

vga_quit            ret     function_vga_write_ra   

function_vga_read   in      61                  vga_response
                    be      function_vga_read   vga_response    true

vga_request         out     62                  false
                    out     63                  vga_read_x_count
                    out     64                  vga_read_y_count
                    out     60                  true
                    in      61                  vga_response
                    bne     vga_request         vga_response    true
                    in      68                  vga_read_data
                    out     60                  false
                    in      61                  vga_response
                    add     x_count             x_count         num1
                    ret     function_vga_read_ra 

vga_read_data       .data   0

vga_read_x_count    .data   0
vga_read_y_count    .data   0

x_count             .data   0
//
// Set the entire screen to black.
//
// screen_width:  the width of the screen
// screen_height: the height of the screen.
//
function_clear_screen cp vga_x1 num0
                      cp vga_y1 num0
                      cp vga_x2 screen_width
                      cp vga_y2 screen_height
                      cp vga_color color_black

                      call function_vga_write function_vga_write_ra

                      ret function_clear_screen_ra


vga_x1        .data   0
vga_y1        .data   0
vga_x2        .data   0
vga_y2        .data   0
vga_color     .data   0
vga_response  .data   0

vga_image        .data 0
vga_image_width  .data 0
vga_image_height .data 0

vga_image_counter .data 0

function_vga_write_ra    .data  0
function_vga_read_ra     .data  0
function_clear_screen_ra .data  0
