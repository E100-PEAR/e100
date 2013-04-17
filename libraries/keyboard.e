function_analysis_key_press
                        cp       keyboard_wait true

call_analysis_read      call    function_keyboard       function_keyboard_ra
                        be      goto_menu               keyboard_value         key_escape
                        be      analysis_rewind         keyboard_value        charr
                        bne     call_analysis_read      keyboard_value        key_space  
                        ret     function_keyboard_key_press_ra

function_keyboard_playback
                        cp      keyboard_wait               false
                        call    function_keyboard           function_keyboard_ra    

                        be      external_pause_video        keyboard_value          chary
                        be      goto_menu                   keyboard_value          key_escape

function_keyboard_record             
                        cp      keyboard_wait               false
                        call    function_keyboard           function_keyboard_ra    

                        be      external_stop_video_2       keyboard_value          chars
                        be      goto_menu                   keyboard_value          key_escape

                        ret     function_keyboard_key_press_ra

external_pause_video    cp      keyboard_wait               true

call_pause_read         call    function_keyboard           function_keyboard_ra
                        be      goto_menu                   keyboard_value          key_escape
                        bne     call_pause_read             keyboard_value          charg
                        ret     function_keyboard_key_press_ra

external_stop_video     cp      keyboard_wait         true

call_stop_read          call    function_keyboard           function_keyboard_ra
                        be      instant_playback            keyboard_value            charp
                        be      goto_menu                   keyboard_value            key_escape
                        be      save_video                  keyboard_value            key_enter 
                        be      call_stop_read              true                      true
                        ret     function_keyboard_key_press_ra

instant_playback        cp      addr_low_count              num0
                        cp      addr_low_count_2            num0
                        be      comp_instant_playback       play_or_compare     num0
                        be      addr_high_120               addr_high_count     num140
                        be      addr_high_140               addr_high_count     num160
                        blt     addr_high_55                addr_high_count     num90
                        blt     addr_high_90                addr_high_count     num120
                        blt     addr_high_120               addr_high_count     num140
                        blt     addr_high_140               addr_high_count     num160

comp_instant_playback   be      addr_high_120               addr_high_count_2   num140
                        be      addr_high_140               addr_high_count_2   num160
                        blt     addr_high_55                addr_high_count_2   num90
                        blt     addr_high_90                addr_high_count_2   num120
                        blt     addr_high_120               addr_high_count_2   num140
                        blt     addr_high_140               addr_high_count_2   num160

where_to_go             cp      vga_write_x_count           num0
                        cp      vga_write_x_count_2         num0
                        cp      vga_write_y_count           num0
                        be      function_playback           play_or_compare     num1
                        be      function_analysis_start     play_or_compare     num2
                        cp      comparison_counter          num0
                        be      function_comparison         play_or_compare     num0
                        be      goto_menu                   true                true

addr_high_55            cp      addr_high_count             TigerFront_start_high
                        cp      addr_low_count              TigerFront_start_low
                        cp      addr_high_count_2           TigerFront_start_high
                        cp      addr_low_count_2            TigerFront_start_low
                        cp      temp_addr_high_count        num67
                        cp      temp_addr_low_count         num0
                        cp      temp_addr_high_count_2      num67
                        cp      temp_addr_low_count_2       num0
                        cp      user_or_tiger_video         num1
                        be      where_to_go                 true                true

addr_high_90            cp      addr_high_count             TigerBehind_start_high
                        cp      addr_low_count              TigerBehind_start_low
                        cp      addr_high_count_2           TigerBehind_start_high
                        cp      addr_low_count_2            TigerBehind_start_low
                        cp      temp_addr_high_count        num100
                        cp      temp_addr_low_count         num0
                        cp      temp_addr_high_count_2      num100
                        cp      temp_addr_low_count_2       num0
                        cp      user_or_tiger_video         num1
                        be      where_to_go                 true                true

addr_high_120           cp      addr_high_count             num120
                        cp      addr_high_count_2           num120
                        cp      temp_addr_high_count        num140
                        cp      temp_addr_low_count         num0
                        cp      temp_addr_high_count_2      num140
                        cp      temp_addr_low_count_2       num0
                        cp      user_or_tiger_video         num0
                        be      where_to_go                 true                true

addr_high_140           cp      addr_high_count             num140
                        cp      addr_high_count_2           num140
                        cp      temp_addr_high_count        num160
                        cp      temp_addr_low_count         num0
                        cp      temp_addr_high_count_2      num160
                        cp      temp_addr_low_count_2       num0
                        cp      user_or_tiger_video         num0
                        be      where_to_go                 true                true

save_video              be      goto_menu                   addr_high_count     num100
                        be      goto_menu                   addr_high_count     num120
                        be      save_addr_high_140          addr_high_count     num140
                        be      save_addr_high_160          addr_high_count     num160
                        blt     goto_menu                   addr_high_count     num100
                        blt     goto_menu                   addr_high_count     num120
                        blt     save_addr_high_140          addr_high_count     num140
                        blt     save_addr_high_160          addr_high_count     num160
                        be      goto_menu                   true                true

save_addr_high_100      be      goto_menu                   true                true

save_addr_high_120      be      goto_menu                   true                true

save_addr_high_140      cp      sd_write_data               num256
                        call    function_sd_write           function_sd_write_ra
                        cp      addr_low_count              num0
                        cp      current_sd_addr_high        num140
                        be      goto_menu                   true                true

save_addr_high_160      cp      sd_write_data               num256
                        call    function_sd_write           function_sd_write_ra
                        cp      addr_low_count              num0
                        cp      current_sd_addr_high        num140
                        cp      last_video_recorded         num2
                        be      goto_menu                   true                true

goto_menu               cp      addr_high_count             current_sd_addr_high
                        cp      addr_low_count              num0
                        cp      vga_write_x_count           num0
                        cp      vga_write_x_count_2         num0
                        cp      vga_write_y_count           num0
                        be      menu                        true                true

external_stop_video_2   cp      sd_write_data               num256
                        call    function_sd_write           function_sd_write_ra
                        be      external_stop_video         true                true
