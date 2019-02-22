
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

Kita melakukan `until` loop sampai password memenuhi persyaratan. Loop yang kita lakukan adalah kita membuat kandidat password random yang memenuhi syarat. Syaratnya adalah harus ada huruf kecil, huruf kapital, dan angka didalamnya. Jika password random yang telah dibuat tidak memenuhi syarat, program akan mengenerate kandidat password yang baru, hingga memenuhi syarat dan tidak ada yang sama dibandingkan password-password sebelumnya.

`head /dev/urandom` >> mengambil head dari berkas random yang otomatis digenerate oleh kernel

`tr -dc a-zA-Z0-9` >> megubah karakter tersebut menjadi karakter huruf dan angka

`head -c 12` >> mengambil 12 karakter dari head

`awk '$0 ~ /[a-z]/ && $0 ~ /[0-9]/ && $0 ~ /[A-Z]/ {print $0;}'` >> mengecek apakah password yang digenerate memenuhi syarat

check_diff=`cat password*txt 2> /dev/null | grep ^"$candf"$` >> mencocokkan dengan password-password sebelumnya sudah apakah ada password yang sama atau tidak

```bash
   if [ ${#candf} == 0 ]
    then
        check_diff="ada"
    fi
```

Proses diatas adalah sebagai penanda apakah ada password yang sama dengan yang sebelumnya atau password yang digenerate tidak memenuhi syarat, maka akan dibuat kandidat password yang baru.

### Cek ketersediaan password

```bash
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
```

Proses diatas adalah untuk mengecek apakah password-password yang telah digenerate ada yang hilang atau dihapus. Apabila ada password yang hilang (contoh password yang ada password{1,2,4}), maka password yang hilang ini akan digenerate(password3). Apabila semua password masih ada, maka akan mengenerate password selanjutna.
