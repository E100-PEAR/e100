function_record call    function_camera         function_record_ra

row_loop        be      reset_y_count           y_count                 resY
col_loop        be      reset_x_count           x_count                 resX        


reset_x_count   add     y_count                 y_count                 num1
                cp      x_count                 num0
                be      row_loop                true                    true

                call    function_vga_read       function_record_ra
                be      col_loop                true                    true       
                
reset_y_count   cp      y_count                 num0
                be      function_record         true                    true

resX                    .data   79
resY                    .data   59
x_count                 .data   0
y_count                 .data   0

function_record_ra      .data   0
