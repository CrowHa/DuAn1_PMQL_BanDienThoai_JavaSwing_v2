-- TAO DATABASE
create database QLCHDT
use QLCHDT

--TAO BANG MAUSAU
create table MAUSAC (
	ID UNIQUEIDENTIFIER Primary Key,
	MAMAU VARCHAR(50) not null,
	TENMAU NVARCHAR(50) not null,
)

--TAO BANG HANG
create table HANG (
	ID UNIQUEIDENTIFIER Primary Key,
	MAHANG VARCHAR(50) not null,
	TENHANG NVARCHAR(50) not null,
)

--TAO BANG CHIP
create table CHIP (
	ID UNIQUEIDENTIFIER Primary Key,
	MACHIP VARCHAR(50) not null,
	TENCHIP NVARCHAR(50) not null,
)
--TAO BANG RAM
create table RAM (
	ID UNIQUEIDENTIFIER Primary Key,
	MARAM VARCHAR(50) not null,
	DUNGLUONG int not null,
)
--TAO BANG ROM
create table ROM (
	ID UNIQUEIDENTIFIER Primary Key,
	MAROM VARCHAR(50) not null,
	DUNGLUONG int not null,
)
--TAO BANG ROM
create table PIN (
	ID UNIQUEIDENTIFIER Primary Key,
	MAPIN VARCHAR(50) not null,
	TENPIN NVARCHAR(50) not null,
)
--TAO BANG SANPHAM
create table SANPHAM (
	ID UNIQUEIDENTIFIER Primary Key,
	MASP VARCHAR(50) not null,
	TENSP VARCHAR(50) not null,
	DONGIA MONEY,
	MOTA VARCHAR(50),
	URLANH VARCHAR(50),
	SOLUONG int,
	TRANGTHAI int,
	IDMS UNIQUEIDENTIFIER FOREIGN KEY REFERENCES MAUSAC(ID),
	IDPIN UNIQUEIDENTIFIER FOREIGN KEY REFERENCES PIN(ID),
	IDRAM UNIQUEIDENTIFIER FOREIGN KEY REFERENCES RAM(ID),
	IDROM UNIQUEIDENTIFIER FOREIGN KEY REFERENCES ROM(ID),
	IDCHIP UNIQUEIDENTIFIER FOREIGN KEY REFERENCES CHIP(ID),
	IDHANG UNIQUEIDENTIFIER FOREIGN KEY REFERENCES HANG(ID)
)


--TAO BANG IMEI
create table IMEI (
	ID UNIQUEIDENTIFIER Primary Key,
	MAIMEI VARCHAR(50) not null,
	IMEI VARCHAR(50) not null,
	TRANGTHAI int,
	IDSP UNIQUEIDENTIFIER FOREIGN KEY REFERENCES SANPHAM(ID),
)

--TAO BANG IMEIDB
create table IMEIDB (
	ID UNIQUEIDENTIFIER Primary Key,
	MAIMEI VARCHAR(50),
	IMEI VARCHAR(50),
	TRANGTHAI int,
	IDHDCT UNIQUEIDENTIFIER FOREIGN KEY REFERENCES HDCT(ID),
)

--TAO BANG NHANVIEN
create table NHANVIEN (
	ID UNIQUEIDENTIFIER Primary Key,
	MANV VARCHAR(50) not null,
	TEN NVARCHAR(50) not null,
	GIOITINH INT,
	CHUCVU INT,
	EMAIL NVARCHAR(50),
	TAIKHOAN VARCHAR(50),
	MATKHAU VARCHAR(50),
	QUEQUAN VARCHAR(50),
	NGAYSINH DATE
)
INSERT INTO NHANVIEN(ID,MANV,TEN,GIOITINH,CHUCVU,EMAIL,TAIKHOAN,MATKHAU,QUEQUAN,NGAYSINH) VALUES
(NEWID(),'NV1', 'Nguyen Manh Ha', 0 ,0, 'nguyenmanhha4003@gmail.com', 'nguyenmanha4003','12345678','Tuyen Quang','2003-04-11')

--TAO BANG KHACHHANG
create table KHACHHANG (
	ID UNIQUEIDENTIFIER Primary Key,
	MAKH VARCHAR(50) not null,
	TEN NVARCHAR(50) not null,
	GIOITINH INT,
	EMAIL NVARCHAR(50),
	QUEQUAN VARCHAR(50),
	NGAYSINH DATE
)

--TAO BANG HOADON
create table HOADON (
	ID UNIQUEIDENTIFIER Primary Key,
	MAHD VARCHAR(50) not null,
	TRANGTHAI int,
	IDNV UNIQUEIDENTIFIER FOREIGN KEY REFERENCES NHANVIEN(ID),
	IDKH UNIQUEIDENTIFIER FOREIGN KEY REFERENCES KHACHHANG(ID),
	TONGTIEN MONEY
)

--TAO BANG HOADONCHITIET
create table HDCT (
	ID UNIQUEIDENTIFIER Primary Key,
	SOLUONG int,
	IDHD UNIQUEIDENTIFIER FOREIGN KEY REFERENCES HOADON(ID),
	IDSP UNIQUEIDENTIFIER FOREIGN KEY REFERENCES SANPHAM(ID),
	DONGIA MONEY
)

--TAO BANG VOUCHER
create table VOUCHER (
	ID UNIQUEIDENTIFIER Primary Key,
	MAKM VARCHAR(50) not null,
	TEN NVARCHAR(50) not null,
	NGAYBD DATE,
	NGAYKT DATE,
	QUEQUAN VARCHAR(50),
	LOAIGIAMGIA int,
	HINHTHUCGIAMGIA int,
	GIATRIGIAM int
)

--TAO BANG SPSALE
create table SPSALE (
	ID UNIQUEIDENTIFIER Primary Key,
	IDHD UNIQUEIDENTIFIER FOREIGN KEY REFERENCES HOADON(ID),
	IDKM UNIQUEIDENTIFIER FOREIGN KEY REFERENCES VOUCHER(ID),
)










