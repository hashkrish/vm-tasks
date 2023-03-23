#!/usr/bin/bash

if ! [ -f ~/se2001/assignment_3/script.sh ]; then
	echo "File $HOME/se2001/assignment_3/script.sh not found" >&2
	exit 1
fi

if ! [ -x ~/se2001/assignment_3/script.sh ]; then
	echo "File $HOME/se2001/assignment_3/script.sh is not executable" >&2
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


random_number=( `shuf -i 1-100 -n 3` )
for i in ${random_number[@]}; do
        sfibnum=$(bc -q fibonacci.bc <<< "fibonacci($i)")
        efibnum=$(fib $i)

        if [[ "$sfibnum" -ne "$efibnum" ]];
	then
                echo "Fibonacci evaluation failed" >&2;
                exit 1
        fi
done
echo "Fibonacci evaluation successful"
