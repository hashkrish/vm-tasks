#!/usr/bin/bash

if ! [ -f ~/se2001/assignment_3/script.sh ]; then
	echo "File $HOME/se2001/assignment_3/script.sh not found" >&2
	exit 1
fi

if ! [ -x ~/se2001/assignment_3/script.sh ]; then
	echo "File $HOME/se2001/assignment_3/script.sh is not executable" >&2
	exit 1
fi

declare -A hash
hash[49]=4807526976
hash[83]=61305790721611591
hash[121]=5358359254990966640871840
hash[21]=6765
hash[50]=7778742049

for i in ${!hash[@]}; do
        
        sfibnum=$(bc -q fibonacci.bc <<< "fibonacci($i)")

        if [[ "$sfibnum" -ne "${hash[$i]}" ]];
	then
                echo "Fibonacci evaluation failed" >&2;
                exit 1
        fi
done
echo "Fibonacci evaluation successful"
