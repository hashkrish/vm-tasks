# Week 5 Problem 11

The shell variable `cmd` holds the command name.

**Task** -

Write a bash script `script.sh` to redirect the stderr of the command in `cmd` to a text file `error.txt` and print the stdout only if there is no error.

**Note** -

- The variable will be made available during evaluation.
- Run `export cmd="ls"` to create the variable for testing before evaluation.

**Hint** - Store the stdout to some file then based on success or failure of the command print that file.
