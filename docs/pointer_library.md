# Pointer Library

The pointer library uses the VGA driver to create a small square on the screen.
The square can be "moved" and can act as a pointer to demonstrate which menu is
currently selected.

## Moving the Pointer

The `move_pointer` function can be used to move the pointer on the screen.

```
// Move the pointer 10 pixels down and to the right.
add pointer_new_x pointer_x num10 
add pointer_new_y pointer_y num10

call function_move_pointer function_move_pointer_ra
```

## Changing the Pointer's Color

The `change_pointer_color` function can be used to change the pointer's color.

```
// Change the pointer's color to green:
cp pointer_new_color color_green

call function_change_pointer_color change_pointer_color_ra
```