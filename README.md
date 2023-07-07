# Test-Dev-B2B-SAT

Cara menjalankan Program :
1. Instal requirement. pip -r requirements.txt
2. Konfigurasi database
3. import database.sql
4. jalankan di postgress dengan conection:localhost post:5432 username:postgres (postgresql://postgres:root@localhost/postgres)
5. buat tabel nya yang ada di Tabel Mahasiswa.txt
6. Run Main.py agar membuat API yang berhubungan dengan database
7. Buka Folder templates lalu buka index.html tujuannya adalah membuat antarmuka berbasis web yang memungkinkan untuk melakukan operasi CRUD (Create, Read, Update, Delete) terhadap data mahasiswa melalui permintaan HTTP ke API
8. Running on http://127.0.0.1:5000
