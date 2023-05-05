#!/bin/bash

tmp_file="/tmp/temp_$(whoami)"

test_dir="/opt/se2001/practice_2.7"

i=1
for dir in "${test_dir}/test_case_"{1..3};
do
        . $dir/input
        . script.sh > $tmp_file
	diff ${dir}/output $tmp_file 2> /dev/null
	if [ "$?" -ne 0 ]; then
                echo "Test case ${i} failed"
                exit 1
        fi
        (( i++ ))
done
