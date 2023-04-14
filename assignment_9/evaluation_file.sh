#!/bin/bash

if ! [ -f ~/se2001/assignment_6/script.sh ]; then
    echo "File $HOME/se2001/assignment_6/script.sh not found" >&2
    exit 1
fi

if ! [ -x ~/se2001/assignment_6/script.sh ]; then
    echo "File $HOME/se2001/assignment_6/script.sh is not executable" >&2
    exit 1
fi

classes=("setosa" "versicolor" "virginica")
features=("sepal_length" "sepal_width" "petal_length" "petal_width")

in="info.txt"

ni=(1 3 5)
fi=(1 2 3 4)

nc="${#classes[@]}"
nf="${#features[@]}"

for i in {1..5}; do
    c=`shuf -i 0-$(( $nc-1 )) -n 1`
    f=`shuf -i 0-$(( $nf-1 )) -n 1`

    class="${classes[c]}"
    feature="${features[f]}"

    j="${ni[c]}"
    k="$((j+1))"
    l="${fi[f]}"

    x=($( sed "s/[ ]\+/ /g" "${in}" | sed -ne "$j,$k"p | cut -d " " -f "$l" ))
    js=`./script.sh "$class" "$feature"`

    if [ -z "$js" ]; then
        exit 1;
    fi

    m=`echo ${js} | jq ".mean"`
    s=`echo ${js} | jq ".std"`

    mf=`echo "${m} == ${x[0]}" | bc`
    sf=`echo "${s} == ${x[1]}" | bc`

    if [ "$mf" -eq 0 ] && [ "$sf" -eq 0 ]; then
        exit 1
    fi
done