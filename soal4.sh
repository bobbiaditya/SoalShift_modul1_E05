#!/bin/bash

chr(){
 printf \\$(printf '%03o' $1)
}

awal=`cat /var/log/syslog`

jam=`date +%H`
menit=`date +%M`
tanggal=`date +%d`
bulan=`date +%m`
tahun=`date +%Y`

fname="$jam:$menit $tanggal-$bulan-$tahun"

ordajam=`expr $jam + 64`
ordzjam=`expr $jam + 64 - 1`

chrajam=`chr $ordajam`
chrzjam=`chr $ordzjam`

if [ $jam -eq 0 ]
then
  echo $awal > "$fname"
elif [ $jam -eq 1 ]
then
  echo $awal | tr A-Za-z B-ZAb-za > "$fname"
else
  rule="$chrajam-ZA-$chrzjam"
  echo $awal | tr A-Za-z $rule${rule,,} > "$fname"
fi