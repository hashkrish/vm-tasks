#!/bin/sh

if ! [ -f ~/se2001/assignment_2/script.sh ]; then
	echo "File $HOME/se2001/assignment_2/script.sh not found" >&2
	exit 1
fi

if ! [ -x ~/se2001/assignment_2/script.sh ]; then
	echo "File $HOME/se2001/assignment_2/script.sh is not executable" >&2
	exit 1
fi

~/se2001/assignment_2/script.sh

if test -f "/tmp/local_uploads/$(whoami).txt"; then
	exit 0
else
	echo "File not uploaded!" >&2
	echo "Check the URL that you have sent the file!" >&2
	exit 1
fi
