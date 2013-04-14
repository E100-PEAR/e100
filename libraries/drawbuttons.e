// function_draw_record_buttons draws the buttons for the record screen
// draws a gray and red record button and a red stop button

function_draw_record_buttons		cp      circle_radius           num25
   	cp      circle_center_x         num465
    cp      circle_center_y         num435
    cp      circle_color            color_light_purple
    call	function_draw_circle	function_draw_circle_ra
// drawing large circle for record button

    cp      circle_radius           num10
    cp      circle_color            color_red
    call    function_draw_circle    function_draw_circle_ra
// drawing small inner circle for record button

    cp      vga_x1		num540
    cp      vga_x2		num590
    cp      vga_y1                  num410
    cp      vga_y2                  num460
    cp      vga_color               color_red
    call    function_vga_write		function_vga_write_ra
// drawing stop button

    ret     function_draw_record_buttons_ra

function_draw_record_buttons_ra  .data  0

///////////////////////////////////////////////////////////////////////////
// function_draw_play_buttons draws the buttons for the playback screen
// draws a green play button, and a yellow pause button

function_draw_play_buttons     cp      play_color      color_green
    cp      play_initial_y  num410
    cp      play_initial_x  num520
    cp      play_height     num50
    call    function_draw_play      function_draw_play_ra
// drawing play button

    cp      vga_x1          num450
    cp      vga_x2          num465
    cp      vga_y1          num410
    cp      vga_y2          num460
    cp      vga_color       color_yellow
    call    function_vga_write  function_vga_write_ra
// drawing first rectangle of pause button

    cp      vga_x1          num480
    cp      vga_x2          num495
    call    function_vga_write   function_vga_write_ra
// drawing second rectangle of pause button

    ret     function_draw_play_buttons_ra

function_draw_play_buttons_ra  .data 0

// note to self, dont forget to add num540, num590, num410, num460, num465, color_yellow, num480, num495 and 
// color_red to constants.e