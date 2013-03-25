# VGA Driver

The VGA driver handles displaying objects on the screen.

## Clearing the Screen

You can clear the screen by using the `clear_screen` function. This draws a black
rectangle with dimensions `screen_width` by `screen_height`.

```
call function_clear_screen function_clear_screen_ra
```

## Displaying Rectangles

A rectangle can be shown on the screen with the `vga_write` function.

```
// Set the start and end x-coordinate of the rectangle.
cp vga_x1  num10
cp vga_x2  num15

// Set the start and end y-coordinate of the rectangle.
cp vga_y1  num7
cp vga_y2  num12

// Set the color of the rectangle.
cp vga_color  color_green

call function_vga_write function_vga_write_ra
```