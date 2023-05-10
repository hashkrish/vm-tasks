#!/bin/bash

test_dir="/opt/se2001/practice_6.1"

i=0

for dir in "${test_dir}/test_case_"{1..3};
do
        rm *.c 2> /dev/null
        eof="EOF"
        while read file; do
                if [[ $file =~ $eof ]]; then
                        break
                fi
                rm $file 2> /dev/null
                while read line; do
                        if [[ $line =~ $eof ]]; then 
                                break
                        fi
                        echo $line >> $file
                done
        done < $dir/input

	. script.sh > out.txt

	diff out.txt ${dir}/output &> /dev/null
        
        if [ "$?" -eq 1 ];
        then
                echo "Test case $(( i+1 )) failed"
                exit 1
        fi

	(( i++ ))
done
