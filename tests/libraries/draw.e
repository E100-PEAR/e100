    cp draw_image playvideo_array
    cp draw_image_x num60
    cp draw_image_y num60

    call function_draw function_draw_ra

    halt

#include ../../constants.e
#include ../../drivers/vga.e
#include ../../libraries/draw.e
#include ../../images/playvideo.jpg.e