# Pointer Library

The pointer library uses the VGA driver to create a small square on the screen.
The square can be "moved" and can act as a pointer to demonstrate which menu is
currently selected.

## Add the Pointer

Add the pointer to the screen with the `add_pointer` function.

```
cp pointer_x num10
cp pointer_y num20

call function_add_pointer function_add_pointer_ra
```

## Moving the Pointer

The pointer can be moved around using the `move_pointer_left`, `move_pointer_right`,
`move_pointer_up`, and `move_pointer_down` methods.` The different locations the pointer
can be moved to can be changed by editing the `pointer_left`, `pointer_right`, `pointer_top`,
and `pointer_bottom` variables.

```
call function_move_pointer_left function_move_pointer_left_ra
call function_move_pointer_right function_move_pointer_right_ra
call function_move_pointer_up function_move_pointer_up_ra
```

## Manually Moving the Pointer

The `move_pointer` function can also be used to move the pointer on the screen.

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

# Hiding the pointer.

The pointer can be hidden using the `hide_pointer` function, and can be shown again
using the `show_pointer` function.

```
// Hide the pointer
call function_hide_pointer function_hide_pointer_ra

// Show the pointer
call function_show_pointer function_show_pointer_ra
```