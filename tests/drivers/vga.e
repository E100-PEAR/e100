            call        function_vga    function_vga_ra
            cp          vga_x1          twenty
            cp          vga_y1          twenty
            cp          vga_x2          sixty
            cp          vga_y2          eighty
            cp          vga_color       twenty
            call        function_vga    function_vga_ra
            halt

twenty      .data   20
sixty       .data   60
eighty      .data   80

#include ../../bootstrap.e