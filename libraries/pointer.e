//
// Set the VGA coordinates for the VGA function to draw the pointer's
// rectangle. Note: this does not do anything with the pointer's color.
//
// pointer_x: the pointer's x-coordinate.
// pointer_y: the pointer's y-coordinate.
// pointer_height: the pointer's height.
// pointer_width: the pointer's width.
//
function_prepare_pointer cp     vga_x1                      pointer_x
                         cp     vga_y1                      pointer_y

                         // The end coordinates will be the x-coordinate plus the width
                         // and the y-coordinate plus the height.
                         add    vga_x2                      pointer_x               pointer_width
                         add    vga_y2                      pointer_y               pointer_height

                         cp     vga_color                   pointer_color

                         ret    function_prepare_pointer_ra

//
// Add the pointer to the screen.
//
// pointer_x: the pointer's x-coordinate.
// pointer_y: the pointer's y-coordinate.
//
function_add_pointer    call    function_prepare_pointer    function_prepare_pointer_ra
                        call    function_vga_write          function_vga_write_ra
                        ret     function_add_pointer_ra

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
function_move_pointer   call    function_prepare_pointer    function_prepare_pointer_ra
                        call    function_find_bkg_color     function_find_bkg_color_ra
                        cp      vga_color bkg_color
                        call    function_vga_write          function_vga_write_ra
                        cp      pointer_x                   pointer_new_x
                        cp      pointer_y                   pointer_new_y
                        call    function_prepare_pointer    function_prepare_pointer_ra
                        call    function_vga_write          function_vga_write_ra
                        ret     function_move_pointer_ra

//
// Change the color of the pointer.
//
// pointer_new_color: the new color of the pointer
//
function_change_pointer_color 
                        cp      pointer_new_x               pointer_x
                        cp      pointer_new_y               pointer_y
                        cp      pointer_color               pointer_new_color
                        call    function_move_pointer       function_move_pointer_ra
                        ret     function_change_pointer_color_ra

function_hide_pointer   cp      pointer_new_x               pointer_x
                        cp      pointer_new_y               pointer_y
                        be      keep_new_p_color            pointer_color           color_black
                        cp      pointer_new_color pointer_color

keep_new_p_color        cp      pointer_color               color_black
                        call    function_move_pointer       function_move_pointer_ra
                        ret     function_hide_pointer_ra

function_show_pointer   cp      pointer_new_x               pointer_x
                        cp      pointer_new_y               pointer_y
                        bne     show_pointer                pointer_new_color       color_black
                        cp      pointer_new_color           color_white

show_pointer            call    function_change_pointer_color function_change_pointer_color_ra
                        ret     function_show_pointer_ra

function_move_pointer_left 
                        cp      pointer_new_x               pointer_left
                        call    function_move_pointer       function_move_pointer_ra                           
                        ret     function_move_pointer_left_ra

function_move_pointer_right 
                        cp      pointer_new_x               pointer_right
                        call    function_move_pointer       function_move_pointer_ra                           
                        ret     function_move_pointer_right_ra

function_move_pointer_up 
                        cp      pointer_new_y               pointer_top
                        call    function_move_pointer       function_move_pointer_ra                           
                        ret     function_move_pointer_up_ra

function_move_pointer_down 
                        cp      pointer_new_y               pointer_bottom
                        call    function_move_pointer       function_move_pointer_ra                           
                        ret     function_move_pointer_down_ra

pointer_x .data 0
pointer_y .data 0

pointer_height .data 10
pointer_width .data 10

pointer_new_x .data 0
pointer_new_y .data 0

pointer_color .data 0
pointer_new_color .data 0

pointer_left    .data 80
pointer_right   .data 320
pointer_top     .data 196
pointer_bottom  .data 296

function_prepare_pointer_ra       .data 0
function_add_pointer_ra           .data 0
function_move_pointer_ra          .data 0
function_change_pointer_color_ra  .data 0
function_hide_pointer_ra          .data 0
function_show_pointer_ra          .data 0
function_move_pointer_left_ra     .data 0
function_move_pointer_right_ra    .data 0
function_move_pointer_up_ra       .data 0
function_move_pointer_down_ra     .data 0
