function_analysis_key_press

			cp       keyboard_wait true

call_analysis_read

			call     function_keyboard               function_keyboard_ra
			bne      call_analysis_read              keyboard_value          key_space  
			ret      function_analysis_key_press_ra

function_keybaord_playback

            cp      keyboard_wait                    false
            call    function_keyboard                function_keyboard_ra 

            be      external_pause_video             keyboard_value          chary
            be      menu                             keyboard_value          key_escape

            ret     function_keybaord_playback_ra

external_pause_video

            cp      keyboard_wait                    true

call_pause_read

            call    function_keyboard                function_keyboard_ra
            bne     call_pause_read                  keyboard_value         charg
            ret     function_keybaord_playback_ra