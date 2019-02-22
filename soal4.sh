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


enkrip(){
	ordajam=`expr $jam + 65`
	ordzjam=`expr $jam + 65 - 1`

	chrajam=`chr $ordajam`
	chrzjam=`chr $ordzjam`

	if [ $jam -eq 0 ]
	then
	  printf '%s' "$awal" >"$fname"
	  #echo $awal > "$fname"
	elif [ $jam -eq 1 ]
	then
	  printf '%s' "$awal" | tr A-Za-z B-ZAb-za >"$fname"
	  #echo $awal | tr A-Za-z B-ZAb-za > "$fname"
	else
	  rule="$chrajam-ZA-$chrzjam"
	  printf '%s' "$awal" | tr A-Za-z $rule${rule,,} > "$fname"
	  #echo $awal | tr A-Za-z $rule${rule,,} > "$fname"
	fi
}

dekrip(){
        jam=${1:0:2}
        awal=`cat "$1 $2"`
        fname="$1 $2_d"
        ordajam=`expr $jam + 65`
        ordzjam=`expr $jam + 65 - 1`

        chrajam=`chr $ordajam`
        chrzjam=`chr $ordzjam`

        if [ $jam -eq 0 ]
        then
          printf '%s' "$awal" >"$fname"
          #echo $awal > "$fname"
        elif [ $jam -eq 1 ]
        then
          printf '%s' "$awal" | tr B-ZAb-za A-Za-z >"$fname"
          #printf '%s' "$awal" | tr A-Za-z B-ZAb-za >"$fname"
          #echo $awal | tr A-Za-z B-ZAb-za > "$fname"
        else
          rule="$chrajam-ZA-$chrzjam"
          printf '%s' "$awal" | tr $rule${rule,,} A-Za-z > "$fname"  
          #printf '%s' "$awal" | tr A-Za-z $rule${rule,,} > "$fname"
          #echo $awal | tr A-Za-z $rule${rule,,} > "$fname"
        fi
}


case $1 in
        "-e") enkrip;;
        "-d") dekrip $2 $3;;
esac