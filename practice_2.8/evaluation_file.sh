#!/bin/bash

test_dir="/opt/se2001/$(basename $(pwd))"

i=1
for dir in "${test_dir}/test_case_"{1..3}; do
	read TOTALCOST <$dir/input
	export TOTALCOST
	oa=$(bash script.sh)
	read oe <${dir}/output
	if [ "${oa}" != "${oe}" ]; then
		echo "Test case ${i} failed"
		exit 1
	fi
	((i++))
done
