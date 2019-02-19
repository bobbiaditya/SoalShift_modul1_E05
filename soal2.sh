case "$1" in
    "a") awk -F ',' -f soal2a.awk WA_Sales_Products_2012-14.csv;;
    "b") awk -F ',' -f soal2b.awk WA_Sales_Products_2012-14.csv | sort -nr | head -3;;
    "c") awk -F ',' -f soal2c.awk WA_Sales_Products_2012-14.csv | sort -nr | head -3;;
    *) echo "Tidak ada subsoal selain a, b, dan c.";;
esac
