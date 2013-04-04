//function to write to the sd card
//need to pass in sd_addr_low, sd_addr_high and sd_write_data
//will write sd_write_data to that adress then return

function_sd_write       in              81                      sd_response               //checks what sd_response is
                        be              function_sd             sd_response   num1        //if sd_response is 0 it advances

sd_write                out             82                      num1                      //sets sd to write
                        out             83                      sd_addr_low               //sets low address
                        out             84                      sd_addr_high              //sets high address
                        out             85                      sd_write_data             //writes the color pixel #
                        out             80                      num1                      //puts command on
checkres1               in              81                      sd_response               //checks what sd_response is
                        be              checkres1               sd_response   num0        //keep checking until sd_response = 1
                        out             80                      num0                      //turn command off
                        be              reset_low               sd_addr_low   sd_addr_max //checks if sd_addr_low is at the max
return1                 ret             function_sd_write_ra                              //return to where was called

reset_low               cp              sd_addr_low             num0                      //sets sd_addr_low to 0
                        add             sd_addr_high            sd_addr_high     num1     //increments sd_addr_high by one
                        be              return                  num1             num1     //goes to return to return in program

#include sd_vars.e