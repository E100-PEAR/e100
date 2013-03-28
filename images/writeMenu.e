function_menu_write     cp     menu_write_counter      num0   
                     cp     vga_x1      but1x1
                     cp     vga_x2      but1x1
                     cp     vga_y1      but1y1
                     cp     vga_y2      but1y1
                    add     menu_write_xend     but1x1      buttonwidth
                    add     menu_write_yend     but1y1      buttonheight
                    sub     menu_write_xend     menu_write_xend     num1
                    sub     menu_write_yend     menu_write_yend     num1
menu_write_loop     cpfa    vga_color   playvideo_array     menu_write_counter
                    be      menu_write_skip  vga_color       color_white
                    call    function_vga_write    function_vga_write_ra
menu_write_skip     add     menu_write_counter   menu_write_counter   num1
                    bne     menu_write_increment   vga_x1     menu_write_xend
                    be      menu_write_done     vga_y1      menu_write_yend
menu_write_increment    be      menu_write_dropx    vga_x1  menu_write_xend
                        add     vga_x1      vga_x1      num1
                        cp      vga_x2      vga_x1
                        bne     menu_write_loop     num1    num0     
menu_write_dropx        cp      vga_x1      but1x1
                        cp      vga_x2      vga_x1
                        add     vga_y1      vga_y1      num1
                        cp      vga_y2      vga_y1
                        bne     menu_write_loop     num1    num0
menu_write_done         ret     function_menu_write_ra

function_menu_write_ra      .data   0



                       





menu_write_xend     .data   0
menu_write_yend     .data   0
menu_write_counter   .data   0

#include playvideo.jpg.e
