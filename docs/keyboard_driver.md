# Keyboard Driver

The keyboard driver handles input from the keyboard.

## Keyboard function

Fetches the next keyboard action. Effects:

* Sets `keyboard_pressed` to 0 if the key was released.
* Sets `keyboard_pressed` to 1 if the key was pressed.
* Sets `keyboard_value` to the ASCII value of the key that was pressed/released.

```
call function_keyboard function_keyboard_ra
```

### Keyboard On Press Function

Fetches the value of the next pressed key. Has all of the same effects as the
`function_keyboard` function.

```
call function_keyboard_on_press function_keyboard_on_press_ra
```

### Keyboard On Release Function

Fetches the value of the next released key. Has all of the same effects as the
`function_keyboard` function.

```
call function_keyboard_on_release function_keyboard_on_release_ra
```