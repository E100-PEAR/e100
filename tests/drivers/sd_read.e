loop	cp	num		write_num
	cp	low		addr_low
	cp	readwrite	read_write
	call	sd_driver	sd_pc
	out	1		numread
	add	addr_low	addr_low	num_one
	bne	loop		addr_low	loop_end
loop2	cp	num		write_num
	cp	high		addr_high
	cp	readwrite	read_write
	call	sd_driver	sd_pc
	out	1		numread
	add	addr_high	addr_high	num_one
	cp	addr_low	off
	bne	loop		addr_high	loop2_end
	halt

loop_end	.data	32767
loop2_end	.data	80
read_write	.data	0
write_num	.data	5
addr_low	.data	0
addr_high	.data	0
num_one		.data	1
#include sd.e
