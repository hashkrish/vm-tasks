#!/bin/bash

test_dir="/opt/se2001/practice_5.6"
inp=(8 5 3)
i=0
for dir in "${test_dir}/test_case_"{1..3};
do
	bash script.sh ${inp[i]} > out.txt #| tee out.txt 

	diff out.txt ${dir}/output &> /dev/null
        
        if [ "$?" -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
