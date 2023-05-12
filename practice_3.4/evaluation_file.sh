test_dir="/opt/se2001/practice_3.4"

eid1="FN04M456"
eid2="SD12C729"
eid3="WO08W003"

. script.sh

diff $test_dir/ans.txt output.txt &> /dev/null
