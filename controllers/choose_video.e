//This controller is used when selecting a video to play for all the menus
//It sets the neccesary values for all of the functions before calling them

//
// Select a video to play.
//
function_playback_menu      cp      addr_high_count                     playback_start_high
                            cp	   addr_low_count                      playback_start_low
                            call    function_sd_draw                    function_sd_draw_ra

                            cp      selected_video                      num1
                            cp      video_pointer                       num0

                            call    function_show_video_menu_pointer    function_show_video_menu_pointer_ra
                            call    function_video_menu_handle_input    function_video_menu_handle_input_ra

                            be      play_profession_video_1             selected_video          num1
                            be      play_profession_video_2             selected_video          num2
                            be      play_recorded_video_1               selected_video          num3
                            be      play_recorded_video_2               selected_video          num4

play_profession_video_1     cp      addr_high_count                     TigerFront_start_high
	                         cp      addr_low_count		                  TigerFront_start_low
                            cp      temp_addr_high_count                num67
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num1
                            be      function_playback                   true                    true

play_profession_video_2     cp      addr_high_count                     TigerBehind_start_high
                            cp      addr_low_count		                  TigerBehind_start_low
                            cp      temp_addr_high_count                num100
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num1
                            be      function_playback                   true                    true

play_recorded_video_1       cp      addr_high_count                     num120
                            cp      addr_low_count                      num0
                            cp      temp_addr_high_count                num140
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num0    
                            be      function_playback                   true                    true

play_recorded_video_2       cp      addr_high_count                     num140
                            cp      addr_low_count                      num0 
                            cp      temp_addr_high_count                num160
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num0    
                            be      function_playback                   true                    true

                            ret     function_playback_menu_ra

//
// Select the video to compare the latest recorded video to.
//
function_comparison_menu    cp      addr_high_count                     comparison_start_high
                            cp      addr_low_count                      comparison_start_low
                            call    function_sd_draw                    function_sd_draw_ra

                            cp      selected_video                      num1
                            cp      video_pointer                       num1

                            call    function_show_video_menu_pointer    function_show_video_menu_pointer_ra 
                            call    function_video_menu_handle_input    function_video_menu_handle_input_ra

                            cp      addr_low_count                      num0

                            be      comp_profession_video_1             selected_video          num1
                            be      comp_profession_video_2             selected_video          num2
                            be      comp_recorded_video_1               selected_video          num3
                            be      comp_recorded_video_2               selected_video          num4

comp_profession_video_1     cp      addr_high_count_2                   TigerFront_start_high
                            cp      addr_low_count_2		               TigerFront_start_low
                            cp      temp_addr_high_count_2              num67
                            cp      temp_addr_low_count_2               num0
                            cp      user_or_tiger_video                 num1
                            be      function_comparison                 true                    true

comp_profession_video_2     cp      addr_high_count_2                   TigerBehind_start_high
                            cp      addr_low_count_2                    TigerBehind_start_low
                            cp      temp_addr_high_count_2              num100
                            cp      temp_addr_low_count_2               num0
                            cp      user_or_tiger_video                 num1
                            be      function_comparison                 true                    true

comp_recorded_video_1       cp      addr_high_count_2                   num120
                            cp      addr_low_count_2                    num0
                            cp      temp_addr_high_count_2              num140
                            cp      temp_addr_low_count_2               num0
                            cp      user_or_tiger_video                 num0
                            be      function_comparison                 true                    true

comp_recorded_video_2       cp      addr_high_count_2                   num140
                            cp      addr_low_count_2                    num0
                            cp      temp_addr_high_count_2              num160
                            cp      temp_addr_low_count_2               num0
                            cp      user_or_tiger_video                 num0 
                            be      function_comparison                 true                    true

                            ret     function_comparison_menu_ra

//
// Select the video to do frame by frame analysis on.
//
function_frame_menu         cp      addr_high_count                     framebyframe_start_high
                            cp      addr_low_count                      framebyframe_start_low
                            call    function_sd_draw                    function_sd_draw_ra
                        
                            cp      selected_video                      num1 
                            cp      video_pointer                       num2

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
                            cp      user_or_tiger_video                 num1
                            cp      vid_start_addr_high                 TigerFront_start_high
                            be      function_analysis                   true                    true

