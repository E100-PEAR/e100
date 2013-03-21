menu_home	cp	vga_x1		vga_zero
		cp	vga_y1		vga_zero
		cp	vga_x2		six39
		cp	vga_y2 		four79
		cp	vga_color	liteblue
		call	vga_init	vga_ret
		cp	men_iloop	vga_zero
menu_bkgloop	blt	menu_done1	men_fin		men_iloop
		add	vga_x1		vga_x1		gradsize
		add	vga_y1		vga_y1		gradsize
		sub	vga_x2		vga_x2		gradsize
		sub	vga_y2		vga_y2		gradsize
		add	vga_color	vga_color	redincr
		call	vga_init	vga_ret
		add	men_iloop	men_iloop	vga_one
		bne	menu_bkgloop	vga_one		vga_zero
menu_done1	cp	vga_color	green
menu_button	cp	vga_x1		but1x1
		add	vga_x2		vga_x1		buttonwidth
		cp	vga_y1		but1y1
		add	vga_y2		vga_y1		buttonheight
		call	vga_init	vga_ret
		add	vga_x1		vga_x2		buttonhgap
		add	vga_x2		vga_x1		buttonwidth
		call	vga_init	vga_ret
		add	vga_y1		vga_y2		buttonvgap
		add	vga_y2		vga_y1		buttonheight
		call	vga_init	vga_ret
		sub	vga_x2		vga_x1		buttonhgap
		sub	vga_x1		vga_x2		buttonwidth
		call	vga_init	vga_ret
		halt

men_fin		.data	6
men_iloop	.data	0
six39		.data	639	//last writable horizontal pixel
four79		.data	479	//last writable vertical pixel
three		.data	3
gradsize	.data	8
redincr		.data	32	//this is the value used to increment red by 1
grnincr		.data	4	//increment green by 1 
liteblue	.data	27	//starting color for color gradient
green		.data	28	
but1x1		.data	99	//x1 of first button
but1y1		.data	149	//y1 of first button
buttonwidth	.data	200	//width of each button
buttonheight	.data	60	//height of each button
buttonhgap	.data	40	//horizontal gap between buttons
buttonvgap	.data	40	//vertical gap between buttons

#include vgadriver.e

