#!/bin/bash

dir="/home/$(whoami)/se2001/practice_2.1"

[ `ls -l "$dir/final.txt" | cut -d " " -f 1` == "-r-xr--r--" ] && exit 0 || exit 1
