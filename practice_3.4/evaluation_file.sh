test_dir="/opt/se2001/practice_3.4"

. $test_dir/input

. script.sh

diff $test_dir/ans.txt output.txt &> /dev/null
