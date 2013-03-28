draw_mouse call function_mouse function_mouse_ra
           
           cp vga_x1 mouse_x
           cp vga_y1 mouse_y

           add vga_x2 mouse_x num10
           add vga_y2 mouse_y num10

           cp vga_color color_white

//           call function_clear_screen function_clear_screen_ra
           call function_vga_write function_vga_write_ra

           be draw_mouse true true

           halt

#include ../../main.e