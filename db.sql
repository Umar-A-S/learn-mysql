create database perpustakaan;

use perpustakaan;

create table rak(
  kode varchar(10) primary key,
  kategori varchar(20) not null,
  baris varchar(20) not null
);

create table pegawai(
  nip varchar(20) primary key,
  alamat varchar(50) not null,
  nama varchar(30) not null
);

create table buku (
  id_buku varchar(10) primary key,
  judul varchar(30) not null,
  stok varchar(50),
  kode varchar(10) not null,
  foreign key (kode) references rak(kode)
);

create table anggota(
  id_anggota varchar(255) primary key,
  nama varchar(40) not null
);

create table pengembalian(
  tgl_kembali timestamp default current_timestamp,
  denda int,
  id_buku varchar(10) not null,
  id_anggota varchar(255) not null,
  foreign key (id_buku) references buku(id_buku),
  foreign key (id_anggota) references anggota(id_anggota)  
);

create table peminjaman(
  kode_transaksi varchar(255) primary key,
  tgl_kembali timestamp default current_timestamp,
  tgl_pinjam timestamp default current_timestamp,
  id_buku varchar(10) not null,
  id_anggota varchar(255) not null,
  foreign key (id_buku) references buku(id_buku),
  foreign key (id_anggota) references anggota(id_anggota)  
);

