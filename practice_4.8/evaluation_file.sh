#!/bin/bash

rm continent.txt 2>/dev/null

bash script.sh

dir="/opt/se2001/$(basename $(pwd))"
diff $dir/output continent.txt &>/dev/null
