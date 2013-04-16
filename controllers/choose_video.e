//
// Select a video to play.
//
function_playback_menu      cp      addr_high_count                     playback_start_high
                            cp	    addr_low_count                      playback_start_low
                            call    function_sd_draw                    function_sd_draw_ra
                            call    function_show_video_menu_pointer    function_show_video_menu_pointer_ra
                            call    function_video_menu_handle_input    function_video_menu_handle_input_ra

                            be      play_profession_video_1             selected_video          num1
                            be      play_profession_video_2             selected_video          num2
                            be      play_recorded_video_1               selected_video          num3
                            be      play_recorded_video_2               selected_video          num4

play_profession_video_1     cp      addr_high_count                     TigerFront_start_high
	                        cp      addr_low_count		                TigerFront_start_low
                            cp      temp_addr_high_count                num67
                            cp      temp_addr_low_count                 num0
                            be      function_playback                   true                    true

play_profession_video_2     cp      addr_high_count                     TigerBehind_start_high
                            cp      addr_low_count		                TigerBehind_start_low
                            cp      temp_addr_high_count                num100
                            cp      temp_addr_low_count                 num0
                            be      function_playback                   true                    true

play_recorded_video_1       cp      addr_high_count                     num120
                            cp      addr_low_count                      num0
                            cp      temp_addr_high_count                num140
                            cp      temp_addr_low_count                 num0    
                            be      function_playback                   true                    true

play_recorded_video_2       cp      addr_high_count                     num140
                            cp      addr_low_count                      num0 
                            cp      temp_addr_high_count                num160
                            cp      temp_addr_low_count                 num0    
                            be      function_playback                   true                    true

                            ret     function_playback_menu_ra

//
// Select the video to compare the latest recorded video to.
//
function_comparison_menu    cp      addr_high_count                     comparison_start_high
                            cp      addr_low_count                      comparison_start_low
                            call    function_sd_draw                    function_sd_draw_ra
                            call    function_show_video_menu_pointer    function_show_video_menu_pointer_ra 
                            call    function_video_menu_handle_input    function_video_menu_handle_input_ra

                            cp      addr_low_count                      num0

                            be      comp_profession_video_1             selected_video          num1
                            be      comp_profession_video_2             selected_video          num2
                            be      comp_recorded_video_1               selected_video          num3
                            be      comp_recorded_video_2               selected_video          num4

comp_profession_video_1     cp      addr_high_count_2                   TigerFront_start_high
                            cp      addr_low_count_2		            TigerFront_start_low
                            cp      temp_addr_high_count_2              num67
                            cp      temp_addr_low_count_2               num0
                            be      function_comparison                 true                    true

comp_profession_video_2     cp      addr_high_count_2                   TigerBehind_start_high
                            cp      addr_low_count_2                    TigerBehind_start_low
                            cp      temp_addr_high_count_2              num100
                            cp      temp_addr_low_count_2               num0
                            be      function_comparison                 true                    true

comp_recorded_video_1       cp      addr_high_count_2                   num120
                            cp      addr_low_count_2                    num0
                            cp      temp_addr_high_count_2              num140
                            cp      temp_addr_low_count_2               num0
                            be      function_comparison                 true                    true

comp_recorded_video_2       cp      addr_high_count_2                   num140
                            cp      addr_low_count_2                    num0
                            cp      temp_addr_high_count_2              num160
                            cp      temp_addr_low_count_2               num0 
                            be      function_comparison                 true                    true

                            ret     function_comparison_menu_ra

//
// Select the video to do frame by frame analysis on.
//
function_frame_menu         cp      addr_high_count                     framebyframe_start_high
                            cp      addr_low_count                      framebyframe_start_low
                            call    function_sd_draw                    function_sd_draw_ra
                            call    function_show_video_menu_pointer    function_show_video_menu_pointer_ra 
                            call    function_video_menu_handle_input    function_video_menu_handle_input_ra

                            be      frame_profession_video_1            selected_video          num1
                            be      frame_profession_video_2            selected_video          num2
                            be      frame_recorded_video_1              selected_video          num3
                            be      frame_recorded_video_2              selected_video          num4

