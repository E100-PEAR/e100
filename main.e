//This file loads all the drivers in the correct order
//It is essentially int main() in c++

#include controllers/menu.e
#include controllers/choose_video.e
#include controllers/analysis.e
#include controllers/comparison.e
#include controllers/playback.e
#include controllers/record.e

#include drivers/camera.e
#include drivers/keyboard.e
#include drivers/sd_vars.e
#include drivers/sd_write.e
#include drivers/sd_read.e
#include drivers/timer.e
#include drivers/vga.e

#include libraries/pointer.e
#include libraries/draw.e
#include libraries/keyboard.e
#include libraries/shapes.e
#include libraries/drawbuttons.e
#include libraries/math.e

#include constants.e
#include variables.e
