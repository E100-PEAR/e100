# E100 Project

Hello World

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