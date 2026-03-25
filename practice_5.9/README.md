# Week 5 Problem 9

The employee ID of a certain company is in the following format: `DDYYPXXX` where,

- `DD` stands for department; ex: FN for Finance, SD for Software Development
- `YY` stands for work experience, which is a two digit number.
- `P` stands for position, which is a letter; e.g. M for Manager, etc.
- `XXX` stands for ID number. Which is a three digit number.

**Task** -

Write a bash script `script.sh` to extract just the Department and the ID Number of the employee IDs stored in the shell variables `eid1`, `eid2` and `eid3`. Redirect all the output to the file named `output.txt`.

**Note** -

- Variables are created when you run `synchro eval`.
- Run `eid1="AS04M423" eid2="FF12C765" eid3="TK08W776"` to create the variables for testing your script file before evaluation.
