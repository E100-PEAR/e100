cam_driver      in      131             cam_response
                be      cam_driver      cam_response    true

cam_request     out     132             x_cord
                out     133             y_cord
                out     134             cam_scale
                out     135             cam_flip
                out     130             num1
                in      131             cam_response
                bne     cam_request     cam_response    true
                out     130             false
                in      131             cam_response
                be      row_loop        true            true

cam_response    .data    0

x_cord          .data    0
y_cord          .data    0
cam_scale       .data    0
cam_flip        .data    1
