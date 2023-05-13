#!/bin/bash

test_dir="/opt/se2001/practice_6.4"

i=0

for dir in "${test_dir}/test_case_"{1..2};
do
        > print.py
        while read line; do
          echo $line 
        done < $dir/input > print.py
        
        sed -f script.sed print.py > out.txt

        diff out.txt $dir/output &> /dev/null

        if [ $? -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
