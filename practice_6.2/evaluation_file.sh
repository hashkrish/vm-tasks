#!/bin/bash

test_dir="/opt/se2001/practice_6.2"

fname=("alphabet" "linefile" "twister")

i=0

for dir in "${test_dir}/test_case_"{1..3};
do
        filename="${fname[i]}"
        > $filename
        while true; do
                read line
                if [[ $line == "" ]]; then break; fi
                echo $line >> $filename
        done < $dir/input

	. script.sh > out.txt

	diff out.txt ${dir}/output &> /dev/null
        
        if [ "$?" -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
