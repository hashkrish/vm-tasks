ans_file="/opt/se2001/$(basename $(pwd))/ans.txt"
touch file1.txt
bash script.sh
diff "${ans_file}" output.txt &>/dev/null
