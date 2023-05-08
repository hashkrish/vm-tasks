#!/bin/bash

n=$(. script.sh)

if [ $n -ne 2 ]; then
   exit 1
fi
