-- ========================================================================================
-- Belajar di youtube Programmer Zaman now
-- https://youtu.be/iEeveYoD0SA?si=WkNOymSocBsg9qBa
-- ========================================================================================

-- command CMD login postgresql
-- cmd : psql --host=localhost --port=5432 --dbname=postgres --username=postgres --password

-- command CMD untuk menampilkan database yang ada di postgres
-- \l atau select datname from pg_database;

-- command bikin, delete database baru
-- create database nama_database;
-- drop database nama_database;

-- comand cmd ganti db (setelah login)
-- \c nama_database

select * from pg_tables where schemaname='public';

create table barang(
	kode INT not null,
	name varchar(100) not null,
	harga int not null default 1000,
	jumlah int not null default 0,
	waktu_dibuat TIMESTAMP not null default current_timestamp 
);

alter table barang
add column deskripsi text;


alter table barang   
drop column deskripsi;

alter table barang 
rename column name to nama;



-- Materi primary key 
create table products(
	id VARCHAR(10) not null,
	name VARCHAR(100) not null,
	description text, 
	price int not null,
	quantity int not null default 0,
	created_at TIMESTAMP not null default CURRENT_TIMESTAMP	
)

insert into products(id, name, price, quantity)
values('P0001','Mie Ayam Original',15000, 100);

insert into products(id, name, description, price, quantity)
values('P0002','Mie Ayam Baso Tahu', 'Mie Ayam original + baso tahu', 20000, 100);


insert into products(id, name, price, quantity)
values('P0003','Mie Ayam Ceker',20000, 100),
	('P0004','Mie Ayam Spesial',25000, 100),
	('P0005','Mie Ayam Yamin',15000, 100);

select * from products;

select id, name, price, quantity from products;




-- Materi Where clause 
select * from products where name='Mie Ayam Spesial';

alter table products 
add primary key (id);

select id, name, price, quantity from products where price=20000;

select id, name, price, quantity from products where id='P0004';



-- Materi update 
create type PRODUCT_CATEGORY as enum ('makanan','minuman','lain-lain');

alter table products 
	add column category PRODUCT_CATEGORY;

update products
set category = 'makanan'
where id = 'P0001';

update products
set category = 'makanan'
where id = 'P0002';

update products
set category = 'makanan'
where id = 'P0003';

update products
set category = 'makanan'
where id = 'P0004';

update products
set category = 'makanan'
where id = 'P0005';

update products
set category = 'makanan',
description = 'mie ayam + ceker'
where id = 'P0003';

update products 
set price = price + 5000
where id = 'P0004';

insert into products(id, name, price, quantity, category)
values ('P0009','Contoh','10000','100','minuman');


-- delete data 
delete from products 
where id = 'P0009';
select id, price, description from products;


-- Materi alias
select p.id as "kode barang",
		p.price as "harga barang",
		p.description as "deskipsi barang" 
from products as p;



--  where operator 
select * from products where price > 15000;

select * from products where price <= 15000;

select * from products where category != 'minuman';

select * from products where price > 15000 and category='makanan';

insert into products(id, name, price, quantity, category)
values('P0006','es teh tawar','10000','100','minuman'),
		('P0007','es campur','20000','100','minuman'),
		('P0008','jus jeruk','15000','100','minuman');

select * from products where price > 15000 or category ='makanan';

select * from products where quantity>100 or category ='makanan' and price >10000;

select * from products where category ='makanan' or (quantity>100 and price >10000);
  
select * from products where name ilike '%mie%';

select * from products where description is null;

select * from products where description is not null;

select * from products where price between 10000 and 20000;

select * from products where price not between 10000 and 20000;

select * from products where category in ('makanan', 'minuman');


-- order by clause
select * from products order by price asc, id desc;


-- limit clause 
select * from products where price > 0 order by price asc, id desc limit 2;

select * from products where price > 0 order by price asc, id desc limit 2 offset 2;

-- distinct 
select category from products;
select distinct category from products;

-- Numeric function 
select 10 + 10 as hasil;
select id, price/1000 as price_in_k from products;

-- mathematical function
-- postgresql.org/docs/15/functions-math.html
select pi();
select power(10,2);
select cos(10), sin(10), tan(10);
select id, name, power(quantity, 2) as quantity_power_2 from products;

