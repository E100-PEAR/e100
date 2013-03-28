//function_sd is called and then it checks readwrite to determine wheter to read or write
//if it is to write it writes to a certain address then increments the address by one for the next call
//if it is to read it will read the number stored at the specified address then increments the address by one

function_sd in          81              sd_response               //checks what sd_response is
            be          function_sd     sd_response   num1        //if sd_response is 0 it advances
// request  be          sd_read         num0          readwrite   //go to read if readwrite is 0

//write driver
sd_write    out         82              num1                      //sets sd to write
            out         83              sd_addr_low               //sets low address
            out         84              sd_addr_high              //sets high address
            out         85              color_num                 //writes the color pixel #
            out         80              num1                      //puts command on
checkres1   in          81              sd_response               //checks what sd_response is
            be          checkres1       sd_response      num0     //keep checking until sd_response is 1
            out         80              num0                      //turn command off
            be          reset_low       sd_addr_low   sd_addr_max //checks if sd_addr_low is at the max
//            add         sd_addr_low     sd_addr_low   num1        //increments addr_low by 1
return1     ret         function_sd_ra                            //return to where sd_driver was called

//read driver
sd_read     out         82              num0                      //sets sd to read
            out         83              sd_addr_low               //sets low address
            out         84              sd_addr_high              //sets high address
            out         80              num1                      //puts command on
checkres    in          81              sd_response               //checks what sd_response is
            be          checkres        sd_response      num0     //keeps checking until sd_response is 1
            in          86              numread                   //sets numread to the memory value it read
            out         80              num0                      //turns command off
return      ret         function_sd_ra                            //return to where sd_driver was called

reset_low   cp          sd_addr_low     num0                      //sets sd_addr_low to 0
            add         sd_addr_high    sd_addr_high     num1     //increments sd_addr_high by one
            be          return          num1             num1     //goes to return to return in program

sd_addr_max     .data   32767
function_sd_ra  .data   0
readwrite       .data   0
sd_response     .data   0
numread         .data   0
color_num       .data   0
sd_addr_low     .data   0
sd_addr_high    .data   0
//find the max address that equals one gig