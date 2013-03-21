//only sd_driver is called and then it checks readwrite to determine wheter to read or write

sd_driver    	in    	81        	response				//checks what response is
        	be    	sd_driver    	response	on 			//if response is 0 it advances
//request       be    	sd_read        	off        	readwrite 		//go to read if readwrite is 0

//write driver
sd_write  	out   	82        	on					//sets sd to write
       		out    	83        	sd_addr_low				//sets low address
       		out    	84        	sd_addr_high				//sets high address
        	out    	85        	color_num				//writes the color pixel #
        	out    	80        	on					//puts command on
checkres1    	in    	81        	response				//checks what response is
        	be    	checkres1 	response    	off			//keep checking until response is 1
        	out    	80        	off    					//turn command off
		be	reset_low	sd_addr_low	sd_addr_max		//checks if sd_addr_low is at the max
		add	sd_addr_low	sd_addr_low	on			//increments addr_low by 1
return        	ret    	sd_write_pc						//return to where sd_driver was called
reset_low	cp	sd_addr_low	off					//sets sd_addr_low to 0
		add	sd_addr_high	sd_addr_high	on			//increments sd_addr_high by one
		be	return		on		on			//goes to return to return in program

sd_addr_max	.data	0
sd_write_pc     .data   0
readwrite    	.data   0
response    	.data   0
numread        	.data   0
color_num       .data   0
sd_addr_low     .data   0
sd_addr_high    .data   0
on        	.data   1
off        	.data   0
