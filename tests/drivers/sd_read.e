loop	cp		color_num		write_num
		cp		sd_addr_low		addr_low
		cp		readwrite		read_write
		call	function_sd		function_sd_ra
		out		1				numread
		add		addr_low		addr_low			num1
		bne		loop			addr_low			sd_addr_max
loop2	cp		color_num		write_num
		cp		sd_addr_high	addr_high
		cp		readwrite		read_write
		call	function_sd		function_sd_ra
		out		1				numread
		add		addr_high		addr_high			num1
		cp		addr_low		num0
		bne		loop			addr_high			loop2_end
		halt

loop2_end	.data	80
read_write	.data	0
write_num	.data	5
addr_low	.data	0
addr_high	.data	0
#include ../../sd.e
