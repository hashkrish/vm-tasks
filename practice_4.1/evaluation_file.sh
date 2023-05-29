#!/bin/bash

rm out.txt 2>/dev/null

bash script.sh

dir="/opt/se2001/$(basename $(pwd))"
diff $dir/output out.txt &>/dev/null
