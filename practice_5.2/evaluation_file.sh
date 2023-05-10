#!/bin/bash

i=1
arr1=(1 123 1 "a")
arr2=(1 124 "afewf" "b")
ans=(2 247 "NOT INTEGERS" "NOT INTEGERS")

for n in {0..3};
do
        oa1="$(. script.sh ${arr1[n]} ${arr2[n]} 2> stderr)"
        oe="${ans[n]}"
        
        if [ $i -ge 2 ];
        then 
            oa1=`cat stderr`
            rm stderr
        fi

        if [ "${oa1}" != "${oe}" ];
        then
                echo "Test case ${i} failed"
                exit 1
        fi
        (( i++ ))
done