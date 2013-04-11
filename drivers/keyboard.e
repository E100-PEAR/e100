//
// Read a value from the keyboard.
//
// key_pressed: If the key was pressed the value will be 1. If the key
//              key was released, the value will be 0.
//
// key_value: The ASCII value of the pressed key.
//
function_keyboard

            // Tell the keyboard we're waiting for the data. 
            out 20 num1

            cp keyboard_counter num0
            cp keyboard_max_count num5

            // If this is blocking, the driver will wait until the keyboard returns
            // data before continuing. Otherwise, the keyboard will attempt to read data
            // up to five times before returning. 
            be keyboard_infinite keyboard_wait num1

            // Otherwise, let's start reading.
            be keyboard_read true true

            // We want to the driver to keep reading from the keyboard until some data
            // is returned. Let's set the max count to a negative number so that
            // the counter will never hit it.
keyboard_infinite cp keyboard_max_count neg1

keyboard_read

            // If the keyboard counter has hit the max count, return
            // out of here.
            be keyboard_return keyboard_counter keyboard_max_count

            // We're not done with the loop. Increment the counter.
            add keyboard_counter keyboard_counter num1

            in 21 keyboard_response

            // The keyboard will return 1 if the data is ready. If it isn't, let's
            // loop back up to the beginning.
            bne keyboard_read keyboard_response num1

            // The keyboard is ready. Let's fetch the keyboard's data.
            in 22 keyboard_pressed
            in 23 keyboard_value

keyboard_return

            out 20 num0

keyboard_finish

            // Let's make sure that they keyboard is no longer sending data. This ensures
            // That the current data isn't fetched the next time the keyboard driver is used.
            in 21 keyboard_response

            be keyboard_finish keyboard_response num1

            ret function_keyboard_ra

//
// Handle a pressed-key event on the keyboard.
//
// keyboard_value: The ASCII value of the pressed key.
//
function_keyboard_on_press call function_keyboard function_keyboard_ra
	bne function_keyboard_on_press keyboard_pressed num1

	ret function_keyboard_on_press_ra

//
// Handle a released-key event on the keyboard.
//
// keyboard_value: The ASCII value of the released key.
//
function_keyboard_on_release call function_keyboard function_keyboard_ra
	bne function_keyboard_on_release keyboard_pressed num0

	ret function_keyboard_on_release_ra

keyboard_wait      .data 1
keyboard_counter   .data 0
keyboard_max_count .data 5
keyboard_response  .data 0
keyboard_pressed   .data 0
keyboard_value     .data 0

function_keyboard_ra             .data 0
function_keyboard_on_press_ra    .data 0
function_keyboard_on_release_ra  .data 0

