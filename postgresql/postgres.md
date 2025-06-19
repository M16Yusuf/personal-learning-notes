# Postgres SQL

Catatan belajar postgresql 
<details> 
<summary> Sumber pembelajaran dari yt Programmer Zaman Now (Click to expand!)  </summary>

https://youtu.be/iEeveYoD0SA?si=wGV7oYYJ0rdBuUWG

</details>

<details>
<summary> </summary>
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




<!-- Materi transaction -->
<details>
<summary> 05:05:28 - Transaction </summary>

**Transaction** adalah cara atau mekanisme membungkus beberapa perintah sekaligus menjadi satu operasi, hal ini bertujuan agar data tetap konsisten. Kenapa bisa konsisten? karena semua perintah yang ada dalam transaction harus berhasil semuanya atau gagal semuanya. 

contoh kasus aplikasi belanja online ketika customer menekan tombol pesan maka yt terjadi:

* insert data tabel order pesanan, 
* insert data detail order pesanan,  
* menurunkan quantity di table product dll.

Jika terjadi kesalahan/pembatalan disalah satu perintah harapannya perintah sebelumnya dibatalkan, agar data tetap konsisten. 3 perintah utama ``transaction`` di postgresql yaitu: 

|     Perintah      |       Keterangan       |
|-------------------|------------------------|
| START TRANSACTION | Memulai proses transaksi, proses selanjutnya akan dianggap transaksi sampai perintah COMMIT atau ROLLBACK |
|COMMIT             | Menyimpan secara permanen seluruh proses transaksi |
|ROLLBACK           | Membatalkan secara permanen seluruh proses transaksi |

Fitur transaction ini tidak bisa berpengaruh pada perintah **DDL (Data Definition Language)** seperti perintah merubah struktur, membuat tabel, menambahkan kolom, hapus tabel, hapus DB. Transaction hanya bisa digunakan pada perintah **DML (Data Manipulation Language)** seperti operasi Insert, Update, dan Delete saja.

```sql
-- contoh transaction
start transaction ;
insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 2');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 3');
-- hasil input 3 data diatas muncul di user yang melakukan input saja 
-- hasil input 3 data diatas akan benar-benar maksu jika sudah dicommit
select * from guestbooks;
commit;
```
</details>


<!-- Materi Locking -->
<details>
<summary> 05:16:22 - Locking </summary>

locking adalah proses mengunci data yang ada di DBMS. Misalkan pada saat menggunakan fitur ``transaction`` saat sql belum di ``commit`` atau di ``rollback`` maka datanya itu akan secara otomatis dilock terlebih dahulu sebelum akhirnya data dimasukan atau perintahnya dieksekusi.

```sql 
start transaction;
update products set description = 'mie ayam original enak' where id = 'P0001';
-- saat ini perubahan description pada data P0001 sudah dilock
-- perubahannya hanya akan dilihat oleh sesion/ atau orang tersebut
-- tapi ketika seseorang melakukan perubahan pada P0001 (data yang sama) maka 
-- perubahannya akan ditangguhkan (menunggu) hingga perintah commit disesi ini dilakukan. 
commit;
```
Proses mengunci data sangat penting dilakukan, salah satunya agar data benar-benar terjamin konsistensinya. Karena pada kenyataannya, aplikasi yang akan kita buat pasti digunakan oleh banyak pengguna, dan banyak pengguna tersebut bisa saja akan mengakses data yang sama, jika tidak ada proses locking, bisa dipastikan akan terjadi **RACE CONDITION**, yaitu proses balapan ketika mengubah data yang sama.

Contoh saja, ketika kita belanja di toko online, kita akan balapan membeli barang yang sama, jika data tidak terjaga, bisa jadi kita salah mengupdate stock karena pada saat yang bersamaan banyak yang melakukan perubahan stock barang.

**Locking manual**, saat melakukan perubahan pada data, biasanya kita akan melihat data tersebut (``select``) sebelum merubahnya. Untuk mencegah perubahan data tesebut oleh user lain pada saat kita lihat maka sebaiknya kita gunakan lock pada query select dengan menambahkan perintah ``for update`` pada query ``select`` tersebut. 
```sql 
start transaction;
select * from products where id = 'P0001' for update;
-- data P0001 sudah dilock saat query select,
-- perubahan user lain pada data 'P0001' akan ditangguhkan
```

⚠️ Selain itu ada yang diperhatikan yaitu **Deadlock**, Deadlock adalah situasi ada 2 proses yang saling menunggu satu sama lain, namun data yang ditunggu dua-duanya di lock oleh proses yang lainnya, sehingga proses menunggunya ini tidak akan pernah selesai. Contoh kasus deadlock :
```sql 
-- user ke-1 melakukan SELECT FOR UPDATE didata 'P0001'
start transaction;
select * from products where id = 'P0001' for update;
-- user ke-2 melakukan SELECT FOR UPDATE didata 'P0002'
start transaction;
select * from products where id = 'P0002' for update;
-- lalu user ke-1 melakukan SELECT FOR UPDATE didata 'P0002'
-- dan user ke-2 melakukan SELECT FOR UPDATE didata 'P0001'
```
akhirnya ``proses user ke-1`` dan ``proses user ke-2`` akan saling menunggu dan dari 4 proses ini akan terjadi yang namanya proses deadlock.
![waiting_deadlock](./img/waiting_deadlock.png)


