cam_driver  	in	131		response
	    	be  cam_driver	response	true

cam_request	out 	132		      	x_cord
		out	133		      	y_cord
		out	134		      	cam_scale
		out 	135		      	cam_flip
		out	130		      	true
		in	131		      	response
		bne	cam_request response 	true
		out	130		      	false
		in	131		      	response
		be 	diagonal	  	num1 		  num1
loop2		be 	cam_request response	false

true      	.data	1
false		.data	0

response	.data	0

x_cord	  	.data	0
y_cord		.data	0
cam_scale	.data	2
cam_flip	.data	1