-- auto increment 
create table admin(
	id SERIAL not null,
	first_name varchar(100) not null,
	last_name varchar(100),
	primary key(id)
);
insert into admin(first_name, last_name)
values ('Eko', 'Khannedy'),
		('Muhammad', 'Yusuf'),
		('Budi', 'Nugraha'),
		('Joko', 'Morro');
select * from admin;
-- melihat id terakhir 
select currval('admin_id_seq');

-- Sequence 
-- fitur dimana kita bisa membuat function auto increment
-- membuat sequence 
create sequence contoh_sequence;
-- memanggil sequence, otomatis increment
select nextval('contoh_sequence');
-- melihat/mengambil nilai terakhir sequence 
select currval('contoh_sequence');
-- SERIAL = nextval('admin_id_seq)
-- perintah untuk melihat sequene yang ada di database 
-- cmd/psql = \ds

-- string function (2:44:50)
-- postgresql.org/docs/15/functions-string.html
select id, name, description from products;
select id, lower(name), length(name), lower(description) from products;

-- date and time function (2:47:20)
-- postgresql.org/docs/15/functions-datetime.html
select * from products;
select id, extract(year from created_at), extract(month from created_at) from products;


-- Flow controll function (mirip if else)
-- postgres.org/docs/15/functions-conditional.html
select id, category from products;
--contoh 1:
select id, category,
	case category
		when 'makanan' then 'enak'
		when 'minuman' then 'seger'
		else 'apa itu?' 
	end as category_case
from products;
-- conto 2:
select id, price,
	case 
		when price <= 15000 then 'murah'
		when price <= 20000 then 'mahal'
		else 'mahal banget'
	end as "apakah murah?"
from products;
-- contoh 3
select id, name, description from products;
select id, name, 
	case
		when description is null then 'kosong'
		else description 
	end as description
from products;
	
-- Aggregate function (2:58:19)
-- postgresql.org/docs/current/functions-aggregate.html
-- contoh menghitung count/jumlah
select id from products;
select count(id) from products;
-- contoh average 
select avg(price) from products;
-- contoh mencari nilai min
select min(price) from products;
-- contohh mencari nilai max
select max(price) from products;


-- grouping / group by (3:01:34)
-- group  by clause hanya bisa digunakan jika pakai aggregate function
-- contoh satu
select category, count(id) as "total product"
from products group by category; 
-- contoh dua 
select category, 
	avg(price) as "rata-rata harga", 
	min (price) as "Harga terendah",
	max(price) as "Harga termahal"
from products group by category; 
-- having clause / filter data yang sudah di grouping
-- contoh satu
select category,
	count(id) as total
from products group by category having count(id) > 3;
-- contoh dua 
select category, 
	avg(price) as "rata-rata harga", 
	min (price) as "Harga terendah",
	max(price) as "Harga termahal"
from products group by category having avg(price) >= 20000; 


-- constraint (3:09:16)
-- untuk menjaga data di tabel tetap baik
-- Unique constraint (constraint yang memastikan bahwa data kita tetap unique)
create table customer(
	id serial not null,
	email varchar(100) not null,
	first_name varchar(100) not null,
	last_name varchar(100) not null,
	primary key (id),
	constraint unique_email unique(email)
);
select * from customer;

insert into customer(email, first_name, last_name)
values ('yusufsmd58@gmail.com', 'Muhammad', 'Yusuf');

insert into customer(email, first_name, last_name)
values ('eko@pzn.com', 'Eko', 'Khannedy');

insert into customer(email, first_name, last_name)
values ('budi@pzn.com', 'Budi', 'Nugraha');

insert into customer(email, first_name, last_name)
values ('joko@pzn.com', 'joko', 'Morro'),
		('rully@pzn.com', 'Ruly', 'Irwansyah');
-- menambahkan constraint pada tabel yang sudah ada
alter table customer drop constraint unique_email;
alter table customer add constraint unique_email unique(email);


-- check constraint (constraint yang digunakan untuk menambahkan kondisi cek)
alter table products 
	add constraint price_check check (price > 1000);

alter table products
	add constraint quantity_check check (quantity > 0);

insert into products(id, name, price, quantity, category )
values ('XXX1', 'Contoh gagal', 10000, -10, 'minuman' );

select * from products;


-- Index (3:20:47) 
-- index adalah teknik menambbahkan index pada kolom data agar memudahkan pencarian (Btree)
-- bisa membuat lebih dari satu index pada tiap table
-- kekuranngan : index mempercepat pencarian query tapi memperlambat proses insert, update, delete
-- karena setiap kali kita melakukan perubahan data data query maka akan terjadi proses updata index
-- tidak perlu menambahkan index pada primary key atau unique contraint karena sudah ada indexnya 
create table sellers(
	id serial not null,
	name varchar(100) not null,
	email varchar(100) not null,
	primary key(id),
	constraint email_unique unique(email)
);

insert into sellers(name, email)
values ('galeri olahraga', 'galeri@pzn.com'),
		('galeri Tono', 'tono@pzn.com'),
		('galeri Budi', 'budi@pzn.com'),
		('galeri Arvin', 'arvin@pzn.com'),
		('galeri Rully', 'rully@pzn.com');
select * from sellers;

-- satu index bisa dipakai untuk beberapa kolom 
-- index(col1, col2, col3) artinya kita digunakan (col1), (col1, col2), dan (col1,col2,col3)
create index sellers_id_and_name_index on sellers(id,name);
select * from sellers where id =1;
select * from sellers where id=1 or name ='galeri Tono';

create index sellers_email_and_name_index on sellers(email, name);
select * from sellers where email = 'rully@pzn.com';
select * from sellers where email = 'rully@pzn.com' or name ='galeri Tono';

create index sellers_name_index on sellers(name);
select * from sellers where name = 'galeri Tono';


-- full-text search (3:36:03)
-- LIKE lamban karena mencari seluruh data di tabel dari baris pertama sampai akhir, tidak pakai index
-- full-text bisa digunakan untuk mencari sebagian kata di kolom dengan tipe data string
-- tidak flexible karena hanya mencari perkata tidak seperti like yang bisa mencari sepersukukata

-- full search / tidak menggunakan index
select * from products where name ilike '%mie%';
select * from products where to_tsvector(name) @@ to_tsquery('mie');

-- full-text search index
-- buat index sama seperti index biasa tapi detail dengan jenis index full-text searchnya
-- lihat bahasa
select cfgname from pg_ts_config;
--buat index
create index products_name_search on products using gin(to_tsvector('indonesian', name));
create index products_description_search on products using gin(to_tsvector('indonesian', description));
-- saat pakai tidak usah emnggunaka to_tsvector tapi langsung to_tsquery
select * from products where name @@ to_tsquery('mie');
select * from products where description  @@ to_tsquery('mie');

-- query operator di full-text search
-- to_tsquery mendukung operator : &/AND, |/or, !/NOT, ""/semua data
select * from products where name @@ to_tsquery('mie & baso'); -- and
select * from products where name @@ to_tsquery('mie | baso'); -- or
select * from products where name @@ to_tsquery('!baso'); -- not
select * from products where name @@ to_tsquery('''mie ayam'''); -- '' '' mencari detail/tepat satu kalimat
-- tipe data TSVECTOR
-- tipe data yang otomatis kolom tersebut berisi index full-text search


-- table relationship (3:49:16)
create table wishlist(
	id serial not null,
	id_product varchar(10) not null,
	description text,
	primary key(id),
	constraint fk_wishlist_product foreign key (id_product) references products (id)
);

insert into wishlist(id_product, description) 
values ('P0001', 'Mie ayam kesukaan'),
		('P0002', 'Mie ayam kesukaan'),
		('P0005', 'Mie ayam kesukaan');
select * from wishlist;
-- data di table references tidak dapat dihapus apabila sudah digunakan di tabel foreignkey
delete from products where id = 'P0005';
-- ketika menhapus data berelasi postgress akan menolak
-- fitur ini dapat dihapus dengan cara 
-- RESTRICT/ditolak, CASCADE/dihapus, NO ACTION/dibiarkan, SET NULL/diubah jadi null, set default/ubah jadi default value
-- saran pak Eko restrict

alter table wishlist 
drop constraint fk_wishlist_product;

alter table wishlist 
add constraint fk_wishlist_product foreign key(id_product) references products(id)
on delete cascade on update cascade;

insert into products(id, name, price, quantity, category)
values ('xxx', 'xxx', 10000, 100, 'minuman');

insert into wishlist(id_product, description)
values ('xxx','contoh');
select * from wishlist;
delete from products where id = 'xxx';



-- Join (4:02:48)
-- di postgres untuk melakukan join bisa tanpa foriegnKey tapi alangkah baiknya berelasi
-- semakin banyak join proses query semakin berat
-- idealnya jangan join lebih dari 5 tabel
select * from wishlist join products on products.id = wishlist.id_product;

select products.id, products.name, wishlist.description
from wishlist join products on products.id = wishlist.id_product;

select p.id, p.name, w.description
from wishlist as w join products as p on p.id = w.id_product;


-- join multiple table 4:07:26
alter table wishlist add column id_customer int;
select * from wishlist;

alter table wishlist add constraint fk_wishlist_customer foreign key (id_customer) references customer(id);

update wishlist set id_customer =  1 where id in (1);
update wishlist set id_customer =  1 where id in (2);
update wishlist set id_customer =  4 where id in (3);
select * from customer;

select p.id, c.email, p.name, w.description
from wishlist as w 
	join products as p on w.id_product = p.id 
	join customer as c on c.id = w.id_customer;


-- one to one relationship (4:11:55)
create table wallet (
	id serial not null,
	id_customer int not null,
	balance int not null default 0,
	primary key (id),
	constraint wallet_customer_unique unique (id_customer),
	constraint fk_wallet_customer foreign key (id_customer) references customer(id)
);

select * from customer;

insert into wallet (id_customer, balance)
values (1, 1000000),
		(2, 2000000),
		(4, 3000000),
		(5, 4000000);

select * from wallet;

select * from customer join wallet on wallet.id_customer = customer.id;


-- One to many relationship
create table categories(
	id varchar(10) not null,
	name varchar(100) not null,
	primary key (id)
);

insert into categories(id, name)
values ('C0001', 'Makanan'),
		('C0002', 'Minuman');

select * from categories;

alter table products 
 drop column category;

alter table products 
add column id_category varchar(10);

alter table products
add constraint fk_product_category foreign key(id_category) references categories(id);

select *from products;

update products
set id_category = 'C0001'
where name  ilike '%mie%';

update products
set id_category = 'C0002'
where id = 'P0008';

update products
set id_category = 'C0002'
where name  ilike '%es%';

select * from products join categories on products.id_category = categories.id;

-- many to many relationship  (4:25:52)
-- Solusi adalah : membuat table relasi diantara 2 table many to many
create table orders(
	id serial not null,
	total int not null,
	order_date timestamp not null default current_timestamp,
	primary key(id)
);

create table orders_detail(
	id_product varchar(10) not null,
	id_order int not null,
	price int not null,
	quantity int not null,
	primary key(id_product, id_order)
);

alter table orders_detail 
add constraint fk_order_detail _product foreign key (id_product) references products(id);

alter table orders_detail 
add constraint fk_order_detail_order foreign key (id_order) references orders(id);

insert into orders(total)
values (1),
		(1),
		(1);

select * from orders;

select * from products order by id;
-- order pertama 
insert into orders_detail (id_product, id_order, price , quantity)
values ('P0001', 1, 1000, 2),
		('P0002', 1, 1000, 2),
		('P0003', 1, 1000, 2);
-- order kedua 
insert into orders_detail (id_product, id_order, price , quantity)
values ('P0004', 2, 1000, 2),
		('P0006', 2, 1000, 2),
		('P0007', 2, 1000, 2);
-- order ketiga
insert into orders_detail (id_product, id_order, price , quantity)
values ('P0001', 3, 1000, 2),
		('P0004', 3, 1000, 2),
		('P0005', 3, 1000, 2);
select * from orders_detail;
-- melihat data order, detail dan product-nya
select * from orders 
join orders_detail on orders_detail.id_order = orders.id
join products on orders_detail.id_product = products.id;
-- pake where clause
select * from orders 
join orders_detail on orders_detail.id_order = orders.id
join products on orders_detail.id_product = products.id
where orders.id = 3;


-- Jenis jenis join (4:40:56)
-- INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN
-- INNER JOIN (default join)
insert into categories (id, name)
values ('C0003', 'Gadget'),
		('C0004', 'Laptop'),
		('C0005', 'Pulsa');
select * from categories;
select * from products;
insert into products (id, name, price, quantity)
	values('X0001', 'Contoh 1', 10000, 100),
			('X0002', 'Contoh 2', 10000, 100);
-- jika inner join product yang tidak memiliki kategori ataupun kategori 
-- yang tidak digunakan tidak akan muncul, tes categories INNER JOIN products:
select * from categories
inner join products on products.id_category = categories.id;

-- LEFT JOIN 
-- left join adalah join yang seperti inner join, tapi semua data ditable pertama 
-- akan diambil, ditable kedua hanya yang berelasi yang diambil datanya 
select * from categories
left join products on products.id_category = categories.id;

-- RIGHT JOIN 
-- right join adalah join seperti inner join, semua data ditable kedua akan diambil,
-- tapi ditable pertama hanya akan menampilkan data yag berelasinya saja. (kebalikan left join)
select * from categories
right join products on products.id_category = categories.id;

-- FULL JOIN 
-- FULL JOIN adalah join yang semua data di tabelnya pertama dan kedua diambil/ditampilkan
-- jika tidak ada relasi maka hasilnya null.
select * from categories
full join products on products.id_category = categories.id;



-- subqueries (4:50:06)
-- subqueries adalah quey yang ada didalam query yang lain, bisa digunakan 
-- untuk pencarian where dari hasil select query ataupun aggregate function.
-- subquery di where
select avg(price) from products;  -- aggregate function
select * from products where price > (select avg(price) from products);
-- subquery di from
select * from products;
-- contoh
select max(price) from (select products.price as price
from categories join products on products.id_category = categories.id) as contoh;




-- set operator (4:54:49)
-- operator set, dimana ini adalah operasi antara hasil dari dua SELECT query. 
-- jenis operator set : UNION, UNION ALL, INTERSECT, EXCEPT

create table guestbooks(
	id serial not null,
	email varchar(100) not null,
	title varchar(100) not null,
	content text,
	primary key (id)
);
select * from customer;
insert into guestbooks(email, title, content)
values ('eko@pzn.com', 'feedback eko', 'ini feedback eko'),
		('eko@pzn.com', 'feedback eko', 'ini feedback eko'),
		('budi@pzn.com', 'feedback budi', 'ini feedback budi'),
		('rully@pzn.com', 'feedback rully', 'ini feedback rully'),
		('tono@pzn.com', 'feedback tono', 'ini feedback tono'),
		('tono@pzn.com', 'feedback tono', 'ini feedback tono');
select * from guestbooks;

-- set operator, UNION
-- union adalah operasi menggabungkan dua buah select query, dimana jika terdapat
-- data yang duplikat, data duplikasinya akan dihapus dari hasil query. contoh:
select distinct email from customer
union
select distinct email from guestbooks;

-- set operator, UNION ALL
-- union all adalah operasi union, tapi data hasil duplikat tetap akan ditampilkan 
-- di hasil querynya. contoh :
select distinct email from customer
union all
select distinct email from guestbooks;
-- subquery union 
select email, count(email)
from (select email from customer
		union all
		select email from guestbooks) as contoh 
group by email;

-- set operator, INTERSECT 
-- intersect adalah operasi menggabungkan dua query, tapi yang diambil/ditampilkan -
-- hanya yang datanya ada dihasil query pertama dan kedua, 
-- dan datanya muncul tidak dalam keadaan duplikat. contoh;
select distinct email from customer
intersect
select distinct email from guestbooks;

-- set operator, except 
-- except adalah operasi dua query dimana, jika data itu sama pada query pertama 
-- dan query kedua maka data tidak akan ditampilkan.contoh:
select distinct email from customer
except
select distinct email from guestbooks;


-- Transaction (5:05:28)
-- transaction adalah cara atau mekanisme membungkus beberapa perintah sekaligus 
-- menjadi satu operasi, hal ini bertujuan agar data tetap konsisten. 
-- Kenapa bisa konsisten? karena semua perintah yang ada dalam transaction harus berhasil
-- semuanya atau gagal semuanya. contoh kasus aplikasi belanja online ketika customer 
-- menekan tombol pesan maka yt terjadi:
-- insert data tabel order pesanan, insert data detail order pesanan,  
-- menurunkan quntity di table product dll.
-- Jika terjadi kesalahan/pembatalan disalah satu perintah harapannya perintah sebelumnya
-- dibatalkan, agar data tetap konsisten.

-- 3 perintah utama transaction di postgreSQL
-- START TRANSACTION, COMMIT, ROLLBACK
-- Fitur transaction ini tidak bisa berpengaruh pada perintah DDL (Data Definition Language)
-- seperti perintah merubah struktur, membuat tabel, menambahkan kolom, hapus tabel, hapus DB
-- Transaction hanya bisa digunakan pada perintah DML (Data Manipulation Language)
-- seperti operasi Insert, Update, Delete

-- contoh commit
start transaction ;

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 2');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 3');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 4');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'transaction 5');

