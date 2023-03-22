#!/usr/bin/bash

if ! [ -f ~/se2001/assignment_3/script.sh ]; then
	echo "File $HOME/se2001/assignment_3/script.sh not found" >&2
	exit 1
fi

if ! [ -x ~/se2001/assignment_3/script.sh ]; then
	echo "File $HOME/se2001/assignment_3/script.sh is not executable" >&2
	exit 1
fi

num_keywords=`grep -o -e "echo" -e "define" -e "for" -e "return" -e "bc" script.sh | wc -l` 

if [ $num_keywords -ne 5 ];
then
	echo "Function in bc is not defined properly." >&2;
	exit 1
fi

fib() {
        echo "
        define fibonacci(x) {
                fib0 = 0
                fib1 = 1
                for (i = 0; i < x - 1; i++) {
                        fib = fib0 + fib1
                        fib0 = fib1
                fib1 = fib
                }
                return fib0
        }
        fibonacci($1)
        " | bc
}
random_number=`shuf -i 1-200 -n 1`

sfibnum=`./script.sh $random_number`

efibnum=`fib $random_number`

if [[ "$sfibnum" -eq "$efibnum" ]];
then	
	echo "Fibonacci number evaluation successful";
else
	echo "Fibonacci number evaluation failed" >&2;
	exit 1
fi


