	// Draw the background.
	call function_draw_background function_draw_background_ra

	// Draw a button.
	cp draw_x num60
	cp draw_y num60

	call function_draw_button function_draw_button_ra

	// Draw an image.
    cpfa draw_image images num0
    cp draw_x num60
    cp draw_y num60

    cp draw_skip_color color_white

    call function_draw_image function_draw_image_ra

    halt

#include ../../constants.e
#include ../../images/images.e
#include ../../drivers/vga.e
#include ../../libraries/draw.e