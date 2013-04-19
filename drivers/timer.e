//This function blocks the thread for a set amount of miliseconds 
//before returning.
//To use this function you need to set the variable sleep to the number
//of miliseconds you want the program to pause for and call function_sleep
//It will return in function_sleep_ra

function_sleep      cp      sleep_time              num0                        // copy the sleep time
                    in      5                       sleep_start                 // get the start of the sleep time

check_sleep_time    in      5                       current_time                // get the current sleep time   

                    blt     handle_timer_rollback   current_time sleep_start    // reset clock based on roll back time and current time    
	                sub     sleep_time current_time sleep_start                 // find how we've been sleeping

                    mult    sleep_time sleep_time num42                         // 42 milliseconds = increment by 1
                    blt     check_sleep_time        sleep_time  sleep           // check sleep time again

                    be      end_sleep               true        true

handle_timer_rollback    
                    sub     sleep                   sleep       sleep_time      // use the last calculated sleep time to adjust the start time
                    cp      sleep_start             current_time                // start the sleep time to the current time     
                    be      check_sleep_time        true        true            // check the timer again

end_sleep           ret     function_sleep_ra

sleep               .data 0  // How long we should sleep for.
sleep_start         .data 0  // The time at which the sleeper started.
current_time        .data 0  // The current time.
sleep_time          .data 0  // How long we've been sleeping.

function_sleep_ra .data 0