# Postgres SQL

Catatan belajar postgresql 
<details> 
<summary> Sumber pembelajaran dari yt Programmer Zaman Now  </summary>

https://youtu.be/iEeveYoD0SA?si=wGV7oYYJ0rdBuUWG

</details>

00:00:00 - Pendahuluan
00:01:22 - Pengenalan Sistem Basis Data
00:08:49 - Pengenalan PostgreSQL
00:12:59 - Menginstall PostgreSQL
00:31:35 - Database
00:41:05 - Tipe Data
00:43:13 - Tipe Data Number
00:47:13 - Tipe Data String
00:52:48 - Tipe Data Date dan Time
00:55:46 - Tipe Data Boolean
00:56:38 - Tipe Data Enum
00:58:21 - TIpe Data Lainnya
00:59:56 - Table
01:15:27 - Insert Data
01:24:06 - Select Data
01:26:42 - Primary Key
01:29:58 - Where Clause
01:32:28 - Update Data
01:40:54 - Delete Data
01:43:58 - Alias
01:49:42 - Where Operator
02:16:06 - Order By Clause
02:18:41 - Limit Clause
02:23:20 - Select Distinct Data
02:25:03 - Numeric Function
02:31:36 - Auto Increment
02:38:29 - Sequence
02:44:47 - String Function
02:47:22 - Date dan Time Function
02:50:24 - Flow Control Function
02:58:18 - Aggregate Function
03:01:33 - Grouping
03:09:14 - Constraint
03:20:44 - Index
03:36:03 - Full Text Search
03:49:16 - Table Relationship
04:02:47 - Join
04:11:54 - One to One Relationship
04:18:17 - One to Many Relationship

<details> 
<summary  style='font-weight:bold'> 04:25:52 - Many to Many Relationship </summary>

* Many to Many adalah relasi dimana ada relasi antara 2 tabel dimana table pertama bisa punya banyak relasi di table kedua, dan table kedua pun punya banyak relasi di table pertama


* Ini memang sedikit membingungkan, bagaimana caranya bisa relasi kebanyakan secara bolak balik, sedangkan di table kita cuma punya 1 kolom?

* Contoh relasi many to many adalah relasi antara produk dan penjualan, dimana setiap produk bisa dijual berkali kali, dan setiap penjualan bisa untuk lebih dari satu produk
</details>






04:40:55 - Jenis Jenis Join
04:50:05 - Subqueries
04:54:46 - Set Operator
05:05:28 - Transaction
05:16:22 - Locking
05:30:41 - Schema
05:41:29 - User Management
05:53:58 - Backup Database

    > Pro tips ; ada baiknya kita selalu melakukan backup data secara reguler

untuk backuo database tidak menggunakan perintah SQL, melainkan postgeSQL, namanya adalah ``pg_dump`` [lebih detailnya](https://www.postgresql.org/docs/current/app-pgdump.html).

```
pg_dump --host=localhost --port=5432 --dbname=belajar --usernaem=m16yusuf --format=plain --file=Users/m16yusuf/backup.sql
```



<!-- materi restore -->
<details>
<summary>05:59:20 - Restore Database </summary>
Buat database baru dengan nama ``belajar_restore``

```sql 
create database belajar_restore;
```

lalu restore backup sebelumnya backup.sql ke db belajar_restore dengan perintah psql :

```
-- psql --host=localhost --port=5432 --dbname=belajar_restore --username=yourname --file=Users/yourname/backup.sql 
```
</details>

<!-- materi selanjutnya -->
<details>
<summary> 06:03:54 - Materi Selanjutnya</summary>
Postgresql dah tamat materi selanjutnya:

* postgresql ACID
* postgresql table partitioning
* studi kasus database desing psql
* belajar bahasa pemograman
</details>



<details>
<summary> </summary>
</details>


