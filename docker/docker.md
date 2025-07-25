
# DOCKER 🐋

![docker](https://img.shields.io/badge/Docker-2CA5E0?style=for-the-badge&logo=docker&logoColor=white)

| Materi            |    Link youtube    |        slide        |
| ----------------- | ------------------ | ------------------- |
| [Docker dasar ](#1-docker-dasar) | [yt Docker dasar](https://youtu.be/3_yxVjV88Zk?si=gRNTgPAG723_Ncxu) | [slide docker dasar](https://docs.google.com/presentation/d/1LoCIoqR68t-y7P7eOs_TVoooZy4mq-tc2cwInQAtfy0/edit?slide=id.gcfdc6d4495_0_377#slide=id.gcfdc6d4495_0_377) |
| [Docker Dockerfile](#2-docker-dockerfile)  | [yt docker dockerfile](https://youtu.be/sazoz5mnLLo?si=CkXQXm-7rVDOYe1m) |  [slide docker dockerfile](https://docs.google.com/presentation/d/1bW0-88g_s54-X_rBLaZ-N2EhW3HngAZSN6UInyBlIn8/edit?usp=sharing)  |
| [Docker Compose](#3-docker-composer) | [yt docker compose](https://youtu.be/Vw0CAlzKe5I?si=vhfnVyYMo3V7Y2Sa)  |  [slide docker compose](https://docs.google.com/presentation/d/1xBHSvVuOA4boC5OBlzIl5VACpahpUzZ9cKhbXqLQKdE/edit?usp=sharing)  |


<h2 id="1-docker-dasar"> DOCKER DASAR </h2>

<!-- Materi pengenalan container -->
#### Pengenalan Container
<details>
<summary> 00:03:27  Pengenalan Container </summary>

Container Vs Virtual Machine (VM)

* Berbeda dengan VM, Container sendiri berfokus pada sisi Aplikasi.
* Container sendiri sebenarnya berjalan diatas aplikasi Container Manager yang berjalan di sistem operasi.
* Yang membedakan dengan VM adalah, pada Container, kita bisa mem-package aplikasi dan dependency-nya tanpa harus menggabungkan sistem operasi.
* Container akan menggunakan sistem operasi host dimana Container Manager nya berjalan, oleh karena itu, Container akan lebih hemat resource dan lebih cepat jalan nya, karena tidak butuh sistem operasi sendiri.
* Ukuran Container biasanya hanya hitungan MB, berbeda dengan VM yang bisa sampai GB karena di dalamnya ada sistem operasinya.
</details>




<!-- Materi pengenalan docker  -->
#### Pengenalan Docker

<details>
<summary>00:12:38 - Pengenalan Docker </summary>

Docker adalah salah satu implementasi Container Manager yang saat ini paling populer. Docker merupakan teknologi yang masih baru, karena baru diperkenalkan sekitar tahun 2013. Docker adalah aplikasi yang free dan Open Source, sehingga bisa kita gunakan secara bebas. https://www.docker.com/
</details>





<!-- Arsitektur docker -->
#### Arsitektur Docker
<details>
<summary> 00:14:46 - Arsitektur Docker </summary>

Docker menggunakan arsitektur Client-Server. Docker client berkomunikasi dengan Docker daemon (server). Saat kita menginstall Docker, biasanya didalamnya sudah terdapat Docker Client dan Docker Daemon. Docker Client dan Docker Daemon bisa berjalan di satu sistem yang sama. Docker Client dan Docker Daemon berkomunikasi menggunakan REST API. 

<img src="./img/arsitekrur_docker.png" style="width:500px">
</details>



<!-- Menginstall docker -->
<!-- Docker resigtry -->
#### Docker Registry

<details>
<summary>00:26:27 - Docker Registry</summary>

Docker Registry adalah tempat kita menyimpan Docker Image. Dengan menggunakan Docker Registry, kita bisa menyimpan Image yang kita buat, dan bisa digunakan di Docker Daemon dimanapun selama bisa terkoneksi ke Docker Registry.

Contoh- contoh Docker Registry:

* [Docker Hub](https://hub.docker.com/) (free)
* [Digital Ocean Container Registry](https://www.digitalocean.com/products/container-registry/)
* [Google Cloud Container Registry ](https://cloud.google.com/container-registry )
* [Amazon Elastic Container Registry ](https://aws.amazon.com/id/ecr/)
* [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/)
</details>




<!-- Docker Image -->
#### Docker Image

<details>
<summary> 00:31:18 - Docker Image </summary>

Docker Image mirip seperti installer aplikasi, dimana di dalam Docker Image terdapat aplikasi dan dependency. Sebelum kita bisa menjalankan aplikasi di Docker, kita perlu memastikan memiliki Docker Image aplikasi tersebut. 

```sh
# Melihat list Image Docker 
docker image ls

# mendownload image docker dari hub.docker.com
docker image pull redis:latest

# hapus docker image yang sudah didownload
docker image rm redis:latest
```
</details>




<!-- Docker Container  -->
#### Docker Container

<details>
<summary> 00:40:45 - Docker Container </summary>

Jika Docker Image seperti installer aplikasi, maka Docker Container mirip seperti aplikasi hasil installernya. Satu Docker Image bisa digunakan untuk membuat beberapa Docker Container, asalkan nama Docker Container nya berbeda. 

Jika kita sudah membuat Docker Container, maka Docker Image yang digunakan tidak bisa dihapus, hal ini dikarenakan sebenarnya Docker Container tidak meng-copy isi Docker Image, tapi hanya menggunakannya isinya saja.


##### melihat Docker container
Melihat semua container didalam docker daemon/docker server bisa menggunakan perintah:

```sh
# melihat list container
docker container ls -a

# melihat yang sedang berjalan
docker container ls 
```

##### Membuat Docker Container

> ⚠️Tidak bisa membuat dua container dengan nama yang sama 

```sh
# membuat container baru dengan nama contohredis
docker container create --name contohredis redis:latest
```

##### Menjalankan & menghentikan docker container

```sh
# memulai container bisa dipanggil containerIDnya atau namanya
docker container start containerID/namaContainer
# contoh
docker container start contohredis

# menghentikan docker container
docker container stop containerID/namaContainer
# contoh
docker container stop contohredis
docker container stop contohredis2
```

##### Menghapus docker container

> ⚠️ tidak bisa menghapus docker container yang sedang berjalan, harus distop

```sh
# perintah hapus docker container
docker container rm contohredis
docker container rm contohredis2
```
</details>




<!-- Materi container log -->
#### Container Logs

<details>
<summary> 00:56:57 - Container Logs</summary>

Kadang saat terjadi masalah dengan aplikasi yang terdapat di container, sering kali kita ingin melihat detail dari log aplikasinya. Hal ini dilakukan untuk melihat detail kejadian apa yang terjadi di aplikasi, sehingga akan memudahkan kita ketika mendapat masalah. 

Untuk melihat log aplikasi di container kita, kita bisa menggunakan perintah :
```sh
docker container logs containerId/namacontainer
```
Atau jika ingin melihat log secara realtime, kita bisa gunakan perintah :
```sh
docker container logs -f containerId/namacontainer
```
</details>





<!-- Materi container exec -->
#### Container Exec
<details>
<summary> 01:01:28 - Container Exec </summary>

Saat kita membuat container, aplikasi yang terdapat di dalam container hanya bisa diakses dari dalam container. Oleh karena itu, kadang kita perlu masuk ke dalam container nya itu sendiri. Untuk masuk ke dalam container, kita bisa menggunakan fitur **Container Exec**, dimana digunakan untuk mengeksekusi kode program yang terdapat di dalam container.

Untuk masuk ke dalam container, kita bisa mencoba mengeksekusi program bash script yang terdapat di dalam container dengan bantuan Container Exec :
```sh
docker container exec -i -t containerId/namacontainer /bin/bash
```
* -i adalah argument interaktif, menjaga input tetap aktif
* -t adalah argument untuk alokasi pseudo-TTY (terminal akses)
Dan /bin/bash contoh kode program yang terdapat di dalam container

catatan:
```sh
# masuk container 
docker container exec -i -t contohredis /bin/bash
# exit 
exit
```
</details>






<!-- Materi container port -->
#### Container Port
<details>
<summary>01:07:17 - Container Port  </summary>

Saat menjalankan container, container tersebut terisolasi di dalam Docker. Artinya sistem Host (misal Laptop kita), tidak bisa mengakses aplikasi yang ada di dalam container secara langsung, salah satu caranya adalah harus menggunakan Container Exec untuk masuk ke dalam container nya.

Biasanya, sebuah aplikasi berjalan pada port tertentu, misal saat kita menjalankan aplikasi Redis, dia berjalan pada port 6379, kita bisa melihat port apa yang digunakan ketika melihat semua daftar container.

##### Port forwading

Docker memiliki kemampuan untuk melakukan port forwarding, yaitu meneruskan sebuah port yang terdapat di sistem Host nya ke dalam Docker Container. Cara ini cocok jika kita ingin mengekspos port yang terdapat di container ke luar melalui sistem Host nya.


Untuk melakukan port forwarding, kita bisa menggunakan perintah berikut ketika membuat container nya :

```sh
docker container create --name namacontainer --publish posthost:portcontainer image:tag

# contoh
# download image nginx 
docker image pull nginx:latest
# buat container baru dengan image nginx
docker container create --name contohnginx --publish 8080:80 nginx:latest
# saat contohnginx dijalankan, nginx bisa diakses dilocalhost hostnya, 
# di port 8080 (localhost:8080 dibrowser)
```

Jika kita ingin melakukan port forwarding lebih dari satu, kita bisa tambahkan dua kali parameter ``--publish`` (juga bisa disingkat menggunakan -p). 
</details>





<!-- Materi container environment variable -->
#### Container Environment Variable

<details>
<summary> 01:17:02 - Container Environment Variable</summary>

Saat membuat aplikasi, menggunakan Environment Variable adalah salah satu teknik agar konfigurasi aplikasi bisa diubah secara dinamis. Dengan menggunakan environment variable, kita bisa mengubah-ubah konfigurasi aplikasi, tanpa harus mengubah kode aplikasinya lagi. 

Docker Container memiliki parameter yang bisa kita gunakan untuk mengirim environment variable ke aplikasi yang terdapat di dalam container.

Untuk menambah environment variable, kita bisa menggunakan perintah --env atau -e, misal :

```sh
docker container create --name namacontainer --env KEY=”value” --env KEY2=”value” image:tag

# contoh menerapkan pada image mongodb, dengan username dan passswordnya sebagai env 
# unduh mongo image latest dulu 
docker image pull mongo:latest
docker container create --name contohmongo --publish 27017:27017 --env MONGO_INITDB_ROOT_USERNAME=yusuf --env MONGO_INITDB_ROOT_PASSWORD=yusuf mongo:latest
```
</details>


 


<!-- Materi container stats -->
#### Container Stats
<details>
<summary>01:26:20 - Container Stats </summary>

Saat menjalankan beberapa container, di sistem Host, penggunaan resource seperti CPU dan Memory hanya terlihat digunakan oleh Docker saja. Kadang kita ingin melihat detail dari penggunaan resource untuk tiap container nya.

Untungnya docker memiliki kemampuan untuk melihat penggunaan resource dari tiap container yang sedang berjalan
Kita bisa gunakan perintah :

```sh
docker container stats
```
</details>





<!-- Materi container resource limit -->
#### Container Resouce limit

<details>
<summary> 01:30:37 - Container Resource Limit </summary>

Saat membuat container, secara default dia akan menggunakan semua CPU dan Memory yang diberikan ke Docker (Mac dan Windows), dan akan menggunakan semua CPU dan Memory yang tersedia di sistem Host (Linux). Jika terjadi kesalahan, misal container terlalu banyak memakan CPU dan Memory, maka bisa berdampak terhadap performa container lain, atau bahkan ke sistem host

Oleh karena itu, ada baiknya ketika kita membuat container, kita memberikan resource limit terhadap container nya.

Memory 

* Saat membuat container, kita bisa menentukan jumlah memory yang bisa digunakan oleh container ini, dengan menggunakan perintah ``--memory`` diikuti dengan angka memory yang diperbolehkan untuk digunakan.
* Kita bisa menambahkan ukuran dalam bentu b (bytes), k (kilo bytes), m (mega bytes), atau g (giga bytes), misal 100m artinya 100 mega bytes.

CPU

* Selain mengatur Memory, kita juga bisa menentukan berapa jumlah CPU yang bisa digunakan oleh container dengan parameter ``--cpus``.
* Jika misal kita set dengan nilai 1.5, artinya container bisa menggunakan satu dan setengah CPU core. 

```sh
# contoh resource limit
docker container create --name smallnginx --memory 100m --cpus 0.5 --publish 8081:80 nginx:latest
```
</details>





<!-- Materi bind mounts -->
#### Bind Mounts

<details>
<summary> 01:38:10 - Bind Mounts </summary>

Bind Mounts merupakan kemampuan melakukan mounting (sharing) file atau folder yang terdapat di sistem host ke container yang terdapat di docker. <mark> Fitur ini sangat berguna ketika misal kita ingin mengirim konfigurasi dari luar container, atau misal menyimpan data yang dibuat di aplikasi di dalam container ke dalam folder di sistem host </mark>. Jika file atau folder tidak ada di sistem host, secara otomatis akan dibuatkan oleh Docker.

Untuk melakukan mounting, kita bisa menggunakan parameter ``--mount`` ketika membuat container. Isi dari parameter ``--mount`` memiliki aturan tersendiri.

##### Parameter Mount 

| Parameter | Keterangan |
| --------- | ---------- |
| tyep      | Tipe mount, bind atau volume |
| source    | Lokasi file atau folder di sistem host |
| destination | Lokasi file atau folder di container |
| readonly | Jika ada, maka file atau folder hanya bisa dibaca di container, tidak bisa ditulis | 

Untuk melakukan mounting, kita bisa menggunakan perintah berikut :
```sh
docker container create --name namacontainer --mount “type=bind,source=folder,destination=folder,readonly” image:tag
# source = folder host 
# destination = folder yang ada didalam container 
# readonly = hanya bisa dibaca doang tidak bisa dirubah

# contoh
docker container create --name mongodata --publish 27018:27017 --mount "type=bind,source=D:\projek\personal-learning-notes\docker\mongo-data,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=yusuf --env MONGO_INITDB_ROOT_PASSWORD=yusuf mongo:latest
```
</details>





<!-- Docker volume -->
#### Docker Volume
<details>
<summary> 01:50:51 - Docker Volume </summary>

Fitur Bind Mounts sudah ada sejak Docker versi awal, di versi terbaru direkomendasikan menggunakan **Docker Volume**. Docker Volume mirip dengan Bind Mounts, bedanya adalah terdapat management Volume, dimana kita bisa membuat Volume, melihat daftar Volume, dan menghapus Volume.

Volume sendiri bisa dianggap storage yang digunakan untuk menyimpan data, bedanya dengan Bind Mounts, <mark> pada bind mounts, data disimpan pada sistem host, sedangkan pada volume, data di manage oleh Docker </mark>.

Saat kita membuat container, dimanakah data di dalam container itu disimpan, secara default semua data container disimpan di dalam volume

Kita bisa gunakan perintah berikut untuk melihat daftar volume :
```sh
docker volume ls
```

Untuk membuat volume, kita bisa gunakan perintah :
```sh
docker volume create namavolume
# contoh
docker volume create mongovolume
```

##### Menghapus Volume

Volume yang tidak digunakan oleh container bisa kita hapus, tapi jika volume digunakan oleh container, maka tidak bisa kita hapus sampai container nya di hapus.

Untuk menghapus volume, kita bisa gunakan perintah :
```sh
docker volume rm namavolume
```
</details>





<!-- Container volume -->
#### Container Volume

<details>
<summary> 01:57:11 - Container Volume </summary>

Volume yang sudah kita buat, bisa kita gunakan di container. <mark> Keuntungan menggunakan volume adalah, jika container kita hapus, data akan tetap aman di volume </mark>.

Cara menggunakan volume di container sama dengan menggunakan bind mount, kita bisa menggunakan parameter ``--mount``, namun dengan menggunakan type volume dan source nama volume.

```sh
# membuat volume
docker volume create mongodata

# buat container baru dengan volume sebagai tempat simpada datanya
docker container create --name mongovolume --publish 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=yusuf --env MONGO_INITDB_ROOT_PASSWORD=yusuf mongo:latest

# type = volume
# source = nama volume yang sudah dibuat yaitu mongodata
```
</details>





<!-- Materi backup volume -->
#### Backup Volume
<details>
<summary> 02:03:24 - Backup Volume </summary>

Sayangnya, sampai saat ini, tidak ada cara otomatis melakukan backup volume yang sudah kita buat. Namun kita bisa memanfaatkan container untuk melakukan backup data yang ada di dalam volume ke dalam archive seperti zip atau tar.gz

Tahapan backup volume 

* Matikan container yang menggunakan volume yang ingin kita backup
* Buat container baru dengan dua mount, volume yang ingin kita backup, dan bind mount folder dari sistem host
* Lakukan backup menggunakan container dengan cara meng-archive isi volume, dan simpan di bind mount folder
* Isi file backup sekarang ada di folder sistem host
Delete container yang kita gunakan untuk melakukan backup

##### Backup manual 

```sh
# Matikan container yang akan dibackup
docker container stop mongovolume

# buat container baru dengan dua mount,  bind mount folder dari sistem host dan volume yang ingin dibackup
docker container create --name nginxbackup --mount "type=bind,source=D:\projek\personal-learning-notes\docker\backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" nginx:latest

#jalankan container 
docker container start nginxbackup

# masuk kedalam container nginxbackup, dan eksekusi bashnya
docker container exec -i -t nginxbackup /bin/bash

# Menggunakan aplikasi seperti tar untuk diarchive
#  tar cvf /lokasi_simpan.tar.gz /dir_yg_dibackup 
tar cvf /backup/backup.tar.gz /data
# hasil backup berapada di:
# D:\projek\personal-learning-notes\docker\backup

# keluar container nginxbackup
exit 

# stop container nginxbackup
docker container stop nginxbackup

# remove container nginxbacup
docker container rm nginxbackup

# Hidupkan ulang container mongovolume yang dimatikan saat step 1
docker container start mongovolume
```

##### Backup Dengan Container Run

Melakukan backup secara manual agak sedikit ribet karena kita harus start container terlebih dahulu, setelah backup, hapus container nya lagi. Kita bisa menggunakan perintah run untuk menjalankan perintah di container dan gunakan parameter ``--rm`` untuk melakukan otomatis remove container setelah perintahnya selesai berjalan. 

```sh
# jangan lupa matikan container yang akan dibackup
docker container stop mongovolume

# backup dengan run image:ubuntu, dengan lokasi tempat backup sama dengan cara backup manual
docker container run --rm --name ubuntubackup --mount "type=bind,source=D:\projek\personal-learning-notes\docker\backup,destination=/backup" --mount "type=volume,source=mongodata,destination=/data" ubuntu:latest tar cvf /backup/backup-lagi.tar.gz /data

# Hidupkan ulang container mongovolume yang dimatikan saat step 1
docker container start mongovolume
```
</details>





 <!-- Materi restore volume -->
#### Restore Volume

 <details>
<summary> 02:21:25 - Restore Volume </summary>

Setelah melakukan backup volume ke dalam file archive, kita bisa menyimpan file archive backup tersebut ke tempat yang lebih aman, misal ke cloud storage. Sekarang kita akan coba melakukan restore data backup ke volume baru, untuk memastikan data backup yang kita lakukan tidak corrupt.

Tahap melakukan Restore backup volume

* Buat volume baru untuk lokasi restore data backup
* Buat container baru dengan dua mount, volume baru untuk restore backup, dan bind mount folder dari sistem host yang berisi file backup
* Lakukan restore menggunakan container dengan cara meng-extract isi backup file ke dalam volume
* Isi file backup sekarang sudah di restore ke volume
* Delete container yang kita gunakan untuk melakukan restore
* Volume baru yang berisi data backup siap digunakan oleh container baru

```sh
# buat volume baru, lokasi restore nanti
docker volume create mongorestore

# buat container baru untuk proses restore 
docker container run --rm --name ubunturestore --mount "type=bind,source=D:\projek\personal-learning-notes\docker\backup,destination=/backup" --mount "type=volume,source=mongorestore,destination=/data" ubuntu:latest bash -c "cd /data && tar xvf /backup/backup.tar.gz --strip 1"

#cek hasil backup 
# buat container baru 
docker container create --name mongorestore --publish 27020:27017 --mount "type=volume,source=mongorestore,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=yusuf --env MONGO_INITDB_ROOT_PASSWORD=yusuf mongo:latest
# jalankan
docker container start mongorestore
# cek mongo yang dibackup (ada)
```
</details>





<!-- Materi docker network -->
#### Docker network

<details>
<summary> 02:30:34 - Docker Network </summary>

Saat kita membuat container di docker, secara default container akan saling terisolasi satu sama lain, jadi jika kita mencoba memanggil antar container, bisa dipastikan bahwa kita tidak akan bisa melakukannya.

Docker memiliki fitur Network yang bisa digunakan untuk membuat jaringan di dalam Docker. <mark> Dengan menggunakan Network, kita bisa mengkoneksikan container dengan container lain dalam satu Network yang sama </mark>. Jika beberapa container terdapat pada satu Network yang sama, maka secara otomatis container tersebut bisa saling berkomunikasi.

##### Network Driver

Saat kita membuat Network di Docker, kita perlu menentukan driver yang ingin kita gunakan, ada banyak driver yang bisa kita gunakan, tapi kadang ada syarat sebuah driver network bisa kita gunakan.

* **bridge**, yaitu driver yang digunakan untuk membuat network secara virtual yang memungkinkan container yang terkoneksi di bridge network yang sama saling berkomunikasi.
* **host**, yaitu driver yang digunakan untuk membuat network yang sama dengan sistem host. host hanya jalan di Docker Linux, tidak bisa digunakan di Mac atau Windows.
* **none**, yaitu driver untuk membuat network yang tidak bisa berkomunikasi.

Untuk melihat network di Docker, kita bisa gunakan perintah :
```sh
docker network ls
```

Untuk membuat network baru, kita bisa menggunakan perintah :
```sh
docker network create --driver namadriver namanetwork
# contoh
docker network create --driver bridge contohnetwork
```

Untuk menghapus Network, kita bisa gunakan perintah :
```sh
docker network rm namanetwork
# contoh
docker network rm contohnetwork
```

> ⚠️ Network tidak bisa dihapus jika sudah digunakan oleh container. Kita harus menghapus container nya terlebih dahulu dari Network.   

</details>





<!-- container network -->
#### Container Network

<details>
<summary> 02:37:17 - Container Network </summary>

Setelah kita membuat Network, kita bisa menambahkan container ke network. <mark> Container yang terdapat di dalam network yang sama bisa saling berkomunikasi (tergantung jenis driver network nya)</mark>. Container bisa mengakses container lain dengan menyebutkan hostname dari container nya, yaitu nama container nya. 

Untuk menambahkan container ke network, kita bisa menambahkan perintah --network ketika membuat container, misal :
```sh
docker container create --name namacontainer --network namanetwork image:tag

# contoh
# buat network bridge dahulu
docker network create --driver bridge mongonetwork

# buat container untuk mongodb
docker container create --name mongodb --network mongonetwork --env MONGO_INITDB_ROOT_USERNAME=yusuf --env MONGO_INITDB_ROOT_PASSWORD=yusuf mongo:latest

# unduh image mongo-express (base webb app, untuk manage mongodb)
docker image pull mongo-express:latest

# buat container dengan image mongo-express yang akan berkomunikasi dengan container mongodb
docker container create --name mongodbexpress --network mongonetwork --publish 8081:8081 --env ME_CONFIG_MONGODB_URL="mongodb://yusuf:yusuf@mongodb:27017/" mongo-express:latest

# jalankan container mongodb
docker container start mongodb

# jalankan container mongodbexpress
docker container start mongodbexpress
```
</details>





<!-- Materi Inspect  -->
#### Inspect 
<details>
<summary> 02:51:39 - Inspect </summary>

Docker memiliki fitur bernama **inspect**, yang bisa digunakan di image, container, volume dan network. Dengan fitur ini, kita bisa <mark> melihat detail dari tiap hal yang ada di Docker. </mark>

```sh
# Untuk melihat detail dari image, gunakan : 
docker image inspect namaimage
# Untuk melihat detail dari container, gunakan : 
docker container inspect namacontainer
# Untuk melihat detail dari volume, gunakan : 
docker volume inspect namavolume
# Untuk melihat detail dari network, gunakan : 
docker network inspect namanetwork
```
</details>






<!-- Materi prune  -->
#### Prune

<details>
<summary>  02:58:19 - Prune </summary>

Saat kita menggunakan Docker, kadang ada kalanya kita ingin membersihkan hal-hal yang sudah tidak digunakan lagi di Docker, misal container yang sudah di stop, image yang tidak digunakan oleh container, atau volume yang tidak digunakan oleh container. Fitur untuk membersihkan secara otomatis di Docker bernama prune. Hampir di semua perintah di Docker mendukung prune. 

```sh
# Untuk menghapus semua container yang sudah stop, gunakan : 
docker container prune
# Untuk menghapus semua image yang tidak digunakan container, gunakan : 
docker image prune
# Untuk menghapus semua network yang tidak digunakan container, gunakan : 
docker network prune
# Untuk menghapus semua volume yang tidak digunakan container, gunakan : 
docker volume prune
# Atau kita bisa menggunakan satu perintah untuk menghapus container, network dan image yang sudah tidak digunakan menggunakan perintah : 
docker system prune
```
</details>



<!-- video 2 -->
<h2 id="2-docker-dockerfile"> DOCKER DOCKERFILE </h2>


<!-- materi dockerfile -->
### Pengenalan Dockerfile 

<details>
<summary> 00:01:39 - Pengenalan Dockerfile </summary>

<mark> Dockerfile adalah file text yang berisi semua perintah yang bisa kita gunakan untuk membuat sebuah Docker Image </mark>. Anggap saja semua instruksi untuk, menjalankan aplikasi kita, kita simpan di dalam Dockerfile, nanti Dockerfile tersebut akan dieksekusi sebagai perintah untuk membuat Docker Image. 


##### Docker Build 


Untuk membuat Docker Image dari Dockerfile, kita bisa menggunakan perintah docker build. Saat membuat Docker Image dengan docker build, nama image secara otomatis akan dibuat random, dan biasanya kita ingin menambahkan nama/tag pada image nya, kita bisa mengubahnya dengan menambahkan perintah ``-t``. Misal berikut adalah contoh cara menggunakan docker build :

```sh
# docker build -t nama_image:tag_ver direktor_Dockerfile
docker build -t khannedy/app:1.0.0  folder-dockerfile
docker build -t khannedy/app:1.0.0 -t khannedy/app:latest folder-dockerfile
```
</details>





<!-- Materi docker file format -->
### Dockerfile Format

<details>
<summary>  00:06:07 - Dockerfile Format </summary>

Seperti namanya, Dockerfile biasanya dibuat dalam sebuah file dengan nama Dockerfile, tidak memiliki extension apapun
> ⚠️ Walaupun sebenarnya bisa saja kita membuat dengan nama lain, namu direkomendasikan menggunakan nama Dockerfile

Secara sederhana berikut adalah format untuk file Dockerfile :


* ``#`` digunakan untuk menambah komentar, kode dalam baris tersebut secara otomatis dianggap komentar

```Dockerfile
# Komentar
INSTRUCTION arguments

```

* **INSTRUCTION** adalah perintah yang digunakan di Dockerfile, ada banyak perintah yang tersedia, dan penulisan perintahnya case insensitive, sehingga kita bisa gunakan huruf besar atau kecil. <mark> Namun rekomendasinya adalah menggunakan UPPPER CASE</mark>.

* Arguments adalah data argument untuk INSTRUCTION, yang menyesuaikan dengan jenis INSTRUCTION yang digunakan.
</details>





<!-- materi form instruction -->
### From Instruction

<details>
<summary> 00:09:37 - From Instruction</summary>

Saat kita membuat Docker Image, biasanya perintah pertama adalah melakukan build stage dengan instruksi FROM. **FROM** digunakan untuk membuat build stage dari image yang kita tentukan.

> Biasanya, jarang sekali kita akan membuat Docker Image dari scratch (kosongan), biasanya kita akan membuat Docker Image dari Docker Image lain yang sudah ada.

Untuk menggunakan FROM, kita bisa gunakan perintah :

```Dockerfile
FROM image:version
# contoh : menggunakan linux alphine versi 3
FROM alphine:3
```

Setelah menyiapkan/menyimpan from diatas didalam sebuah file ``Dockerfile`` maka selanjutnya untuk proses membuat docker image dari from diatas kita bisa menggunakan perintah terminal berikut untuk membuild imagenya: 

```sh
# docker build -t nama_akun_dockerhub/nama_image:tag_ver dir_Dockerfile
docker build -t m16yusuf/from from
```
</details>






<!-- 00:18:14 - Run Instruction -->
### Run Instruction

<details>
<summary> 00:18:14 - Run Instruction </summary>

<mark> RUN adalah sebuah instruksi untuk mengeksekusi perintah di dalam image pada saat build stage.</mark> Hasil perintah RUN akan di commit dalam perubahan image tersebut, jadi perintah RUN akan dieksekusi pada saat proses docker build saja, setelah menjadi Docker Image, perintah tersebut tidak akan dijalankan lagi. Jadi ketika kita menjalankan Docker Container dari Image tersebut, maka perintah RUN tidak akan dijalankan lagi.

Perintah RUN memiliki 2 format :
```Dockerfile
# contoh run singgle command
RUN command
# contoh run dalam bentuk array
RUN [“executable”, “argument”, “...”]
```

```Dockerfile
# PRAKTEK
# membuat direktori baru run run/Dockerfile
# dengan isi perintah berikut:
FROM alpine:3

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"
RUN cat "hello/world.txt"
```

Lalu build Dockerfile tersebut diterminal dengan cara berikut:

```sh
docker build -t m16yusuf/run run
```

Secara default, di docker terbaru tidak akan menampilkan tulisan detail dari build-nya. Jika kita ingin menampilkan detailnya, kita bisa gunakan perintah :

```sh
--progress=plain
```

Selain itu juga docker build juga melakukan cache, jika kita ingin mengulangi lagi tanpa menggunakan cache, kita bisa gunakan perintah 

```sh
--no-cache
```

Contoh build image dengan menampilkan progress dan tanpa caching :

```sh
docker build -t m16yusuf/run run --progress=plain --no-cache
```
</details>






<!-- Materi 00:28:29 - Command Instruction -->
### Command Instruction 

<details>
<summary> 00:28:29 - Command Instruction </summary>

<mark> CMD atau Command, merupakan instruksi yang digunakan ketika Docker Container berjalan</mark>. CMD tidak akan dijalankan ketika proses build, namun dijalankan ketika Docker Container berjalan. 

<mark> Dalam Dockerfile, kita tidak bisa menambah lebih dari satu instruksi CMD</mark>, jika kita tambahkan lebih dari satu instruksi CMD, maka yang akan digunakan untuk menjalankan Docker Container adalah instruksi CMD yang terakhir.

Perintah CMD memiliki beberapa format :

```Dockerfile
CMD command param param
CMD [“executable”, “param”, “param”]
# akan menggunakan executable ENTRY POINT, yang akan dibahas di chapter terpisah
CMD [“param”, “param”]
```

Praktek :

```sh
# membuat dockerfile baru di command/Dockerfile dengan isi:
FROM alpine:3

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"

CMD cat "hello/world.txt"

# build Dockerfile tersebut di terminal 
docker build -t m16yusuf/command command

# perintah CMDnya tidak akan terlihat saat proses build
# tapi CMD bisa dilihat pada saat imagenya di inspect
# inspect : melihat detail imagenya
docker image inspect m16yusuf/command

# untuk lebih detailnya dicoba dicontainer
docker container create --name command m16yusuf/command
docker container start command 
docker container logs command  
```
</details>






<!-- label Instruction -->
### Label Instruction

<details>
<summary> 00:36:32 - Label Instruction </summary>

Instruksi LABEL merupakan instruksi yang digunakan untuk menambahkan metadata ke dalam Docker Image yang kita buat. <mark> Metadata adalah informasi tambahan, misal seperti nama aplikasi, pembuat, website, perusahaan, lisensi dan lain-lain</mark>. Metadata hanya berguna sebagai informasi saja, tidak akan digunakan ketika kita menjalankan Docker Container.

Berikut adalah format instruksi LABEL:

```Dockerfile
LABEL <key>=<value>
LABEL <key1>=<value1> <key2>=<value2> …
```

Contoh praktek membuat ``LABEL`` pada dockerfile:

```Dockerfile
FROM alpine:3

LABEL author="Muhammad Yusuf"
LABEL company="Yusuf zaman now" website="https://linktr.ee/m16yusuf"

RUN mkdir hello
RUN echo "Hello world" > "hello/world.txt"

CMD cat "hello/world.txt"
```

Lalu build docker file tersebut menjadi image dengan perintah terminal berikut:

```sh
docker build -t m16yusuf/label label 

# saat image berhasil di build dan melakukan inspek 
# maka informasi label sebelumnya akan muncul
docker image inspect m16yusuf/label
```


</details>






<!-- Materi add instruction -->
### Add Instruction 

<details>
<summary> 00:41:22 - Add Instruction </summary>

<mark> ADD adalah instruksi yang dapat digunakan untuk menambahkan file dari source ke dalam folder destination di Docker Image</mark>. Perintah ADD bisa mendeteksi apakah sebuah file source merupakan file kompres seperti tar.gz, gzip, dan lain-lain. Jika mendeteksi file source adalah berupa file kompress, maka secara otomatis file tersebut akan di extract dalam folder destination.

Perintah ADD juga bisa mendukung banyak penambahan file sekaligus. Penambahan banyak file sekaligus di instruksi ADD menggunakan Pattern di Go-Lang : https://pkg.go.dev/path/filepath#Match 

Instruksi ADD memiliki format sebagai berikut :

```Dockerfile
ADD source destination
# Contoh :
ADD world.txt hello 
# menambah file world.txt ke folder hello
ADD *.txt hello 
# menambah semua file .txt ke folder hello
```

Contoh praktek ``add`` buat add/Dockerfile :

```Dockerfile 
FROM alpine:3

RUN mkdir hello
ADD text/*.txt hello
# menambahkan semua file extensi txt dari folder text
# ke folder hello di dalam docker image yang sudah dibuat
CMD cat "hello/world.txt"
```

build Dockerfile tersebut dan cek dengan logs container :
```sh
docker build -t m16yusuf/add add

# build container baru dengan docker image tersebut
# start container dan cek lognya
docker container create --name add m16yusuf/add
docker container start add
docker container logs add
```
</details>





<!-- Materi copy instruction -->
### Copy Instruction

<details>
<summary> 00:51:16 - Copy Instruction </summary>

COPY adalah instruksi yang dapat digunakan untuk menambahkan file dari source ke dalam folder destination di Docker Image.

Lantas apa bedanya dengan instruksi ADD kalo begitu? COPY hanya melakukan copy file saja, sedangkan ADD selain melakukan copy, dia bisa mendownload source dari URL dan secara otomatis melakukan extract file kompres

> Namun best practice nya, sebisa mungkin menggunakan COPY, jika memang butuh melakukan extract file kompres, gunakan perintah RUN dan jalankan aplikasi untuk extract file kompres tersebut.

Instruksi COPY memiliki format sebagai berikut :
```Dockerfile
COPY source destination
# Contoh :
COPY world.txt hello 
# menambah file world.txt ke folder hello
COPY *.txt hello 
# menambah semua file .txt ke folder hello
```

Contoh praktek copy prosesnya sama dengan contoh praktek add, membuat copy/Dockerfile :
```Dockerfile 
FROM alpine:3

RUN mkdir hello
COPY text/*.txt hello

CMD cat "hello/pzn.txt"
```

build Dockerfile tersebut dan cek dengan logs container :

```sh
docker build -t m16yusuf/copy copy 

# build container baru dengan docker image tersebut
# start container dan cek lognya
docker container create --name copy m16yusuf/copy
docker container start copy
docker container logs copy
```
</details>






<!-- materi dockerignore file -->
### .dockerignore file

<details>
<summary> 00:56:05 - Dockerignore File </summary>

Saat kita melakukan ADD atau COPY dari file source, pertama Docker akan membaca file yang bernama ``.dockerignore``. File ``.dockerignore`` ini seperti file ``.gitignore``, dimana kita bisa menyebutkan file-file apa saja yang ingin kita ignore (hiraukan). <mark> Artinya jika ada file yang kita sebut di dalam file .dockerignore, secara otomatis file tersebut tidak aka di ADD atau di COPY</mark>. File ``.dockerignore`` juga mendukung ignore folder atau menggunakan regular expression.

##### praktek dockerignore

```sh
# membuat direktori seperti ini
│   .dockerignore
│   Dockerfile
│
└───text
    │   app.log
    │   sample.log
    │   world.txt
    │
    └───temp
            sample.txt


# lalu untuk isi dari .dockerignore
# ignore semua file extensi log di folder text
text/*.log
# ignore folder temp
text/temp

# lalu untuk isi dari Dockerfile
FROM alpine:3
RUN mkdir hello
COPY text/* hello
# melihat semua isi direktori hello
CMD ls -l hello


# build dockerfile dengan .dockerignore
docker build -t m16yusuf/ignore ignore
# test dengan container, start, dan cek lognya
docker container create --name ignore m16yusuf/ignore
docker container start ignore
docker container logs ignore
# hasil log manampilkan isi direktori hello 
# yang hanya ada world.txt saja
```
</details>






<!-- materi expose instruction -->
### Expose Instruction

<details>
<summary> 01:02:46 - Expose Instruction </summary>
<img src="" style="width:500px">
</details>











<h2 id="3-docker-compose"> DOCKER COMPOSE </h2> 






<details>
<summary> </summary>
<img src="" style="width:500px">
</details>
