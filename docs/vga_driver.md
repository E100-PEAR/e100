# VGA Driver

The VGA driver handles displaying objects on the screen.

## VGA function

Displays a rectangle on the screen.

```
// Set the start and end x-coordinate of the rectangle.
cp vga_x1  num10
cp vga_x2  num15

// Set the start and end y-coordinate of the rectangle.
cp vga_y1  num7
cp vga_y2  num12

// Set the color of the rectangle.
cp vga_color  color_green

call function_vga function_vga_ra
```