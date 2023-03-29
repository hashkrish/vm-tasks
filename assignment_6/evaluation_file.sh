#!/bin/sh

if ! [ -f ~/se2001/assignment_6/script.sh ]; then
        echo "File $HOME/se2001/assignment_6/script.sh not found" >&2
#        exit 1
fi

if ! [ -x ~/se2001/assignment_6/script.sh ]; then
        echo "File $HOME/se2001/assignment_6/script.sh is not executable" >&2
#        exit 1
fi

city=( "chennai" "patna" "gaya" "kanyakumari" "pune" "shillong" )

declare -A hash

hash["chennai",0]=26
hash["chennai",1]=26
hash["chennai",2]=35
hash["chennai",3]="34.83"

hash["patna",0]=22
hash["patna",1]="22.33"
hash["patna",2]=37
hash["patna",3]=37

hash["gaya",0]=19
hash["gaya",1]="18.67"
hash["gaya",2]=37
hash["gaya",3]="37.17"

hash["kanyakumari",0]=24
hash["kanyakumari",1]=24
hash["kanyakumari",2]=36
hash["kanyakumari",3]="35.83"

hash["pune",0]=16
hash["pune",1]="16.67"
hash["pune",2]=34
hash["pune",3]="34.17"

hash["shillong",0]=11
hash["shillong",1]="11.33"
hash["shillong",2]=23
hash["shillong",3]="23.17"

declare -a arg2
arg2[0]="min"
arg2[1]="max"

declare -a arg3
arg3=( "mode" "average" ) 

num_cities=${#city[@]}

p=0
for i in {1..10}; do
    c=`shuf -i 0-$(( $num_cities-1 )) -n 1`
    idx2=`shuf -i 0-1 -n 1`
    if [ ${idx2} -eq 0 ]; then
       idx3=`shuf -i 0-1 -n 1`
       a3=${arg3[idx3]}
       #echo $a3
    else
       idx3=`shuf -i 2-3 -n 1`
       if [ $idx3 -eq 2 ];
       then
           a3="mode";
       else
           a3="average";
       fi
    fi
    ans1=${hash[${city[c]},${idx3}]}
    ans2=$( ./script.sh ${city[c]} ${arg2[${idx2}]} $a3 || echo -1 ) 

    if [ `echo "${ans1} == ${ans2}" | bc` -eq 0 ]; then
        if [ $i -le 5 ]; then
                echo "INPUT : ${city[c]} ${arg2[${idx2}]} $a3"
                echo -e "Answer expected : $ans1 \t found : $ans2"
                echo -e "Test case $i failed.\n" >&2
        else
                p=$(( p+1 ))
        fi
        exit 1
    fi
done

if [ $p -gt 0 ]; then
    echo -e "$p/5 private test cases failed\n" >&2
    exit 1
fi
