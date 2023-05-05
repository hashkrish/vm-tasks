#!/bin/bash

dir="/home/$(whoami)/se2001/practice_2.2"
x=$(ls -d "${dir}/"* | sed -e "s/.*\///g" | sort -n)
eo="/opt/se2001/practice_2.2/expected_output.txt"
y=$(cat ${eo})
echo $x | grep -q "$y" && exit 0 || exit 1
