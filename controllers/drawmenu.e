function_drawmenu	cp	vga_x1		num0
		cp	vga_y1		num0
		cp	vga_x2		num639
		cp	vga_y2 		num479
		cp	vga_color	liteblue
		call	function_vga_write	function_vga_write_ra
		cp	men_iloop	num0
menu_bkgloop	blt	menu_done1	men_fin		men_iloop
		add	vga_x1		vga_x1		menu_gradsize
		add	vga_y1		vga_y1		menu_gradsize
		sub	vga_x2		vga_x2		menu_gradsize
		sub	vga_y2		vga_y2		menu_gradsize
		add	vga_color	vga_color	redincr
		call	function_vga_write	function_vga_write_ra
		add	men_iloop	men_iloop	num1
		bne	menu_bkgloop	num1		num0
menu_done1	cp  menu_bkg_color  vga_color
            cp	vga_color	menu_button_color
menu_button	cp	vga_x1		but1x1
		add	vga_x2		vga_x1		buttonwidth
		cp	vga_y1		but1y1
		add	vga_y2		vga_y1		buttonheight
		call	function_vga_write	function_vga_write_ra
		add	vga_x1		vga_x2		buttonhgap
		add	vga_x2		vga_x1		buttonwidth
		call	function_vga_write	function_vga_write_ra
		add	vga_y1		vga_y2		buttonvgap
		add	vga_y2		vga_y1		buttonheight
		call	function_vga_write	function_vga_write_ra
		sub	vga_x2		vga_x1		buttonhgap
		sub	vga_x1		vga_x2		buttonwidth
		call	function_vga_write	function_vga_write_ra
        call    function_menu_write  function_menu_write_ra
		ret     function_drawmenu_ra

menu_bkg_color  .data   0
menu_button_color   .data   28
function_drawmenu_ra .data 0
men_fin		.data	6
men_iloop	.data	0
menu_gradsize	.data	8
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

#include ../images/writeMenu.e