select * from guestbooks;

commit;

-- contoh roleback
start transaction ;

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'roleback');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'roleback 2');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'roleback 3');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'roleback 4');

insert into guestbooks(email, title, content)
values ('transaction@pzn.com', 'transaction', 'roleback 5');

select * from guestbooks;

rollback;



-- Locking (5:16:24)
-- adalah proses mengunci data di DBMS
-- pada saat menggunakan fitur Transaction, saat belum di commit atau di rollback
-- datanya itu akan secara otomatis dilock.

-- locking data otomatis menggunakan fitur TRANSACTION
select * from products;
start transaction;
update products 
set description = 'mie ayam original enak'
where id = 'P0001';
-- update qty P0001 di PSQL
commit;

-- locking record manual 
-- menggunakan perintah FOR UPDATE dibelakang querynya

start transaction;
select * from products where id = 'P0001' for update;

rollback;

select * from products where id = 'P0001';

-- Deadlock
-- Dealock adalah situasi ada 2 proses yang saling menunggu satu sama lain,
-- namu data yang ditunggu dua-duanya di lock oleh proses yang lainnya, 
-- sehingga proses menunggunya ini tidak akan pernah selesai.
start transaction;
select * from products where id = 'P0001' for update;
select * from products where id = 'P0002' for update;

