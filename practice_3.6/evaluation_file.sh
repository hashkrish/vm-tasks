#!/bin/bash

test_dir="/opt/se2001/practice_3.6"

parent_dir="/home/$(whoami)/se2001/practice_3.6"

i=1
for dir in "${test_dir}/test_case_"{1,2};
do
	. $dir/input
	
	oa=$(. script.sh)
	oe=$( cat output 2> /dev/null )
	if [ "${oa}" != "${oe}" ];
	then
		echo "Test case ${i} failed"
		exit 1
	fi
	(( i++ ))
done
