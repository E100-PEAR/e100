//
// Set the VGA coordinates for the VGA function to draw the pointer's
// rectangle. Note: this does not do anything with the pointer's color.
//
// pointer_x: the pointer's x-coordinate.
// pointer_y: the pointer's y-coordinate.
// pointer_height: the pointer's height.
// pointer_width: the pointer's width.
//
function_prepare_pointer cp vga_x1 pointer_x
                         cp vga_y1 pointer_y

                         // The end coordinates will be the x-coordinate plus the width
                         // and the y-coordinate plus the height.
                         add vga_x2 pointer_x pointer_width
                         add vga_y2 pointer_y pointer_height

                         cp vga_color pointer_color

                         ret function_prepare_pointer_ra

//
// Add the pointer to the screen.
//
// pointer_x: the pointer's x-coordinate.
// pointer_y: the pointer's y-coordinate.
//
function_add_pointer call function_prepare_pointer function_prepare_pointer_ra
                     call function_vga function_vga_ra

                     ret function_add_pointer

//
// Move the pointer. This "erases" the previous pointer by drawing
// a black rectangle on top of it. Then, a rectangle is drawn
// and will act as the new pointer.
//
// pointer_x: the old pointer's x-coordinate.
// pointer_y: the old pointer's y-coordinate.
// pointer_height: the pointer's height.
// pointer_width: the pointer's width.
// pointer_color: the pointer's color.
// pointer_new_x: the x-coordinate that the pointer will be moved to.
// pointer_new_y: the y-coordinate that the pointer will be moved to.
//
function_move_pointer call function_prepare_pointer function_prepare_pointer_ra
                      cp vga_color color_black

                      // Draw the black rectangle over the previous pointer.
                      call function_vga function_vga_ra

                      // Set the new pointer's coordinates.
                      cp pointer_x pointer_new_x
                      cp pointer_y pointer_new_y

                      call function_prepare_pointer function_prepare_pointer_ra

                      // Draw the new pointer.
                      call function_vga function_vga_ra

                      ret function_move_pointer_ra

//
// Change the color of the pointer.
//
// pointer_new_color: the new color of the pointer
//
function_change_pointer_color cp pointer_new_x pointer_x
                              cp pointer_new_y pointer_y

                              cp pointer_color pointer_new_color

                              call function_move_pointer function_move_pointer_ra

                              ret function_change_pointer_color_ra

function_hide_pointer cp pointer_new_x pointer_x
                      cp pointer_new_y pointer_y

                      // We'll save the pointer's old color (if it's not black) so that
                      // the pointer can have the same color when it is shown again. 
                      be _keep_new_p_color pointer_color color_black

                      cp pointer_new_color pointer_color
_keep_new_p_color     cp pointer_color color_black

                      call function_move_pointer function_move_pointer_ra

                      ret function_hide_pointer_ra

function_show_pointer cp pointer_new_x pointer_x
                      cp pointer_new_y pointer_y

                      bne _show_pointer pointer_new_color color_black

                      // The pointer's new color is set to black, so let's use white.
                      cp pointer_new_color color_white

_show_pointer         call function_change_pointer_color function_change_pointer_color_ra

                      ret function_show_pointer_ra

pointer_x .data 0
pointer_y .data 0

pointer_height .data 10
pointer_width .data 10

pointer_new_x .data 0
pointer_new_y .data 0

pointer_color .data 255
pointer_new_color .data 0

function_prepare_pointer_ra       .data 0
function_move_pointer_ra          .data 0
function_change_pointer_color_ra  .data 0
function_hide_pointer_ra          .data 0
function_show_pointer_ra          .data 0