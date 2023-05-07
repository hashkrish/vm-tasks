#!/bin/bash

test_dir="/opt/se2001/practice_3.5"

for dir in "${test_dir}/test_case_"{1,2};
do
    . $dir/input
    . script.sh
    diff ans.txt man_$cmd.txt &> /dev/null || exit 1
    diff ans.err man_$cmd.err &> /dev/null || exit 1
    (( i++ ))
done
