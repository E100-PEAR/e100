//This test case can be used to read numbers from an sd card
		//set write_num to the number that we want to write to the sd card
//loop2 end is the addr high portion of the maximum value that can be written in the sd card

loop	cp		sd_addr_low				addr_low 							//sets the low addr to the one from the test case
		call	function_sd_read		function_sd_read_ra 				//calls the sd write function
		out		1						sd_read_data 						//outputs the number read to the LED's
		add		addr_low				addr_low			num1			//increments addr_low by one
		bne		loop					addr_low			sd_addr_max		//calls loop again if low isn't at it's max value
loop2	add		addr_high				addr_high			num1			//increments the high address by 1
		cp		addr_low				num0								//sets the low address to 0
		cp		sd_addr_high			addr_high 							//sets the high addr to the one from the test case
		call	function_sd_read		function_sd_read_ra					//calls the sd function
		out		1						sd_read_data 						//outputs the number read to the LED's
		add		addr_low				addr_low			num1			//increments addr_low by one
		bne		loop					addr_high			loop2_end		//calls the low loop again
		halt

loop2_end	.data	80
addr_low	.data	0
addr_high	.data	0
#include ../../drivers/sd_vars.e
#include ../../drivers/sd_read.e
#include ../../constants.e
