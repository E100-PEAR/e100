# VGA Driver

The VGA driver handles displaying objects on the screen.

## VGA function

Displays a rectangle on the screen.

```
// Set the start and end x-coordinate of the rectangle.
cp vga_x1  twenty
cp vga_x2  sixty

// Set the start and end y-coordinate of the rectangle.
cp vga_y1  twenty
cp vga_y2  eighty

// Set the color of the rectangle.
cp vga_color  twenty

call function_vga function_vga_ra
```