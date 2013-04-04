	cp      circle_radius           num25
    cp      circle_center_x         screen_height
    cp      circle_center_y         num435
    cp      circle_color            num219
    call	function_draw_circle	function_draw_circle_ra
    cp      circle_radius           num10
    cp      circle_color            num160
    call    function_draw_circle    function_draw_circle_ra
    cp      play_color      color_green
    cp      play_initial_y  num410
    cp      play_initial_x  num520
    cp      play_height     num50
    call    function_draw_play      function_draw_play_ra
	halt

#include ../../libraries/shapes.e
#include ../../drivers/vga.e
#include ../../constants.e
