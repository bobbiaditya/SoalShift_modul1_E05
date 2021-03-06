## Soal 5

Pada soal nomor 5, kita diminta untuk menampilkan syslog dengan syarat:

a.	Tidak mengandung string “sudo”, tetapi mengandung string “cron”(case insensitive)

b.	Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.
Kemudian menyimpan syslog tersebut didalam file bernama "modul1" dan script ini harus dijalankan setiap 6 menit dari menit ke 2 sampai menit ke 30.


script yang kami gunakan adalah:

```bash
cat /var/log/syslog | awk 'tolower($0) ~ /cron/ &&  tolower($0) ~ !/sudo/ {print $0;}' | awk 'NF<13' >> $HOME/modul1
```

### Pembacaan file

- `cat /var/log/syslog` >> berguna untuk menampilkan semua isi dari syslog

- `pipe(|)` >> berguna untuk menambahkan syarat-syarat tertentu yang harus di jalankan bersamaan dengan proses cat

### Case Insensitive

- `awk 'tolower($0) ~ /cron/ &&  tolower($0) ~ !/sudo/ {print $0;}'` >> berguna untuk melakukan pengecekan apakah ada kata 'cron' dan tidak ada kata 'sudo' di dalam setiap baris syslog. Sebelum melakukan pengecekan kata tersebut, setiap kata akan dilakukan proses tolower terlebih dahulu.

### Jumlah Kolom

- `awk 'NF<13'` >> berguna untuk memberi syarat bahwa baris yang di tampilkan harus memiliki < 13 field(kolom)

### Penamaan file output

- `>> $HOME/modul1` menyimpan hasil proses kedalam file 


### Cron

Untuk mengatur agar script ini dijalankan sesuai waktu yang ditentukan, cron yang kami gunakan adalah

```c
2-30/6 * * * * bash $HOME/soal5.sh
```

Arti dari cron tersebut adalah dari menit 2-30 **setiap 6 menit sekali** soal.5sh akan dijalankan

### Hasil
![Soal 5](soal5.jpg)