	call function_clear_screen function_clear_screen_ra

	// Clear the screen.
	call function_draw_background function_draw_background_ra

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