frame_profession_video_2    cp      addr_high_count                     TigerBehind_start_high
                            cp      addr_low_count		                TigerBehind_start_low
                            cp      temp_addr_high_count                num100
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num1
                            cp      vid_start_addr_high                 TigerBehind_start_high
                            be      function_analysis                   true                    true

frame_recorded_video_1      cp      addr_high_count                     num120
                            cp      addr_low_count                      num0
                            cp      temp_addr_high_count                num140
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num0
                            cp      vid_start_addr_high                 num120
                            be      function_analysis                   true                    true

frame_recorded_video_2      cp      addr_high_count                     num140
                            cp      addr_low_count                      num0 
                            cp      temp_addr_high_count                num160
                            cp      temp_addr_low_count                 num0
                            cp      user_or_tiger_video                 num0
                            cp      vid_start_addr_high                 num140
                            be      function_analysis                   true                    true

                            ret     function_frame_menu_ra
//
// Show the video menu's pointer. Start it at the top.
//
function_show_video_menu_pointer

    cp selected_video num1

    call function_set_pointer_coordinates function_set_pointer_coordinates_ra

    cp pointer_x pointer_new_x
    cp pointer_y pointer_new_y

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
    
    // Internally select the previous video.
    sub selected_video selected_video num1

    // Set the pointer's new coordinates and then move it.
    call function_set_pointer_coordinates function_set_pointer_coordinates_ra
    call function_move_pointer function_move_pointer_ra

pointer_up_return

    ret function_move_video_pointer_up_ra

//
// Move the video pointer down.
//
function_move_video_pointer_down

    // Stop if the selected video is already at the bottom video.
    be pointer_down_return selected_video num4

    // Internally select the next video.
    add selected_video selected_video num1

    // Set the pointer's new coordinates and then move it.
    call function_set_pointer_coordinates function_set_pointer_coordinates_ra
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
// Each of the different x and y coordinate positions are
// stored below in the array video_pointer_positions.
// 
// The pointer offset is calculated by:
//
//    x = (8*video_pointer) + (selected_video-1) * 2
//    y = x + 1
//
function_set_pointer_coordinates

    sub video_pointer_a selected_video num1              // selected_video - 1
    mult video_pointer_a video_pointer_a num2            // (selected_video-1) * 2

    mult video_pointer_b num8 video_pointer              // (8*video_pointer)
    
    add pointer_offset video_pointer_a video_pointer_b   // (8*video_pointer) + (selected_video-1) * 2

    // Save the new x coordinate.
    cpfa pointer_new_x video_pointer_positions pointer_offset

    add pointer_offset pointer_offset num1

    // Save the new y coordinate.
    cpfa pointer_new_y video_pointer_positions pointer_offset

    ret function_set_pointer_coordinates_ra

// The current video pointer.
//
//    0  - Playback menu
//    1  - Comparison menu
//    2  - Analysis menu
//
video_pointer .data 0

// Variables used to calculate the position of the
// next pointer.
video_pointer_a .data 0
video_pointer_b .data 0
pointer_offset  .data 0

video_pointer_positions

// Playback menu pointers
    .data 4
    .data 175

    .data 4
    .data 255

    .data 4
    .data 335

    .data 4
    .data 415

// Comparison menu pointers
    .data 20
    .data 165

    .data 20
    .data 250

    .data 20
    .data 333

    .data 20
    .data 415

// Analysis menu pointers
    .data 20
    .data 160

    .data 20
    .data 246

    .data 20
    .data 330

    .data 20
    .data 415

function_playback_menu_ra            .data 0
function_comparison_menu_ra          .data 0
function_frame_menu_ra               .data 0
function_video_menu_handle_input_ra  .data 0
function_show_video_menu_pointer_ra  .data 0
function_move_video_pointer_up_ra    .data 0
function_move_video_pointer_down_ra  .data 0
function_select_video_ra             .data 0
function_find_bkg_color_ra           .data 0
function_set_pointer_coordinates_ra  .data 0
