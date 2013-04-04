// function_sqrt an integer as input and computes its squareroot
// as an integer.
// Set sqrt_input then call function_sqrt to take the square of a number.
// After the function runs, sqrt_output will contain the squareroot 
// of the input.

function_sqrt	cp	sqrt_output	num0
		mult	sqrt_temp	sqrt_output	sqrt_output
sqrt_loop	blt	sqrt_finaltest	sqrt_input	sqrt_temp
		add	sqrt_output	sqrt_output	num1
		mult	sqrt_temp	sqrt_output	sqrt_output
		bne	sqrt_loop	num1  		num0
sqrt_finaltest	sub	sqrt_output	sqrt_output	num1
		mult	sqrt_temp2	sqrt_output	sqrt_output
		sub	sqrt_lowdiff	sqrt_input	sqrt_temp2
		sub	sqrt_highdiff	sqrt_temp	sqrt_input
		blt	sqrt_using_high	sqrt_highdiff	sqrt_lowdiff
		ret	function_sqrt_ra
sqrt_using_high	add	sqrt_output	sqrt_output	num1
		ret	function_sqrt_ra


function_sqrt_ra .data  0
sqrt_input	.data	99
sqrt_output	.data	0
sqrt_temp	.data	0
sqrt_temp2	.data	0
sqrt_highdiff	.data	0
sqrt_lowdiff	.data	0
