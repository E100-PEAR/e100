//This test case can be used to read numbers from an sd card or write numbers to them
		//if reading numbers set read_write in the test case to 0

		//if writing numbers set read_write in the test case to 1
		//set write_num to the number that we want to write to the sd card
//loop2 end is the addr high portion of the maximum value that can be written in the sd card


loop	cp		color_num		write_num							//sets color_num to the number we are trying to write
		cp		sd_addr_low		addr_low 							//sets the low address to the one from the test case
		cp		readwrite		read_write 							//sets read or write 
		call	function_sd		function_sd_ra 						//calls the sd function
		out		1				numread 							//outputs the number read to the LED's
		add		addr_low		addr_low			num1			//increments addr_low by one
		bne		loop			addr_low			sd_addr_max		//calls loop again if low isn't at it's max value
loop2	cp		color_num		write_num							//sets color_num to the number we are trying to write
		cp		sd_addr_high	addr_high 							//sets the high address to the one from the test case
		cp		readwrite		read_write							//sets read or write 
		call	function_sd		function_sd_ra						//calls the sd function
		out		1				numread 							//outputs the number read to the LED's
		add		addr_high		addr_high			num1			//increments the high address by 1
		cp		addr_low		num0								//sets the low address to 0
		bne		loop			addr_high			loop2_end		//calls the low loop again
		halt

loop2_end	.data	80
read_write	.data	0
write_num	.data	5
addr_low	.data	0
addr_high	.data	0
#include ../../sd.e
