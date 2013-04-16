function_sleep

    // Make sure that the function starts with a
    // sleep time of 0 ms.
    cp sleep_time num0

    // Let's get the sleep start time.
    in 5 sleep_start

check_sleep_time

	// Let's get the current sleep time.
    in 5 current_time

    // If the current time is smaller than the rollback time,
    // the clock has resetted. Let's fix that.
    blt handle_timer_rollback current_time sleep_start

    // Let's find how we've been sleeping.
	sub sleep_time current_time sleep_start

    // 42 milliseconds have passed when the sleep time
    // increases by 1.
    mult sleep_time sleep_time num42

    // Check the sleep time again if the sleep time is still
    // smaller than the time to sleep.
    blt check_sleep_time sleep_time sleep

    be end_sleep true true

handle_timer_rollback

    // We'll use the last calculated sleep time to adjust the start time.
    sub sleep sleep sleep_time

    // Let's start the sleep time to the current time.
    cp sleep_start current_time

    // Now that we've adjusted for the rollback,let's check the timer again.
    be check_sleep_time true true

end_sleep

	ret function_sleep_ra

sleep               .data 0  // How long we should sleep for.
sleep_start         .data 0  // The time at which the sleeper started.
current_time        .data 0  // The current time.
sleep_time          .data 0  // How long we've been sleeping.

function_sleep_ra .data 0