rollback;




-- Schema (5:30:42)
-- di POSTGRESQL terdapat fitur schema, secara default saat membuat  table
-- sebenarnya kita membuat dan menyimpan data table kita di dalam schema public 
-- seperti kita menyimpan file-file didalam sebuah folder. Di Postgresql kita bisa membuat
-- schema sendiri.

--melihat current schema  
select current_schema();
-- membuat dan emnghapus schema
create schema contoh;
create schema contoh1;
-- hati-hati bisa menghapus seluruh schema 
drop schema contoh;
drop schema contoh1;
-- pindah schema dari public ke contoh
set search_path to contoh;
show search_path;

-- membuat table di schema 
-- current scheme di contoh, ingin melihat table produk di schema public:
select * from public.products;

create table contoh.products(
	id serial not null,
	name varchar(100) not null,
	primary key(id)
);
select * from products;

set search_path to public;
-- insert ke products yang ada di schema contoh
insert into contoh.products(name)
values ('iphone'),
		('Play station');

select * from contoh.products;




-- user management (5:41:30)
-- default user utama sebagai super administrator 
-- sebaiknya saat menjalankan postgresSQL dengan aplikasi yang 
-- dibuat, tidak disarankan tidak menggunakan user utama.
-- lebih baik buat user khusus untuk tiap aplikasi dan dibatasi
-- hak aksesnya untuk tiap user tersebut.
-- bikin role
create role yusuf;
create role anisa;
-- hapus role 
drop role yusuf;
drop role anisa;
-- rubah role 
alter role yusuf login password 'rahasia';
alter role anisa login password 'rahasia';

-- hak akses grant 
grant insert, update, select on all tables in schema public to yusuf;
grant usage, select, update on guestbooks_id_seq to yusuf;
grant insert, update, select on customer to anisa;


 
-- Backup databse 
-- Pro tips ; ada baiknya kita selalu melakukan backup data secara reguler
-- untuk backuo database tidak menggunakan perintah SQL, melainkan postgeSQL
-- namanya adalah pg_dump
-- posgresql/pg_dump
-- pg_dump --host=localhost --port=5432 --dbname=belajar --usernaem=m16yusuf --format=plain --file=Users/m16yusuf/backup.sql



-- Restore backup (5:59:21)
create database belajar_restore;
-- restore backup sebelumnya ke db belajar_restore 
-- psql --host=localhost --port=5432 --dbname=belajar_restore --username=m16yusuf --file=Users/m16yusuf/backup.sql



-- Postgresql dah tamat
-- materi selanjutnya:
-- postgresql ACID 
-- postgresql table partitioning 
-- studi kasus database desing psql
-- belajar bahasa pemograman




