
# DOCKER 



Materi belajar 
[Docker dasar](https://youtu.be/3_yxVjV88Zk?si=gRNTgPAG723_Ncxu)


## DOCKER DASAR 

Agenda Materi 

- Container 
- pengenalan docker
- menginstall docker 
- arsitektur docker 
- docker image 
- docker registry 
- docker container 
- docker volume
- docker network
- dan lain-lain




<!-- Materi pengenalan container -->
#### 00:03:27  Pengenalan Container

Container Vs Docker 

* Berbeda dengan VM, Container sendiri berfokus pada sisi Aplikasi.
* Container sendiri sebenarnya berjalan diatas aplikasi Container Manager yang berjalan di sistem operasi.
* Yang membedakan dengan VM adalah, pada Container, kita bisa mem-package aplikasi dan dependency-nya tanpa harus menggabungkan sistem operasi.
* Container akan menggunakan sistem operasi host dimana Container Manager nya berjalan, oleh karena itu, Container akan lebih hemat resource dan lebih cepat jalan nya, karena tidak butuh sistem operasi sendiri.
* Ukuran Container biasanya hanya hitungan MB, berbeda dengan VM yang bisa sampai GB karena di dalamnya ada sistem operasinya.




<!-- Materi pengenalan docker  -->
#### 00:12:38 - Pengenalan Docker

Docker adalah salah satu implementasi Container Manager yang saat ini paling populer. Docker merupakan teknologi yang masih baru, karena baru diperkenalkan sekitar tahun 2013. Docker adalah aplikasi yang free dan Open Source, sehingga bisa kita gunakan secara bebas. https://www.docker.com/




<!-- Arsitektur docker -->
#### 00:14:46 - Arsitektur Docker

Docker menggunakan arsitektur Client-Server. Docker client berkomunikasi dengan Docker daemon (server). Saat kita menginstall Docker, biasanya didalamnya sudah terdapat Docker Client dan Docker Daemon. Docker Client dan Docker Daemon bisa berjalan di satu sistem yang sama. Docker Client dan Docker Daemon berkomunikasi menggunakan REST API. 

<img src="./img/arsitekrur_docker.png" style="width:500px">




<!-- Menginstall docker -->
<!-- Docker resigtry -->
#### 00:26:27 - Docker Registry

Docker Registry adalah tempat kita menyimpan Docker Image. Dengan menggunakan Docker Registry, kita bisa menyimpan Image yang kita buat, dan bisa digunakan di Docker Daemon dimanapun selama bisa terkoneksi ke Docker Registry.

Contoh- contoh Docker Registry:

* [Docker Hub](https://hub.docker.com/) (free)
* [Digital Ocean Container Registry](https://www.digitalocean.com/products/container-registry/)
* [Google Cloud Container Registry ](https://cloud.google.com/container-registry )
* [Amazon Elastic Container Registry ](https://aws.amazon.com/id/ecr/)
* [Azure Container Registry](https://azure.microsoft.com/en-us/services/container-registry/)





<!-- Docker Image -->
#### 00:31:18 - Docker Image

Docker Image mirip seperti installer aplikasi, dimana di dalam Docker Image terdapat aplikasi dan dependency. Sebelum kita bisa menjalankan aplikasi di Docker, kita perlu memastikan memiliki Docker Image aplikasi tersebut. 

```sh
# Melihat list Image Docker 
docker image ls

# mendownload image docker dari hub.docker.com
docker image pull redis:latest

# hapus docker image yang sudah didownload
docker image rm redis:latest
```




<!-- Docker Container  -->
#### 00:40:45 - Docker Container

Jika Docker Image seperti installer aplikasi, maka Docker Container mirip seperti aplikasi hasil installernya. Satu Docker Image bisa digunakan untuk membuat beberapa Docker Container, asalkan nama Docker Container nya berbeda. 

Jika kita sudah membuat Docker Container, maka Docker Image yang digunakan tidak bisa dihapus, hal ini dikarenakan sebenarnya Docker Container tidak meng-copy isi Docker Image, tapi hanya menggunakannya isinya saja.


#### melihat Docker container
Melihat semua container didalam docker daemon/docker server bisa menggunakan perintah:

```sh
# melihat list container
docker container ls -a

# melihat yang sedang berjalan
docker container ls 
```

#### Membuat Docker Container

> ⚠️Tidak bisa membuat dua container dengan nama yang sama 

```sh
# membuat container baru dengan nama contohredis
docker container create --name contohredis redis:latest
```

#### Menjalankan & menghentikan docker container

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

#### Menghapus docker container

> ⚠️ tidak bisa menghapus docker container yang sedang berjalan, harus distop

```sh
# perintah hapus docker container
docker container rm contohredis
docker container rm contohredis2
```





<!-- Materi container log -->
#### 00:56:57 - Container Log

Kadang saat terjadi masalah dengan aplikasi yang terdapat di container, sering kali kita ingin melihat detail dari log aplikasinya. Hal ini dilakukan untuk melihat detail kejadian apa yang terjadi di aplikasi, sehingga akan memudahkan kita ketika mendapat masalah. 

Untuk melihat log aplikasi di container kita, kita bisa menggunakan perintah :
```sh
docker container logs containerId/namacontainer
```
Atau jika ingin melihat log secara realtime, kita bisa gunakan perintah :
```sh
docker container logs -f containerId/namacontainer
```




<!-- Materi container exec -->
#### Container Exec 









<details>
<summary> </summary>
<img src="" style="width:500px">
</details>
