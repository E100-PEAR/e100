function_mouse out 70 true

mouse_r        in 71 mouse_response
               be mouse_r mouse_response false

               in 72 mouse_dx
               in 73 mouse_dy
               in 74 mouse_b1
               in 75 mouse_b2
               in 76 mouse_b3

               out 70 false

               add mouse_x mouse_x mouse_dx
               add mouse_y mouse_y mouse_dy

               ret function_mouse_ra

mouse_response .data 0

mouse_x  .data 0
mouse_y  .data 0
mouse_dx .data 0
mouse_dy .data 0
mouse_b1 .data 0
mouse_b2 .data 0
mouse_b3 .data 0

function_mouse_ra .data 0