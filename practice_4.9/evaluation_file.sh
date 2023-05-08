#!/bin/bash

rm out.txt 2> /dev/null

. script.sh > out.txt

dir="/opt/se2001/practice_4.9"
diff $dir/output out.txt &> /dev/null
