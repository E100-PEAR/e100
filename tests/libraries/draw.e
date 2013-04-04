    cp vga_x1 num0
    cp vga_x2 num639
    cp vga_y1 num0
    cp vga_y2 num639
    cp vga_color color_green

    call function_vga_write function_vga_write_ra

    cpfa draw_image images num0
    cp draw_image_x num60
    cp draw_image_y num60

    cp draw_skip_color color_white

    call function_draw_image function_draw_image_ra

    halt

#include ../../constants.e
#include ../../drivers/vga.e
#include ../../libraries/draw.e
#include ../../images/playvideo.jpg.e