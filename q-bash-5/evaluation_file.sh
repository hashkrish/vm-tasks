#!/bin/bash

test_dir="/opt/se2001/$(basename $(pwd))"

i=0

for dir in $(ls "$test_dir" | grep "test_case" | sort); do
  head -6 "$test_dir/$dir/input" > elevators.csv

  floor=$(sed -n '7p' "$test_dir/$dir/input")

  bash script.sh "$floor" > out.txt

  diff out.txt "$test_dir/$dir/output" &>/dev/null

  if [[ $? -eq 1 ]]; then
    echo "Test case $((i + 1)) failed"
    exit 1
  fi

  ((i++))
done