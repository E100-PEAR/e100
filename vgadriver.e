vga_init        blt     vga_quit     vga_x2      vga_x1
                blt     vga_quit     vga_y2      vga_y1
		out	62		vga_zero
		out     63          vga_x1
                out     64          vga_y1
                out     65          vga_x2
                out     66          vga_y2
		out	62		vga_one
		out	67		vga_color
		out	60		vga_one
vga_wait0	in	61		vga_resp
		bne	vga_wait0	vga_resp	vga_one
		out	60		vga_zero
vga_wait1	in	61		vga_resp
		bne	vga_wait1	vga_resp	vga_zero
vga_quit        ret     vga_ret   
 




vga_x1      .data   0
vga_y1      .data   0
vga_x2      .data   20
vga_y2      .data   20
vga_color   .data   50
vga_resp    .data   0

vga_one     .data   1
vga_zero    .data   0
vga_ret     .data   0
