# Week 4 Problem 9

Write a bash script ` script.sh ` to list the names of all the c++ files (i.e. with the extension ` .cpp `) in the current directory which contains a line such that

- The line starts with the string  ` void main() ` and ends with the character  ` { `. There should be one or more spaces/tabs between the characters  ` { ` and  ` ) ` , but nothing except spaces.
  - For e.g the line ` void main(){ `, ` void main() {}} ` is not a match for the above condition, but the line ` void main() { `, ` void main()		 { ` is a match.

Note:
- Run ` synchro init ` to begin.
