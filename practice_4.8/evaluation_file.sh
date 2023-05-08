#!/bin/bash

rm continent.txt 2> /dev/null

. script.sh

dir="/opt/se2001/practice_4.8"
diff $dir/output  continent.txt &> /dev/null
