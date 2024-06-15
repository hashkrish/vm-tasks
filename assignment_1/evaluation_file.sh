#!/usr/bin/bash

if ! [ -f ~/se2001/assignment_1/script.sh ]; then
	echo "File $HOME/se2001/assignment_1/script.sh not found" >&2
	exit 1
fi

if ! [ -x ~/se2001/assignment_1/script.sh ]; then
	echo "File $HOME/se2001/assignment_1/script.sh is not executable" >&2
	exit 1
fi

./script.sh

if [ -f ~/se2001/assignment_1/s1.txt ]; then
	if diff /opt/localserver/sample_1.txt ~/se2001/assignment_1/s1.txt; then
		echo "File s1.txt validation successful"
	else
		echo "File s1.txt validation failed" >&2
		exit 1
	fi
else
	echo "File s1.txt not found in ~/se2001/assignment_1" >&2
	exit 1
fi

for i in {2..4}; do
	if [ -f "$HOME/se2001/assignment_1/s$i.txt" ]; then
		if diff "/opt/localserver/sample_$i.txt" "$HOME/se2001/assignment_1/s$i.txt"; then
			echo "File s$i.txt validation successful" >&2
		else
			echo "File s$i.txt validation failed" >&2
		fi
	else
		echo "File s$i.txt not found in ~/se2001/assignment_1" >&2
	fi
done
