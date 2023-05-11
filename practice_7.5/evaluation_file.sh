#!/bin/bash

test_dir="/opt/se2001/practice_7.5"

i=0

for dir in "${test_dir}/test_case_"{1..2};
do
        while read -r line; do
                [[ $line == "" ]] && break
                echo $line
        done < $dir/input > file

        awk -f script.awk file > out.txt

        diff out.txt $dir/output &> /dev/null

        if [ $? -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
