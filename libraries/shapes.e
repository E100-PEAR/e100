// draws a circle
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

circle_last_y	.data	0
circle_radius_squared	.data	0
circle_y_squared	.data	0
circle_xtoadd		.data	0

function_draw_circle_ra	.data	0

#include math.e
