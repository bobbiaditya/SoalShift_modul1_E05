#!/bin/bash

decode_img() {
    cat $2"/"$1 | base64 -d | xxd -r > $3"/"$1
}

extracted=`ls -l | grep "^dr.*nature$"`

if [ ${#extracted} == 0 ]
then
    unzip nature.zip
fi

folder_in=`pwd`"/nature"
folder_out=`pwd`"/soal_satu_out"

folder_out_exist=`ls -l | grep "^dr.*soal_satu_out$"`

if [ ${#folder_out_exist} == 0 ]
then
    mkdir `pwd`"/soal_satu_out"
fi

file_list=`ls $folder_in`

for file in $file_list
do
    decode_img $file $folder_in $folder_out
done