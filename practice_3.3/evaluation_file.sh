#!/bin/bash

test_dir="/opt/se2001/practice_3.3"

parent_dir="/home/$(whoami)/se2001/practice_3.3"

i=1
for dir in "${test_dir}/test_case_"{1..2};
do
	. ${dir}/input
	
	oa=$(. script.sh)
	oe=$( cat ${dir}/output )
	if [ "${oa}" != "${oe}" ];
	then
		echo "Test case ${i} failed"
		exit 1
	fi
	(( i++ ))
done