Untungnya postgresql bisa mendeteksi proses deadlock, maka jika terjadi hal serupa postgresql akan otomatis menghentikannya. 
![deadlock](./img/deadlock.png) 
</details>




<!-- Materi schema -->
<details>
<summary>05:30:41 - Schema </summary>
Di POSTGRESQL terdapat fitur schema, secara default saat membuat  table sebenarnya kita membuat dan menyimpan data table kita di dalam schema public. Gambarannya sama seperti kita menyimpan file-file didalam sebuah folder. 

![diagram schema](./img/diagram_schema.png)

Di Postgresql kita bisa membuat schema sendiri, berikut sql untuk schema: 
```sql 
--melihat current schema  
select current_schema();
show search_path;
-- membuat dan emnghapus schema
create schema contoh;
create schema contoh1;
-- hati-hati bisa menghapus seluruh schema 
drop schema contoh;
drop schema contoh1;
-- pindah schema dari public ke contoh
set search_path to contoh;
```
Dengan adanya schema ini memungkinkan kita untuk membuat 2 tabel dengan nama yang sama disatu database tetapi berbeda schema. Saat kita membuat table otomatis table akan dibuat pada schema yang sedang dipilih ``current_schema``. Maka ketika kita ingin mengakses ataupun melakukan perubahan pada schema lain dari schema yang digunakan, kita bisa menambahkan nama ``nama_schema.nama_table`` di sqlnya. Misalkan :
```sql 
-- current_schema di contoh, ingin melihat table produk di schema public:
select * from public.products;
-- currrent_schema di public, ingin membuat table di schema contoh
create table contoh.products(
	id serial not null,
	name varchar(100) not null,
	primary key(id)
);
-- insert ke products yang ada di schema contoh saat berada di schema public
insert into contoh.products(name)
values  ('iphone'),
        ('Play station');
```
</details>




<!-- materi user management -->
<details>
<summary> 05:41:29 - User Management </summary>
Secara default user utama yang dibuat otomatis saat installasi postgres (nama user linux/mac) itu defaultnya memiliki hak akses super administrator. Proses memanage user hanya bisa dilakukan oleh user yang memiliki hak akses super administrator.

> pro tip: sebaiknya saat menggunakan postgresSQL aplikasi yang dibuat/diproduction, tidak disarankan menggunakan user utama. lebih baik membuat user baru yang khusus untuk tiap aplikasi dan dibatasi hak aksesnya untuk tiap user tersebut.

SQL membuat dan menghapus user, detail perintahnya bisa dilihat [disini](https://www.postgresql.org/docs/current/sql-createrole.html). Contoh sql membuat dan menghapus user:
```sql
-- membuat
create role yusuf;
create role anisa;
-- menghapus
drop role yusuf;
drop role anisa;
```
sql merubah user, detail dokumentasinya bisa dilihat [disini](https://www.postgresql.org/docs/current/sql-alterrole.html). Contoh sql merubah user:
```sql
-- merubah password user 
alter role yusuf login password 'rahasia';
alter role anisa login password 'rahasia';
```
Adapun cara untuk memberikan hak akses pada user yaitu dengan ``grant``, detailnya bisa dilihat [disini](https://www.postgresql.org/docs/current/sql-grant.html). Contoh penggunaan grant:
```sql
-- memberi hak akses update, insert, dan select user "yusuf" pada semua table di schema public
grant insert, update, select on all tables in schema public to yusuf;
-- memberi hak akses menggunakan dan update sequence "guestbooks_id_seq" untuk user "yusuf"
grant usage, select, update on guestbooks_id_seq to yusuf;
-- memberi hak akses insert, update, select user "anisa" pada table customer saja
grant insert, update, select on customer to anisa;
```
</details>



<!-- Materi backup -->
<details>
<summary>05:53:58 - Backup Database </summary>

> Pro tips : ada baiknya kita selalu melakukan backup data secara reguler

Untuk melakukan backup database tidak menggunakan perintah SQL, melainkan menggunakan command postgreSQL, namanya adalah ``pg_dump`` [lebih detailnya](https://www.postgresql.org/docs/current/app-pgdump.html).
```
pg_dump --host=localhost --port=5432 --dbname=belajar --username=yourname --format=plain --file=Users/yourname/backup.sql
```
</details>



<!-- materi restore -->
<details>
<summary>05:59:20 - Restore Database </summary>
Buat database baru dengan nama ``belajar_restore``

```sql 
create database belajar_restore;
```
lalu restore backup sebelumnya backup.sql ke db belajar_restore dengan perintah psql :

```
psql --host=localhost --port=5432 --dbname=belajar_restore --username=yourname --file=Users/yourname/backup.sql 
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


