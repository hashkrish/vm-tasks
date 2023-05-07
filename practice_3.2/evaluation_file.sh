ans_file="/opt/se2001/practice_3.2/ans.txt"
touch file1.txt
. script.sh
diff "${ans_file}" output.txt &> /dev/null
