Pada soal nomor 5, kita diminta untuk menampilkan syslog dengan syarat:@cr
a.	Tidak mengandung string “sudo”, tetapi mengandung string “cron”(case insensitive)@cr
b.	Jumlah field (number of field) pada baris tersebut berjumlah kurang dari 13.@cr
Kemudian menyimpan syslog tersebut didalam file bernama "modul1" dan script ini harus dijalankan setiap 6 menit dari menit ke 2 sampai menit ke 30.@cr
@cr
script yang kami gunakan adalah:@cr
**cat /var/log/syslog | awk 'tolower($0) ~ /cron/ &&  tolower($0) ~ !/sudo/ {print $0;}' | awk 'NF<13' >> $HOME/modul1**@cr
@cr
-*cat /var/log/syslog* >> berguna untuk menampilkan semua isi dari syslog@cr
-*pipe(|)* >> berguna untuk menambahkan syarat-syarat tertentu yang harus di jalankan bersamaan dengan proses cat@cr
-*awk 'tolower($0) ~ /cron/ &&  tolower($0) ~ !/sudo/ {print $0;}'* >> berguna untuk melakukan pengecekan apakah ada kata 'cron' dan tidak ada kata 'sudo' di dalam setiap baris syslog. Sebelum melakukan pengecekan kata tersebut, setiap kata akan dilakukan proses tolower terlebih dahulu.@cr
-*awk 'NF<13'* >> berguna untuk memberi syarat bahwa baris yang di tampilkan harus memiliki < 13 field(kolom)@cr
-*>> $HOME/modul1* menyimpan hasil proses kedalam file modul1@cr