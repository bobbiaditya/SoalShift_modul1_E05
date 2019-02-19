#!/bin/bash
# Belum bisa membuktikan uncollisionable
i=1

check_diff="ada"
until [ ${#check_diff} == 0 ]
do
    cand1=`date +%s%NS | sha256sum | head -c 9`
    cand2=`date +%NS | base64 | head -c 3`
    candf=$cand1${cand2^^}
    check_diff=`cat "password"* 2> /dev/null | grep ^"$candf"$`
done

while [ 1 ]
do
    ls_out=`ls "password"$i".txt" 2> /dev/null`
    if [ ${#ls_out} == 0 ]
    then
        echo "$candf" > "password"$i".txt"
        break
    fi

    i=`expr $i + 1`
done