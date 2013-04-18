//this function records the camera input and writes it to the sd_card
//Call function_record and this function will exit to the keyboard libary
//The sd address are set in this function so nothing is needed to be passed
//in by the user


function_record         cp      addr_high_count                 current_sd_addr_high
                        add     temp_addr_high_count            addr_high_count                 num20
                        cp      addr_low_count                  num0
                        
                        call    function_erase_buttons          function_erase_buttons_ra
                        call    function_draw_record_buttons    function_draw_record_buttons_ra

function_record_start   cp      cam_scale                       num0 
                        call    function_camera                 function_camera_ra


//check if the x count or y count are at the end resolution
record_row_loop         be      reset_record_y_count            record_y_count                  resY
record_col_loop         be      reset_record_x_count            record_x_count                  resX        
                        
                        cp      vga_read_x_count                record_x_count
                        cp      vga_read_y_count                record_y_count

                        call    function_vga_read               function_vga_read_ra
                        cp      sd_write_data                   vga_read_data

                        cp      sd_addr_high                    addr_high_count  
                        cp      sd_addr_low                     addr_low_count 
                        call    function_sd_write               function_sd_write_ra

                        add     addr_low_count                  addr_low_count                  num1

                        be      reset_sd_addr_low               addr_low_count                  sd_addr_max


//increment the x count of where the video is recording
increm_record_x_count   add     record_x_count                  record_x_count                  num1

                        be      record_col_loop                 true                            true


//reset the low address of the sd card to 0 and increment the high address by 1
reset_sd_addr_low       add     addr_high_count                 addr_high_count                 num1
                        cp      addr_low_count                  num0
                        cp      play_or_compare                 num1
                        be      external_stop_video_prep        temp_addr_high_count            addr_high_count    
                        be      increm_record_x_count           true                            true


//reset the x count of the record pixel to 0
reset_record_x_count    add     record_y_count                  record_y_count                  num1
                        cp      record_x_count                  num0
                        be      record_row_loop                 true                            true     


//reset the y count of the record pixel to 0                
reset_record_y_count    cp      record_y_count                  num0
                        cp      play_or_compare                 num1
                        call    function_keyboard_record        function_keyboard_key_press_ra
                        be      function_record_start           true                            true


//stop the record function and go to the keyboard library to figure out what to do next 
external_stop_video_prep        
                        cp      record_y_count          num0
                        cp      record_x_count          num0
                        be      external_stop_video     true                            true
