# Week 5 Problem 10

The shell variable `cmd` holds the command name.

**Task** -

Write a bash script `script.sh` to redirect the **manual** entry (i.e. output of man page) of the command in `cmd` to a text file `man_commandValue.txt`, where `commandValue` is the value of `cmd`. Example: if `cmd` has value `ls`, then redirect the output of `man ls` to the file `named man_ls.txt`.

If there is an error in getting the man page of the command in `cmd`, then redirect the standard error to `man_commandValue.err`. Additonally, execute the help command instead and redirect the output to the file `man_commandValue.txt`.

**Note** -

- The variable will be made available during evaluation.
- Run `export cmd="ls"` to create the variable for testing before evaluation.

**Hint** - Use operator && or || for executing help command based on exit status of first command.
