function_comparison         be      comparison_row_loop_1      comparison_counter      num0
                            be      comparison_second_frame    comparison_counter      num1
 
comparison_row_loop_1       be      reset_vga_write_y_count_1  vga_write_y_count       resY
comparison_col_loop_1       be      reset_vga_write_x_count_1  vga_write_x_count       resX        

comp_get_pixel_color_1      cp      sd_addr_low                addr_low_count
                            call    function_sd_read           function_sd_read_ra 

comp_set_pixel_data_1       cp      vga_x1                      vga_write_x_count
                            cp      vga_y1                      vga_write_y_count
                            cp      vga_x2                      vga_write_x_count
                            cp      vga_y2                      vga_write_y_count
                            cp      vga_color                   sd_read_data
                        
                            call    function_vga_write          function_vga_write_ra                             
                        
                            add     addr_low_count              addr_low_count          num1         
                            add     vga_write_x_count           vga_write_x_count       num1

                            bne     comparison_col_loop_1       addr_low_count          sd_addr_max

reset_addr_low_count_1      add     addr_high_count             addr_high_count         num1
                            cp      addr_low_count              num0
                            cp      sd_addr_high                addr_high_count
                            be      comp_get_pixel_color_1      true                    true                 

reset_vga_write_x_count_1   add     vga_write_y_count           vga_write_y_count       num1
                            cp      vga_write_x_count           num0
                            be      comparison_row_loop_1       true                    true 
                
reset_vga_write_y_count_1   cp      vga_write_y_count           num0
                            cp      vga_write_x_count           num0
                            add     comparison_counter          comparison_counter      num1
                            be      function_comparison         true                    true

comparison_second_frame     cp      vga_write_x_count_2         resX
                            add     vga_write_x_count_2         vga_write_x_count_2     num1
                            be      comparison_row_loop_2       true                    true 

comparison_row_loop_2       be      reset_vga_write_y_count_2   vga_write_y_count       resY
comparison_col_loop_2       be      reset_vga_write_x_count_2   vga_write_x_count       resX        

comp_get_pixel_color_2      cp      sd_addr_low                 addr_low_count_2
                            cp      sd_addr_high                addr_high_count_2
                            call    function_sd_read            function_sd_read_ra 

comp_set_pixel_data_2       cp      vga_x1                      vga_write_x_count_2
                            cp      vga_y1                      vga_write_y_count
                            cp      vga_x2                      vga_write_x_count_2
                            cp      vga_y2                      vga_write_y_count
                            cp      vga_color                   sd_read_data   
                        
                            call    function_vga_write          function_vga_write_ra                      
                        
                            add     addr_low_count_2            addr_low_count_2        num1         
                            add     vga_write_x_count           vga_write_x_count       num1
                            add     vga_write_x_count_2         vga_write_x_count_2     num1

                            bne     comparison_col_loop_2       addr_low_count_2        sd_addr_max

reset_addr_low_count_2      add     addr_high_count_2           addr_high_count_2       num1
                            cp      addr_low_count_2            num0
                            be      comp_get_pixel_color_2      true                    true                 

reset_vga_write_x_count_2   add     vga_write_y_count           vga_write_y_count       num1
                            cp      vga_write_x_count_2         resX
                            add     vga_write_x_count_2         vga_write_x_count_2     num1
                            cp      vga_write_x_count           num0
                            be      comparison_row_loop_2       true                    true 
                
reset_vga_write_y_count_2   cp      vga_write_y_count           num0
                            cp      vga_write_x_count           num0
                            cp      comparison_counter          num0
                            be      function_comparison         true                    true

#include ../../constants.e
#include ../../variables.e
#include ../../drivers/vga.e
#include ../../drivers/sd_read.e
#include ../../drivers/sd_vars.e