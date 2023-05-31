#!/bin/bash

ans_file="/opt/se2001/$(basename $(pwd))/ans.txt"

diff "${ans_file}" file2.txt &>/dev/null
