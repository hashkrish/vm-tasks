#!/bin/bash

if ! [ -f ~/se2001/assignment_6/script.sh ]; then
        echo "File $HOME/se2001/assignment_6/script.sh not found" >&2
        exit 1
fi

if ! [ -x ~/se2001/assignment_6/script.sh ]; then
        echo "File $HOME/se2001/assignment_6/script.sh is not executable" >&2
        exit 1
fi


temp=`echo .temp_${USERNAME}`
city=( "chennai" "kolhapur" "amritsar" "pune" "srinagar" "surat" "cherrapunjee" "indore" "bikaner" "kalaburagi" "raipur" "bengaluru" "varanasi" "visakhapatnam" )
cur=( "31.67" "32.75" "23.97" "31.09" "11.95" "28.94" "20.33" "30.09" "29.66" "33.96" "32.07" "29.94" "30.99" "31.78" )
max=( "33.01" "32.75" "23.97" "31.09" "11.95" "28.94" "20.33" "30.09" "29.66" "33.96" "32.07" "30.73" "30.99" "31.78" )
min=( "31.67" "32.75" "21.9" "31.09" "11.95" "28.94" "20.33" "30.09" "29.66" "33.96" "32.07" "27.95" "30.99" "31.78" )

num_cities="${#city[@]}"
opts=( "-C" "-W" "-S" )
nopts="${#opts[@]}"
cargs=( "min" "max" "current" )
nargc="${#cargs[@]}"

for i in {1..10};
do
    a=1000
    c=`shuf -i 0-$(( num_cities - 1 )) -n 1`
    o=`shuf -i 0-$(( nopts - 1 )) -n 1`

    if [ "$o" -eq 0 ]; then
        a=`shuf -i 0-$(( nargc - 1 )) -n 1`
    fi
    city="${city[c]}"
    opt="${opts[o]}"
    arg="${cargs[a]}"

    ./script.sh $city $opt $arg > $temp

    if [ "$o" -eq 0 ]; then
        case "$arg" in
            "min" )
                tmin=`cat $temp | jq '.temp_min'`
                if [ "$tmin" != "${min[c]}" ]; then
                    echo "Failed" >&2
                    exit 1
                fi
                ;;

            "max" )
                tmax=`cat $temp | jq '.temp_max'`
                if [ "$tmax" != "${max[c]}" ]; then
                    echo "Failed" >&2
                    exit 1
                fi
                ;;

            "current" )
                tcur=`cat $temp | jq '.temp'`
                tfah=`cat $temp | jq '.F'`
                if [ "$tcur" != "${cur[c]}" ]; then
                    echo "Failed" >&2
                    exit 1
                fi
                moc=`echo "$tcur * 1.8 + 32" | bc`
                match=`echo "${tfah}" | grep "${moc}"`
                if [ -z "$match" ]; then
                    echo "Failed" >&2
                    exit 1
                fi
                ;;     
        esac
    fi

    if [ "$o" -eq 1 ]; then
        w1=`cat $temp | jq '.speed' | grep '^[0-9]\{1\}.[0-9]\{1,2\}$'`
        w2=`cat $temp | jq '.sqrtspeed' | grep '^[0-9]\+\.[0-9]\+$'`
 
        if [ "$w1" != "" ] && [ "$w2" != "" ]; then
            sq1=`awk 'BEGIN  { printf("%.2f", ARGV[1] ^ 0.5) }' "$w1"`
            sq2=`awk 'BEGIN  { printf("%.2f", ARGV[1])}' "$w2"`

            match=`echo "${sq1}" | grep "${sq2}"`
            if [ -z "$match" ]; then
                echo "Failed" >&2
                exit 1
            fi
        else
            echo "Failed" >&2
            exit 1
        fi
    fi

    if [ "$o" -eq 2 ]; then
        list=`cat $temp`
        npat="^\"[[:alpha:]]\+[ ]\?[[:alpha:]]\+\"$"
        dpat="^\"[0-3]\{1\}[0-9]\{1\}/[0-1]\{1\}[0-9]\{1\}/20[1-3]\{1\}[0-9]\{1\}\"$"
        tpat="^\"[0-2][0-9]:[0-6][0-9]:[0-6][0-9]\"$"
        n=`echo "$list" | jq .[0] | grep "$npat"`
        d=`echo "$list" | jq .[1] | grep "$dpat"` 
        r=`echo "$list" | jq .[2] | grep "$tpat"`
        s=`echo "$list" | jq .[3] | grep "$tpat"`
        if [ "$n" == "" ] && [ "$d" == "" ] && [ "$r" == "" ] && [ "$s" == "" ]; then
            echo "Failed" >&2
            exit 1
        fi
    fi
done