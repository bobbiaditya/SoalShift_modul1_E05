Pada soal nomor 4, kita diminta untuk melakukan backup syslog setiap jam dengan kriteria:

a. Nama file “jam:menit tanggal-bulan-tahun”.

b. Isi dari file di enkrip menggunakan konversi huruf berdasarkan jam pada saat backup dilakukan

c. Selain script enkripsi, buat juga script untuk melakukan dekripsi.


Untuk kodingan script bisa diliat di [sini](https://github.com/anggar/SoalShift_modul1_E05/blob/master/soal4.sh)


Penjelasan dari script yang kami gunakan:

- `chr(){
 printf \\$(printf '%03o' $1)
}`>> Fungsi di atas berguna untuk merubah angka menjadi huruf

- `awal= cat /var/log/syslog` >> Berguna untuk menyimpan hasil pembacaan syslog ke dalam variabel syslog

- jam=`date +%H`
  menit=`date +%M`
  tanggal=`date +%d`
  bulan=`date +%m`
  tahun=`date +%Y`

  Berguna untuk menyimpan waktu, yang nantinya akan digunakan didalam nama file dan dasar melakukan enkripsi

- `fname="$jam:$menit $tanggal-$bulan-$tahun"` >> Berguna untuk memberi nama file output sesuai ketentuan

- ```
  ordajam=`expr $jam + 65`
  ordzjam=`expr $jam + 65 - 1`
  chrajam=`chr $ordajam`
  chrzjam=`chr $ordzjam`
  ```