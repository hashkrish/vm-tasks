#!/bin/bash

test_dir="/opt/se2001/practice_6.3"

out=(57 17728 725)

i=0

for dir in "${test_dir}/test_case_"{1..3};
do
        > lsoutput
        while read line; do
          echo $line >> lsoutput
        done < $dir/input

        . script.sh
        total=0
        for l in `cut -d " " -f 5 lsoutput`; do
          total=$((total+l))
        done
        
        if [ "$total" -ne "${out[i]}" ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
