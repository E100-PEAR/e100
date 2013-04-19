//This file stores many of the variables used by drivers and controllers in this project
//There are no functions in this file


addr_low_count      .data   0
addr_low_count_2    .data   0

addr_high_count         .data   120
addr_high_count_2       .data   140
temp_addr_high_count    .data   0
temp_addr_low_count     .data   0
temp_addr_high_count_2  .data   0
temp_addr_low_count_2   .data   0
current_sd_addr_high    .data   120

time_to_stop            .data   0

last_video_recorded     .data   1

vga_write_x_count   .data   0
vga_write_x_count_2 .data   0

vga_write_y_count   .data   0

record_x_count  .data   0
record_y_count  .data   0

playback_resX           .data   80
playback_resY           .data   60
analysis_resX           .data   80
analysis_resY           .data   60
comparison_resX         .data   80
comparison_resY         .data   60
draw_resX               .data   0
draw_resY               .data   0
play_or_compare         .data   0
user_or_tiger_video     .data   0  // set this equal to 0 if user video, 1 if tiger video

comparison_counter  .data   0

button_x1   .data   99
button_y1   .data   169
button_x2   .data   339
button_y2   .data   269

// The ID of the video that is currently selected.
selected_video .data 1

// Change color scheme by changing these values     
drawmenu_top_color  .data   39        // top rectangle
drawmenu_bkg_color  .data   219       // background color
menu_button_color   .data   183       // button color

menu_bkg_color  .data   0
bkg_color       .data   0   
but1x1          .data   99  // x1 of first button
but1y1          .data   169 // y1 of first button
buttonwidth     .data   200 // width of each button
buttonheight    .data   60  // height of each button
buttonhgap      .data   40  // horizontal gap between buttons
buttonvgap      .data   40  // vertical gap between buttons

function_drawmenu_ra .data 0

get_pixel_color_ra  .data   0
set_pixel_data_ra   .data   0

function_keyboard_key_press_ra  .data 0

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
