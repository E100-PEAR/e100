///////////////////     DRAW CIRCLE    ///////////////////////

// function_draw_circle draws a circle
// takes circle_radius, circle_center_x, circle_center_y, and
// circle_color as inputs

function_draw_circle	cp	vga_x1	circle_center_x
			cp	vga_x2	circle_center_x
			sub	vga_y1	circle_center_y	 circle_radius
			cp	vga_y2	vga_y1
			cp	vga_color	circle_color
			add	circle_last_y	circle_center_y	circle_radius
		mult	circle_radius_squared	circle_radius circle_radius
draw_circle_loop	blt	draw_circle_return	circle_last_y vga_y1
			sub	circle_y_squared circle_center_y vga_y1
		mult	circle_y_squared circle_y_squared circle_y_squared
	sub	circle_y_squared circle_radius_squared circle_y_squared
			cp	sqrt_input	circle_y_squared
			call	function_sqrt	function_sqrt_ra
			cp	circle_xtoadd	sqrt_output
			sub	vga_x1	circle_center_x	circle_xtoadd
			add	vga_x2	circle_center_x	circle_xtoadd
			call	function_vga_write function_vga_write_ra
draw_circle_incr_y	add	vga_y1	vga_y1  num1
			cp	vga_y2	vga_y1
			bne	draw_circle_loop	num1	num0
draw_circle_return	ret	function_draw_circle_ra

circle_radius	.data   50  // radius of the circle
circle_center_x	.data	350 // x coordinate of the origin of the circle
circle_center_y	.data	320 // y coordinate of the origin of the circle
circle_color	.data	120 // color of the circle

// these are temporary variables.
circle_last_y	.data	0
circle_radius_squared	.data	0
circle_y_squared	.data	0
circle_xtoadd		.data	0

// return address
function_draw_circle_ra	.data	0

///////////////////   END OF DRAW CIRCLE   ////////////////////////////

//////////////////    DRAW PLAY BUTTON (aka triangle) ////////////////

// function_draw_play draws a beautiful equilateral triangle
// Equilateral triangles are triangles where all sides are the same length
// play_initial_x and play_initial_y define the upper left point of the
// play button.
// play_height defines the side length of the play button.

function_draw_play  cp      vga_x1  play_initial_x
                    cp      vga_x2  vga_x1
                    cp      vga_y1  play_initial_y
                    cp      vga_y2  vga_y1
                    cp      vga_color   play_color
                    add     play_last_y play_height play_initial_y
                    div     play_mid_y play_height num2
                    add     play_mid_y play_mid_y play_initial_y
draw_play_loop      be      draw_play_return  vga_y1      play_last_y
                    call    function_vga_write  function_vga_write_ra
                    add     vga_y1      vga_y1  num1
                    cp      vga_y2      vga_y1
                    blt     draw_play_decx  play_mid_y vga_y1  
                    add     vga_x2      vga_x2   num2
                    bne     draw_play_loop  num1    num0
draw_play_decx      sub     vga_x2      vga_x2   num2
                    bne     draw_play_loop    num1   num0
draw_play_return    ret     function_draw_play_ra

play_initial_x  .data   560
play_initial_y  .data   400
play_height     .data   40
play_color      .data   28

play_mid_y      .data   0
play_last_y     .data   0
play_x_incr     .data   0
play_y_squared  .data   0
play_temp       .data   0


function_draw_play_ra   .data   0

/////////////////     END OF PLAY BUTTON   ///////////////////////////


