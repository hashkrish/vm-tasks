#!/bin/bash

test_dir="/opt/se2001/practice_7.3"

i=0

for dir in "${test_dir}/test_case_"{1..2};
do
         
        awk -f union.awk $dir/file1 $dir/file2 > out.txt

        diff out.txt $dir/output &> /dev/null

        if [ $? -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
