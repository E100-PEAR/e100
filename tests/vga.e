            call        vga_init        vga_ret
            cp          vga_x1          twenty
            cp          vga_y1          twenty
            cp          vga_x2          sixty
            cp          vga_y2          eighty
            cp          vga_color       twenty
            call        vga_init        vga_ret
            halt

twenty      .data   20
sixty       .data   60
eighty      .data   80

#include vgadriver.e
