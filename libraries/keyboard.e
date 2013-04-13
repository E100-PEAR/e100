function_analysis_key_press

            cp       keyboard_wait true

call_analysis_read

            call    function_keyboard         function_keyboard_ra
            be      menu                      keyboard_value        key_escape
            bne     call_analysis_read        keyboard_value        key_space  
            ret     function_keyboard_key_press_ra

function_keyboard_playback

            cp      keyboard_wait           false
            call    function_keyboard       function_keyboard_ra     

            be      external_pause_video    keyboard_value          chary
            be      menu                    keyboard_value          key_escape

function_keyboard_record

            cp      keyboard_wait           false
            call    function_keyboard       function_keyboard_ra    

            be      external_stop_video     keyboard_value          chars
            be      menu                    keyboard_value          key_escape

            ret     function_keyboard_key_press_ra

external_pause_video

            cp      keyboard_wait           true

call_pause_read

            call    function_keyboard       function_keyboard_ra
            be      menu                    keyboard_value        key_escape
            bne     call_pause_read         keyboard_value        charg
            ret     function_keyboard_key_press_ra

external_stop_video
            
            cp      keyboard_wait           true

call_stop_read

            call    function_keyboard       function_keyboard_ra
            be      instant_playback_record keyboard_value        charp
            be      menu                    keyboard_value        key_escape
            bne     call_stop_read          keyboard_value        charr
            ret     function_keyboard_key_press_ra

instant_playback_record

            cp      sd_addr_low             num0
            cp      sd_addr_high_count      num0
            be      function_playback       true                  true