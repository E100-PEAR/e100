# E100 Project

Here are the basic guidelines for the project. These aren't set in stone, but the goal is to keep
the project as organized as possible.

## Directories

* **controllers**: Contains the code that uses the drivers and libraries to interact with the user.
* **docs**: Contains the documentation that describes how to use the functions of the drivers and libraries.
* **drivers**: The code that interfaces directly with the hardware.
* **libraries**: Contains functions that will be used multiple times. They should simplify the code in the controllers.
* **tests**: Code that tests the drivers and the libraries.

## Function Code Standard

Function labels should use the `function_<name>` format. The return address should be
stored in a label called `function_<name>_ra`. Here is an example for the `foo` function:

```
// Call the foo function:
call function_foo function_foo_ra

// The foo function:
function_foo cp a a
             ret function_foo_ra

function_foo_ra .data 0
```