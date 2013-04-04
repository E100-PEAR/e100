//function to read from the sd card
//need to pass in sd_addr_low and sd_addr_high
//will read the value stored at that address save it in sd_read_data and returns

function_sd_read        in          81                      sd_response               //checks what sd_response is
                        be          function_sd_read        sd_response   num1        //if sd_response is 0 it advances

sd_read                 out         82                      num0                      //sets sd to read
                        out         83                      sd_addr_low               //sets low address
                        out         84                      sd_addr_high              //sets high address
                        out         80                      num1                      //puts command on
checkres                in          81                      sd_response               //checks what sd_response is
                        be          checkres                sd_response      num0     //keeps checking until sd_response is 1
                        in          86                      sd_read_data              //sets sd_read_data to the value it reads
                        out         80                      num0                      //turns command off
return                  ret         function_sd_read_ra                               //return to where was called

read_reset_low          cp          sd_addr_low             num0                      //sets sd_addr_low to 0
                        add         sd_addr_high            sd_addr_high     num1     //increments sd_addr_high by one
                        be          return                  num1             num1     //goes to return to return in program