#!/bin/bash

test_dir="/opt/se2001/practice_6.5/test_case_1"

i=0

cp $test_dir/input sedintro.html

sed -n "${OPTS[@]}" -f script.sed sedintro.html > out.txt
        
diff out.txt $dir/output &> /dev/null

if [ $? -eq 1 ];
then
    echo "Test case $(( i+1 )) failed"
    exit 1
fi
