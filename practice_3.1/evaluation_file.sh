#!/bin/bash

ans_file="/opt/se2001/practice_3.1/ans.txt"

diff "${ans_file}" file2.txt &> /dev/null
