//
// Select a video to play.
//
function_playback_menu

    // call function_show_video_menu_pointer function_show_video_menu_pointer_ra
    // call function_video_menu_handle_input function_video_menu_handle_input_ra

                            cp  keyboard_wait   true

call_keyboard_playback_menu call    function_keyboard   function_keyboard_ra

                            be      play_profession_video_1         keyboard_value  chara
                            be      play_profession_video_2         keyboard_value  chars
                            be      play_recorded_video_1           keyboard_value  chard
                            be      play_recorded_video_2           keyboard_value  charf
                            be      call_keyboard_playback_menu     true            true

play_profession_video_1     cp      addr_high_count                 num80
                            be      function_playback               true            true

play_profession_video_2     cp      addr_high_count                 num100
                            be      function_playback               true            true

play_recorded_video_1       cp      addr_high_count                 num120
                            be      function_playback               true            true

play_recorded_video_2       cp      addr_high_count                 num140
                            be      function_playback               true            true

                            ret     function_playback_menu_ra

//
// Select the video to compare the latest recorded video to.
//
function_comparison_menu

    call function_show_video_menu_pointer function_show_video_menu_pointer_ra 
    call function_video_menu_handle_input function_video_menu_handle_input_ra

    be function_comparison true true

    ret function_comparison_menu_ra

//
// Select the video to do frame by fram analysis on.
//
function_frame_menu

    // call function_show_video_menu_pointer function_show_video_menu_pointer_ra 
    // call function_video_menu_handle_input function_video_menu_handle_input_ra



call_keyboard_analysis_menu call    function_keyboard   function_keyboard_ra

                            be      frame_profession_video_1        keyboard_value  chara
                            be      frame_profession_video_2        keyboard_value  chars
                            be      frame_recorded_video_1          keyboard_value  chard
                            be      frame_recorded_video_2          keyboard_value  charf
                            be      call_keyboard_analysis_menu     true            true

frame_profession_video_1    cp      addr_high_count                 num80
                            be      function_analysis               true            true

frame_profession_video_2    cp      addr_high_count                 num100
                            be      function_analysis               true            true

frame_recorded_video_1      cp      addr_high_count                 num120
                            be      function_analysis               true            true

frame_recorded_video_2      cp      addr_high_count                 num140
                            be      function_analysis               true            true

                            ret     function_frame_menu_ra
//
// Show the video menu's pointer. Start it at the top.
//
function_show_video_menu_pointer

    cp selected_video num1

    cp pointer_x num10
    cp pointer_y num10

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

    // Move the pointer up 10 pixels and update the selected video ID.
    sub pointer_new_y pointer_y num10 
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

    // Move the pointer down 10 pixels and update the selected video ID.
    add pointer_new_y pointer_y num10
    add selected_video selected_video num1

    call function_move_pointer function_move_pointer_ra

pointer_down_return

    ret function_move_video_pointer_down_ra

function_playback_menu_ra            .data 0
function_comparison_menu_ra          .data 0
function_frame_menu_ra               .data 0
function_video_menu_handle_input_ra  .data 0
function_show_video_menu_pointer_ra  .data 0
function_move_video_pointer_up_ra    .data 0
function_move_video_pointer_down_ra  .data 0
function_select_video_ra             .data 0