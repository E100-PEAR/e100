//just writes a 5 to the address of the sd_card

loop                cp	    sd_write_data		        write_num
	                cp	    sd_addr_low		            addr_low
                	cp	    sd_addr_high		        addr_high
	                call	function_sd_write	        function_sd_write_ra
                    add     addr_low                    addr_low                num1
                    bne     loop                        addr_low                sd_addr_max
	                halt

write_num	       .data	5
addr_low	       .data	0
addr_high	       .data	0

#include ../../drivers/sd_write.e
#include ../../drivers/sd_vars.e
#include ../../constants.e
