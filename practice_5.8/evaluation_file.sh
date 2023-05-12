#!/bin/bash

test_dir="/opt/se2001/practice_5.8/test_case_1"

cp $test_dir/input dfOutput.txt

bash script.sh > out.txt 

diff out.txt ${test_dir}/output &> /dev/null
        
if [ "$?" -eq 1 ];
then
    echo "Test case $(( i+1 )) failed"
    exit 1
fi
