addr_low_count  .data   0
addr_high_count .data   0

vga_write_x_count   .data   0
vga_write_y_count   .data   0

record_x_count  .data   0
record_y_count  .data   0

sd_addr_high_count  .data   0

button_x1   .data   99
button_y1   .data   169
button_x2   .data   339
button_y2   .data   269

// Change color scheme by changing these values     
drawmenu_top_color  .data   39        // top rectangle
drawmenu_bkg_color  .data   219       // background color
menu_button_color   .data   183       // button color

menu_bkg_color  .data   0
but1x1          .data   99  // x1 of first button
but1y1          .data   169 // y1 of first button
buttonwidth     .data   200 // width of each button
buttonheight    .data   60  // height of each button
buttonhgap      .data   40  // horizontal gap between buttons
buttonvgap      .data   40  // vertical gap between buttons

function_drawmenu_ra .data 0

get_pixel_color_ra  .data   0
set_pixel_data_ra   .data   0

function_keybaord_playback_ra   .data 0
function_analysis_key_press_ra  .data 0
