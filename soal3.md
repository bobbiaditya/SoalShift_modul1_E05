
## Soal 3

### Creating Variables

Pertama kali, kita harus membuat variabel yang akan kita gunakan nantinya.

```bash
# variabel i digunakan untuk iterasi pada pengecekan file nantinya
# check_diff sebagai placeholder untuk mengetahui apakah
# ... password yang dihasilkan sudah sesuai dengan kriteria
# candf merupakan password kandidat yang akan digunakan

i=1
check_diff="ada" 
candf=""
```

### Password Candidate Generation

Langkah selanjutnya adalah melakukan pembuatan password secara acak.

```bash
until [ ${#check_diff} == 0 ]
do
    candf=`head /dev/urandom | tr -dc a-zA-Z0-9 | head -c 12 | 
            awk '$0 ~ /[a-z]/ && $0 ~ /[0-9]/ && $0 ~ /[A-Z]/ {print $0;}'`
    check_diff=`cat password*txt 2> /dev/null | grep ^"$candf"$`

    if [ ${#candf} == 0 ]
    then
        check_diff="ada"
    fi
done
```
Kita melakukan `until` loop sampai password memenuhi persyaratan 


### Decoding Files

Langkah selanjutnya adalah decoding berkas-berkas yang telah kita ekstrak tersebut. Kita daoat melakukannya dengan ...

```bash
decode_img() {
    cat $2"/"$1 | base64 -d | xxd -r > $3"/"$1
}

file_list=`ls $folder_in`

for file in $file_list
do
    decode_img $file $folder_in $folder_out
    ... # command untuk subbab bawah
done
```

### Displaying Images

Kemudian kita harus menampilkan gambar tersebut. Hal ini dapat dilakukan dengan menggunakan utilitas `display` yang merupakan bawaan dari utilitas **ImageMagick**.

```bash
# Kita harus melakukan export display port 
# terlebih dahulu, agar berkas dapat dibuka
# di program GUI
export DISPLAY=:0

# Iterasi ini sama dengan iterasi di Decoding Files
for file in $file_list
do
   ... # command subbab atas
   display $folder_out/$file 
done
```