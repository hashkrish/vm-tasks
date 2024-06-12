#!/bin/sh

if ! [ -f ~/se2001/regex_1/script.sh ]; then
	echo "File $HOME/se2001/regex_1/script.sh not found" >&2
	exit 1
fi

if ! [ -x ~/se2001/regex_1/script.sh ]; then
	echo "File $HOME/se2001/regex_1/script.sh is not executable" >&2
	exit 1
fi

if [[ `~/se2001/regex_1/script.sh | wc -l` -eq `wc -l pattern.txt | awk '{print $1}'` ]];then
	echo 'Evaluation Successful'
else
	echo 'Evaluation Failed'
fi
