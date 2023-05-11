#!/bin/bash

test_dir="/opt/se2001/practice_7.4"

out=(2 8 3)

i=0

for dir in "${test_dir}/test_case_"{1..3};
do
        cat $dir/input > file

        oa=$(awk -f script.awk file)
        oe=${out[i]}

        if [ "$oa" -ne "$oe" ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
