#!/bin/bash

test_dir="/opt/se2001/practice_7.2"

i=0

for dir in "${test_dir}/test_case_*";
do
       
        cat $dir/input  > marks.csv

        awk -f file.awk marks.csv > out.txt

        diff out.txt $dir/output &> /dev/null

        if [ $? -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi
	i=$(( i+1 ))
done
