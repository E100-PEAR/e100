//
// Draw a rectangle on the VGA.
//
// vga_x1: the starting x-coordinate
// vga_x2: the ending x-coordinate
// vga_y1: the starting y-coordinate
// vga_y2: the ending y-coordinate
//
function_vga blt vga_quit vga_x2 vga_x1
             blt vga_quit vga_y2 vga_y1

             out 62 num0
		         out 63 vga_x1
             out 64 vga_y1
             out 65 vga_x2
             out 66 vga_y2
		         out 62 num1
		         out 67	vga_color
		         out 60	num1

vga_wait0 in 61 vga_response
          bne vga_wait0 vga_response num1
          out 60        num0

vga_wait1 in 61 vga_response
          bne vga_wait1	vga_response num0

vga_quit  ret function_vga_ra   
 

vga_x1        .data   0
vga_y1        .data   0
vga_x2        .data   0
vga_y2        .data   0
vga_color     .data   0
vga_response  .data   0

function_vga_ra .data   0