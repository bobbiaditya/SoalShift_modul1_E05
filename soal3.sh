#!/bin/bash

i=1
check_diff="ada"
candf=""

until [ ${#check_diff} == 0 ]
do
    # cand1=`date +%s%NS | sha256sum | head -c 9`
    # cand2=`date +%NS | base64 | head -c 3`
    # candf=`echo $cand1${cand2^^} | awk '$0 ~ /[a-z]/ && $0 ~ /[0-9]/ {print $0;}'`

    candf=`head /dev/urandom | tr -dc a-zA-Z0-9 | head -c 12 | 
            awk '$0 ~ /[a-z]/ && $0 ~ /[0-9]/ && $0 ~ /[A-Z]/ {print $0;}'`
    check_diff=`cat password*txt 2> /dev/null | grep ^"$candf"$`

    if [ ${#candf} == 0 ]
    then
        check_diff="ada"
    fi
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