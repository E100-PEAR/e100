// washes the whole screen light blue

function_drawmenu   cp      vga_x1                  num0
                    cp      vga_y1                  num0
                    cp      vga_x2                  num639
                    cp      vga_y2                  num479
                    cp      vga_color               drawmenu_bkg_color
                    call    function_vga_write      function_vga_write_ra
                    cp      menu_bkg_color          vga_color
        
// Creates a rectangle at the top of the screen to hold the Golfintosh name     
                    cp      vga_y2                  num60
                    cp      vga_color               drawmenu_top_color
                    call    function_vga_write      function_vga_write_ra
        

// creates four rectangular buttons of color menu_button_color
// first button starts at x coordinate but1x1 and y coordinate but1y1
// button separation defined by buttonvgap and buttonhgap
// button size defined by butthonheight and buttonwidth

                    cp      vga_color               menu_button_color
menu_button         cp      vga_x1                  but1x1
                    add     vga_x2                  vga_x1                  buttonwidth
                    cp      vga_y1                  but1y1
                    add     vga_y2                  vga_y1                  buttonheight
                    call    function_vga_write      function_vga_write_ra
                    add     vga_x1                  vga_x2                  buttonhgap
                    add     vga_x2                  vga_x1                  buttonwidth
                    call    function_vga_write      function_vga_write_ra
                    add     vga_y1                  vga_y2                  buttonvgap
                    add     vga_y2                  vga_y1                  buttonheight
                    call    function_vga_write      function_vga_write_ra
                    sub     vga_x2                  vga_x1                  buttonhgap
                    sub     vga_x1                  vga_x2                  buttonwidth
                    call    function_vga_write      function_vga_write_ra
                    call    function_menu_write     function_menu_write_ra
                    ret     function_drawmenu_ra

#include ../images/writeMenu.e

