function_keyboard_analysis

			// Make sure the keyboard waits until the user presses a key.
			cp keyboard_wait true

_analysis_read

			// Keep reading the keyboard input until we hit a space.
			// Hitting the spacebar will display the next frame.
			call function_keyboard function_keyboard_ra

			bne _analysis_read keyboard_value key_space  

			// The user pressed the spacebar. Stop blocking the thread
			// and let the next frame be displayed.
			ret function_keyboard_analysis_ra


function_keyboard_playback_ra .data 0
function_keyboard_analysis_ra .data 0