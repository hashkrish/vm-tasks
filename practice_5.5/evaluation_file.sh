#!/bin/bash

i=1
inp=(37907 45456 123) 
out=(70973 65454 321)

for n in {0..2};
do
        oa="$(. script.sh ${inp[n]})"
        oe="${out[n]}"

        if [ "${oa}" != "${oe}" ];
        then
                echo "Test case ${i} failed"
                exit 1
        fi
       (( i++ ))
done