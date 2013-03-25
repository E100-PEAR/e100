# E100 Project

Here are the basic guidelines for the project. These aren't set in stone, but the goal is to keep
the project as organized as possible.

## Important Files and Directories

* **main.e**: The project's main file. Includes all of the `controllers`, `drivers`, and `libraries`.
* **controllers**: Contains the project's final code that uses the drivers and libraries to interact with the user. Controllers should not include any files.
* **docs**: Contains the documentation that describes how to use the functions of the drivers and libraries.
* **drivers**: The code that interfaces directly with the hardware. Drivers should not include any files.
* **libraries**: Contains functions that will be used multiple times, they provide extended functionality using the drivers. Libraries should not include any files.
* **tests**: Code that tests the drivers and the libraries. Tests can include anything (with the exception of the main.e file).

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
