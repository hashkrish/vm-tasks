#!/bin/bash

dir="$(pwd)"
x=$(ls -d "${dir}/"* | sed -e "s/.*\///g" | sort -n)
eo="/opt/se2001/$(basename $dir)/expected_output.txt"
y=$(cat ${eo})
echo $x | grep -q "$y" && exit 0 || exit 1
