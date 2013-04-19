// function_rewind rewinds a video two frames
// to call it, just dial f-u-n-c-t-i-o-n-_-r-e-w-i-n-d
// to implement this, we will need to know the starting addr_high of each video
// if sd_addr_high already equals this (i.e: we're already close to the
// start of the video), the function will just return without rewinding
// This prevents the user from rewinding into unknown territory
// on the sd card.

function_rewind  
                    be      rewind_return              sd_addr_high        vid_start_addr_high       
                    blt     rewind_drop_addr_high      addr_low_count      num9600
                    sub     addr_low_count             addr_low_count      num9600
                    be      rewind_return              true                true

rewind_drop_addr_high
                    sub     rewind_addr_temp           num9600             sd_addr_low
                    be      rewind_skip_sub_1          user_or_tiger_video num0
                    sub     rewind_addr_temp           rewind_addr_temp    num1
rewind_skip_sub_1   sub     addr_low_count             sd_addr_max         rewind_addr_temp
                    sub     addr_high_count            sd_addr_high        num1
                    add     addr_low_count             addr_low_count      num1
                    be      rewind_return              true                true
                     
rewind_return       ret     function_rewind_ra

rewind_addr_temp .data  0
function_rewind_ra  .data  0
vid_start_addr_high .data 74

