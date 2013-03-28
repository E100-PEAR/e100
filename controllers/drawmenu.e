// washes the whole screen light blue

function_drawmenu	cp	vga_x1		num0
		cp	vga_y1		num0
		cp	vga_x2		num639
		cp	vga_y2 		num479
		cp	vga_color	drawmenu_bkg_color
		call	function_vga_write	function_vga_write_ra
		
// Creates a rectangle at the top of the screen to hold the Golfintosh name		
		cp	vga_y2   num60
		cp vga_color   drawmenu_top_color
		call  function_vga_write    function_vga_write_ra
		
menu_done1	cp  menu_bkg_color  vga_color

// creates four rectangular buttons of color menu_button_color
// first button starts at x coordinate but1x1 and y coordinate but1y1
// button separation defined by buttonvgap and buttonhgap
// button size defined by butthonheight and buttonwidth

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
		
drawmenu_top_color   .data    36		
drawmenu_bkg_color   .data    35
menu_bkg_color  .data   0
menu_button_color   .data   28
function_drawmenu_ra .data 0
but1x1		.data	99	//x1 of first button
but1y1		.data	149	//y1 of first button
buttonwidth	.data	200	//width of each button
buttonheight	.data	60	//height of each button
buttonhgap	.data	40	//horizontal gap between buttons
buttonvgap	.data	40	//vertical gap between buttons

#include ../images/writeMenu.e