frame_profession_video_1    cp      addr_high_count                     TigerFront_start_high
                            cp      addr_low_count		                TigerFront_start_low
                            cp      temp_addr_high_count                num67
                            cp      temp_addr_low_count                 num0
                            be      function_analysis                   true                    true

frame_profession_video_2    cp      addr_high_count                     TigerBehind_start_high
                            cp      addr_low_count		                TigerBehind_start_low
                            cp      temp_addr_high_count                num100
                            cp      temp_addr_low_count                 num0
                            be      function_analysis                   true                    true

frame_recorded_video_1      cp      addr_high_count                     num120
                            cp      addr_low_count                      num0
                            cp      temp_addr_high_count                num140
                            cp      temp_addr_low_count                 num0
                            be      function_analysis                   true                    true

frame_recorded_video_2      cp      addr_high_count                     num140
                            cp      addr_low_count                      num0 
                            cp      temp_addr_high_count                num160
                            cp      temp_addr_low_count                 num0 
                            be      function_analysis                   true                    true

                            ret     function_frame_menu_ra
//
// Show the video menu's pointer. Start it at the top.
//
function_show_video_menu_pointer

    cp selected_video num1

    cp pointer_x num4
    cp pointer_y num175

    call function_add_pointer function_add_pointer_ra

    ret function_show_video_menu_pointer_ra
    
//
// Handle the keyboard's input to move around the pointer.
//
function_video_menu_handle_input

    call function_keyboard_on_press function_keyboard_on_press_ra

    be video_menu_up keyboard_value charw
    be video_menu_down keyboard_value chars
    be video_menu_select keyboard_value key_enter
    be video_menu_out keyboard_value key_escape

    be function_video_menu_handle_input true true

video_menu_up
    call function_move_video_pointer_up function_move_video_pointer_up_ra

    be function_video_menu_handle_input true true

video_menu_down
    call function_move_video_pointer_down function_move_video_pointer_down_ra

    be function_video_menu_handle_input true true

video_menu_select

    // We're done if a video is selected.
    ret function_video_menu_handle_input_ra

video_menu_out be menu true true

    ret function_video_menu_handle_input_ra

//
// Move the video pointer up.
//
function_move_video_pointer_up

    // Stop if the selected video is already at the top video.
    be pointer_up_return selected_video num1

    // Move the pointer up 80 pixels and update the selected video ID.
    sub pointer_new_y pointer_y num80
    cp  pointer_new_x pointer_x
    sub selected_video selected_video num1

    call function_move_pointer function_move_pointer_ra

pointer_up_return

    ret function_move_video_pointer_up_ra

//
// Move the video pointer down.
//
function_move_video_pointer_down

    // Stop if the selected video is already at the bottom video.
    be pointer_down_return selected_video num4

    // Move the pointer down 80 pixels and update the selected video ID.
    add pointer_new_y pointer_y num80
    cp  pointer_new_x pointer_x
    add selected_video selected_video num1

    call function_move_pointer function_move_pointer_ra

pointer_down_return

    ret function_move_video_pointer_down_ra
    
//
// Find the color of the current background
// 
function_find_bkg_color
    
    // Take color from point in bottom right corner of screen
    cp      vga_read_x_count     num590
    cp      vga_read_y_count     num465
    
    call    function_vga_read    function_vga_read_ra
    
    cp      bkg_color            vga_read_data
    
    ret     function_find_bkg_color_ra
//
//
//

function_playback_menu_ra            .data 0
function_comparison_menu_ra          .data 0
function_frame_menu_ra               .data 0
function_video_menu_handle_input_ra  .data 0
function_show_video_menu_pointer_ra  .data 0
function_move_video_pointer_up_ra    .data 0
function_move_video_pointer_down_ra  .data 0
function_select_video_ra             .data 0
function_find_bkg_color_ra           .data 0
