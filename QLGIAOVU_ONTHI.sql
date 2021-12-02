﻿CREATE DATABASE QLGV_Nov29
USE QLGV_Nov29

CREATE TABLE KHOA
(
	MAKHOA 	 VARCHAR(4) PRIMARY KEY, 
	TENKHOA  NVARCHAR(40),
	NGTLAP	 SMALLDATETIME,
	TRGKHOA CHAR(4)
)
CREATE TABLE LOP
(
	MALOP 	 CHAR(3) PRIMARY KEY,
	TENLOP 	 NVARCHAR(40),
	TRGLOP	 CHAR(5),
	SISO 	 TINYINT,
	MAGVCN	 CHAR(4)
)
CREATE TABLE HOCVIEN
(
	MAHV 	 CHAR(5) PRIMARY KEY,
	HO 	 NVARCHAR(40),
	TEN	 NVARCHAR(10),
	NGSINH   SMALLDATETIME,
	GIOITINH NVARCHAR(3),
	NOISINH  NVARCHAR(40),
	MALOP 	 CHAR(3) 
)
CREATE TABLE MONHOC
(
	MAMH 	 VARCHAR(10) PRIMARY KEY,
	TENMH 	 NVARCHAR(40),
	TCLT 	 TINYINT,
	TCTH 	 TINYINT,
	MAKHOA VARCHAR(4) 
)
CREATE TABLE DIEUKIEN
(
	MAMH 	   VARCHAR(10), 
	MAMH_TRUOC VARCHAR(10), 
	PRIMARY KEY (MAMH,MAMH_TRUOC),
)
CREATE TABLE GIAOVIEN
(
 	MAGV 	 CHAR(4) PRIMARY KEY,
	HOTEN	 NVARCHAR(40),
	HOCVI 	 VARCHAR(10),
	HOCHAM	 VARCHAR(10),
	GIOITINH NVARCHAR(3),
	NGSINH   SMALLDATETIME,
	NGVL 	 SMALLDATETIME,
	HESO	 NUMERIC(4,2),
	MUCLUONG MONEY,
	MAKHOA VARCHAR(4)
)
CREATE TABLE GIANGDAY
(
	MALOP 	 CHAR(3),
	MAMH	 VARCHAR(10),
	MAGV	 CHAR(4),
	HOCKY	 TINYINT,
	NAM		 SMALLINT,
	TUNGAY   SMALLDATETIME,
	DENNGAY   SMALLDATETIME,
	PRIMARY KEY (MALOP,MAMH)
)
CREATE TABLE KETQUATHI
(
	MAHV	 CHAR(5),
	MAMH	 VARCHAR(10),
	LANTHI	 TINYINT,
	NGTHI	 SMALLDATETIME,
	DIEM	 NUMERIC(4,2),
	KQUA	 NVARCHAR(10)
	PRIMARY KEY (MAHV,MAMH,LANTHI)
)

ALTER TABLE KHOA ADD CONSTRAINT FK_TRGKHOA FOREIGN KEY (TRGKHOA) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE LOP ADD CONSTRAINT FK_MAGVCN FOREIGN KEY (MAGVCN) REFERENCES GIAOVIEN(MAGV)
ALTER TABLE HOCVIEN ADD CONSTRAINT FK_MALOP FOREIGN KEY (MALOP) REFERENCES LOP(MALOP)
ALTER TABLE MONHOC ADD CONSTRAINT FK_MAKHOA FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE DIEUKIEN ADD CONSTRAINT FK_MAMH_TRUOC FOREIGN KEY (MAMH_TRUOC) REFERENCES MONHOC(MAMH)
ALTER TABLE GIAOVIEN ADD CONSTRAINT FK_MAK FOREIGN KEY (MAKHOA) REFERENCES KHOA(MAKHOA)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MAHV FOREIGN KEY (MAHV) REFERENCES HOCVIEN(MAHV)
ALTER TABLE KETQUATHI ADD CONSTRAINT FK_MH FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_LOP FOREIGN KEY (MALOP)REFERENCES LOP(MALOP)
ALTER TABLE GIANGDAY ADD CONSTRAINT FK_MH1 FOREIGN KEY (MAMH) REFERENCES MONHOC(MAMH)
----------------------------------------------------

ALTER TABLE KHOA DROP CONSTRAINT FK_TRGKHOA
ALTER TABLE LOP DROP CONSTRAINT FK_MAGVCN
ALTER TABLE HOCVIEN DROP CONSTRAINT FK_MALOP
ALTER TABLE MONHOC DROP CONSTRAINT FK_MAKHOA
ALTER TABLE DIEUKIEN DROP CONSTRAINT FK_MAMH
ALTER TABLE DIEUKIEN DROP CONSTRAINT FK_MAMH_TRUOC
ALTER TABLE GIAOVIEN DROP CONSTRAINT FK_MAK
ALTER TABLE KETQUATHI DROP CONSTRAINT FK_MAHV
ALTER TABLE KETQUATHI DROP CONSTRAINT FK_MH
ALTER TABLE GIANGDAY DROP CONSTRAINT FK_LOP
ALTER TABLE GIANGDAY DROP CONSTRAINT FK_MH1

-------------------------------------------------------------------
/*INSERT DỮ LIỆU*/
/*Dữ liệu Khoa*/
SET DATEFORMAT DMY
INSERT INTO KHOA VALUES('KHMT',N'Khoa học máy tính','7/6/2005','GV01')
INSERT INTO KHOA VALUES('HTTT',N'Hệ thống thông tin','7/6/2005','GV02')
INSERT INTO KHOA VALUES('CNPM',N'Công nghệ phần mềm','7/6/2005','GV04')
INSERT INTO KHOA VALUES('MTT',N'Mạng và truyền thông','20/10/2005','GV03')
INSERT INTO KHOA(MAKHOA, TENKHOA, NGTLAP) VALUES('KTMT',N'Kỹ thuật máy tính','20/12/2005')
------------------
/*Dữ liệu Lớp*/
INSERT INTO LOP VALUES('K11',N'Lớp 1 khóa 1','K1108',11,'GV07')
INSERT INTO LOP VALUES('K12',N'Lớp 2 khóa 1','K1205',12,'GV09')
INSERT INTO LOP VALUES('K13',N'Lớp 3 khóa 1','K1305',12,'GV14')
-----------------
/*Dữ liệu Môn học*/
INSERT INTO MONHOC VALUES('THDC',N'Tin học đại cương',4,1,'KHMT')
INSERT INTO MONHOC VALUES('CTRR',N'Cấu trúc rời rạc',5,0,'KHMT')
INSERT INTO MONHOC VALUES('CSDL',N'Cơ sở dữ liệu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('CTDLGT',N'Cấu trúc dữ liệu giải thuật',3,1,'KHMT')
INSERT INTO MONHOC VALUES('PTTKTT',N'Phân tích thiết kế thuật toán',3,0,'KHMT')
INSERT INTO MONHOC VALUES('DHMT',N'Đồ họa máy tính',3,1,'KHMT')
INSERT INTO MONHOC VALUES('KTMT',N'Kiến trúc máy tính',3,0,'KTMT')
INSERT INTO MONHOC VALUES('TKCSDL',N'Thiết kế cơ sở dữ liệu',3,1,'HTTT')
INSERT INTO MONHOC VALUES('PTTKHTTT',N'Phân tích thiết kế hệ thống thông tin',4,1,'HTTT')
INSERT INTO MONHOC VALUES('HDH',N'Hệ điều hành',4,0,'KTMT')
INSERT INTO MONHOC VALUES('NMCNPM',N'Nhập môn công nghệ phần mềm',3,0,'CNPM')
INSERT INTO MONHOC VALUES('LTCFW',N'Lập trình C for win',3,1,'CNPM')
INSERT INTO MONHOC VALUES('LTHDT',N'Lập trình hướng đối tượng',3,1,'CNPM')
--------------------------------
/*Dữ liệu giáo viên*/
INSERT INTO GIAOVIEN VALUES('GV01',N'Hồ Thanh Sơn','PTS','GS',N'Nam','2/5/1950','11/1/2004',5,2250000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV02',N'Trần Tâm Thành','TS','PGS',N'Nam','17/12/1965','20/4/2004',4.5,2025000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV03',N'Đỗ Nghiêm Phụng','TS','GS',N'Nữ','1/8/1950','23/9/2004',4,1800000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV04',N'Trần Nam Sơn','TS','PGS',N'Nam','22/2/1961','12/1/2005',4.5,2025000,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV05',N'Mai Thanh Danh','ThS','GV',N'Nam','12/3/1958','12/1/2005',3,1350000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV06',N'Trần Doãn Hưng','TS','GV',N'Nam','11/3/1953','12/1/2005',4.5,2025000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV07',N'Nguyễn Minh Tiến','ThS','GV',N'Nam','23/11/1971','1/3/2005',4,1800000,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV08',N'Lê Thị Trân','KS','Null',N'Nữ','26/3/1974','1/3/2005',1.69,760500,'KHMT')
INSERT INTO GIAOVIEN VALUES('GV09',N'Nguyễn Tố Loan','ThS','GV',N'Nữ','31/12/1966','1/3/2005',4,1800000,'HTTT')
INSERT INTO GIAOVIEN VALUES('GV10',N'Lê Trần Ánh Loan','KS','Null',N'Nữ','17/7/1972','1/3/2005',1.86,837000,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV11',N'Hồ Thanh Tùng','CN','GV',N'Nam','12/1/1980','15/5/2005',2.67,1201500,'MTT')
INSERT INTO GIAOVIEN VALUES('GV12',N'Trần Vân Anh','CN','Null',N'Nữ','29/3/1981','15/5/2005',1.69,760500,'CNPM')
INSERT INTO GIAOVIEN VALUES('GV13',N'Nguyễn Linh Đan','CN','Null',N'Nữ','23/5/1980','15/5/2005',1.69,760500,'KTMT')
INSERT INTO GIAOVIEN VALUES('GV14',N'Trương Minh Châu','ThS','GV',N'Nữ','30/11/1976','15/5/2005',3,1350000,'MTT')
INSERT INTO GIAOVIEN VALUES('GV15',N'Lê Thanh Hà','ThS','GV',N'Nam','4/5/1978','15/5/2005',3,1350000,'KHMT')
--------------------------------
/*Dữ liệu giảng dạy*/
INSERT INTO GIANGDAY VALUES('K11','THDC','GV07',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES('K12','THDC','GV06',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES('K13','THDC','GV15',1,2006,'2/1/2006','12/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K12','CTRR','GV02',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K13','CTRR','GV08',1,2006,'9/1/2006','17/5/2006')
INSERT INTO GIANGDAY VALUES('K11','CSDL','GV05',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K12','CSDL','GV09',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CTDLGT','GV15',2,2006,'1/6/2006','15/7/2006')
INSERT INTO GIANGDAY VALUES('K13','CSDL','GV05',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K13','DHMT','GV07',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K12','CTDLGT','GV15',3,2006,'1/8/2006','15/12/2006')
INSERT INTO GIANGDAY VALUES('K11','HDH','GV04',1,2007,'2/1/2007','18/2/2007')
INSERT INTO GIANGDAY VALUES('K12','HDH','GV04',1,2007,'2/1/2007','20/3/2007')
INSERT INTO GIANGDAY VALUES('K11','DHMT','GV07',1,2007,'18/2/2007','20/3/2007')
------------------
/*Dữ liệu điều kiện*/
INSERT INTO DIEUKIEN VALUES('CSDL','CTRR')
INSERT INTO DIEUKIEN VALUES('CSDL','CTDLGT')
INSERT INTO DIEUKIEN VALUES('CTDLGT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKTT','CTDLGT')
INSERT INTO DIEUKIEN VALUES('DHMT','THDC')
INSERT INTO DIEUKIEN VALUES('LTHDT','THDC')
INSERT INTO DIEUKIEN VALUES('PTTKHTTT','CSDL')
--------------------
/*Dữ liệu học viên*/
INSERT INTO HOCVIEN VALUES('K1101',N'Nguyễn Văn',N'A','27/1/1986',N'Nam',N'TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1102',N'Trần Ngọc',N'Hân','14/3/1986',N'Nữ',N'Kiên Giang','K11')
INSERT INTO HOCVIEN VALUES('K1103',N'Hà Duy',N'Lập','18/4/1986',N'Nam',N'Nghệ An','K11')
INSERT INTO HOCVIEN VALUES('K1104',N'Trần Ngọc',N'Linh','30/3/1986',N'Nữ',N'Tây Ninh','K11')
INSERT INTO HOCVIEN VALUES('K1105',N'Trần Minh',N'Long','27/2/1986',N'Nam',N'TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1106',N'Lê Nhật',N'Minh','24/1/1986',N'Nam',N'TpHCM','K11')
INSERT INTO HOCVIEN VALUES('K1107',N'Nguyễn Như',N'Nhựt','27/1/1986',N'Nam',N'Hà Nội','K11')
INSERT INTO HOCVIEN VALUES('K1108',N'Nguyễn Mạnh',N'Tâm','27/2/1986',N'Nam',N'Kiên Giang','K11')
INSERT INTO HOCVIEN VALUES('K1109',N'Phan Thị Thanh',N'Tâm','27/1/1986',N'Nữ',N'Vĩnh Long','K11')
INSERT INTO HOCVIEN VALUES('K1110',N'Lê Hoài',N'Thương','5/2/1986',N'Nữ',N'Cần Thơ','K11')
INSERT INTO HOCVIEN VALUES('K1111',N'Lê Hà',N'Vinh','25/12/1986',N'Nam',N'Vĩnh Long','K11')
INSERT INTO HOCVIEN VALUES('K1201',N'Nguyễn Văn',N'B','11/2/1986',N'Nam',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1202',N'Nguyễn Thị Kim',N'Duyên','18/1/1986',N'Nữ',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1203',N'Trần Thị Kim',N'Duyên','17/9/1986',N'Nữ',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1204',N'Trương Mỹ',N'Hạnh','19/5/1986',N'Nữ',N'Đồng Nai','K12')
INSERT INTO HOCVIEN VALUES('K1205',N'Nguyễn Thành',N'Nam','17/4/1986',N'Nam',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1206',N'Nguyễn Thị Trúc',N'Thanh','4/3/1986',N'Nữ',N'Kiên Giang','K12')
INSERT INTO HOCVIEN VALUES('K1207',N'Trần Thị Bích',N'Thụy','8/2/1986',N'Nữ',N'Nghệ An','K12')
INSERT INTO HOCVIEN VALUES('K1208',N'Huỳnh Thị Kim',N'Triệu','8/4/1986',N'Nữ',N'Tây Ninh','K12')
INSERT INTO HOCVIEN VALUES('K1209',N'Phạm Thanh',N'Triệu','23/2/1986',N'Nam',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1210',N'Ngô Thanh',N'Tuấn','14/2/1986',N'Nam',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1211',N'Đỗ Thị',N'Xuân','9/3/1986',N'Nữ',N'Hà Nội','K12')
INSERT INTO HOCVIEN VALUES('K1212',N'Lê Thị Phi',N'Yến','12/3/1986',N'Nữ',N'TpHCM','K12')
INSERT INTO HOCVIEN VALUES('K1301',N'Nguyễn Thị Kim',N'Cúc','9/6/1986',N'Nữ',N'Kiên Giang','K13')
INSERT INTO HOCVIEN VALUES('K1302',N'Trương Thị Mỹ',N'Hiền','18/3/1986',N'Nữ',N'Nghệ An','K13')
INSERT INTO HOCVIEN VALUES('K1303',N'Lê Đức',N'Hiền','21/3/1986',N'Nam',N'Tây Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1304',N'Lê Quang',N'Hiền','18/4/1986',N'Nam',N'TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1305',N'Lê Thị',N'Hương','27/3/1986',N'Nữ',N'TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1306',N'Nguyễn Thái',N'Hữu','30/3/1986',N'Nam',N'Ha Noi','K13')
INSERT INTO HOCVIEN VALUES('K1307',N'Trần Minh',N'Mẫn','28/5/1986',N'Nam',N'TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1308',N'Nguyễn Hiếu',N'Nghĩa','8/4/1986',N'Nam',N'Kiên Giang','K13')
INSERT INTO HOCVIEN VALUES('K1309',N'Nguyễn Trung',N'Nghĩa','18/1/1987',N'Nam',N'Nghệ An','K13')
INSERT INTO HOCVIEN VALUES('K1310',N'Trần Thị Hồng',N'Thăm','22/4/1986',N'Nữ',N'Tây Ninh','K13')
INSERT INTO HOCVIEN VALUES('K1311',N'Trần Minh',N'Thức','4/4/1986',N'Nam',N'TpHCM','K13')
INSERT INTO HOCVIEN VALUES('K1312',N'Nguyễn Thị Kim',N'Yến','7/9/1986',N'Nữ',N'TpHCM','K13')

-------------------------
/*Dữ liệu kết quả thi*/
INSERT INTO KETQUATHI VALUES('K1101','CSDL',1,'20/7/2006',10,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1101','CTDLGT',1,'28/12/2006',9,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1101','THDC',1,'20/5/2006',9,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1101','CTRR',1,'13/5/2006',9.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',1,'20/7/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',2,'27/7/2006',4.25,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CSDL',3,'10/8/2006',4.5,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',1,'28/12/2006',4.5,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',2,'5/1/2007',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CTDLGT',3,'15/1/2007',6,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1102','THDC',1,'20/5/2006',5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1102','CTRR',1,'13/5/2006',7,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',1,'20/7/2006',3.5,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1103','CSDL',2,'27/7/2006',8.25,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1103','CTDLGT',1,'28/12/2006',7,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1103','THDC',1,'20/5/2006',8,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1103','CTRR',1,'13/5/2006',6.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1104','CSDL',1,'20/7/2006',3.75,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1104','CTDLGT',1,'28/12/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1104','THDC',1,'20/5/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',1,'13/5/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',2,'20/5/2006',3.5,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1104','CTRR',3,'30/6/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1201','CSDL',1,'20/7/2006',6,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1201','CTDLGT',1,'28/12/2006',5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1201','THDC',1,'20/5/2006',8.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1201','CTRR',1,'13/5/2006',9,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1202','CSDL',1,'20/7/2006',8,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',1,'28/12/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1202','CTDLGT',2,'5/1/2007',5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1202','THDC',1,'20/5/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1202','THDC',2,'27/5/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',1,'13/5/2006',3,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',2,'20/5/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1202','CTRR',3,'30/6/2006',6.25,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1203','CSDL',1,'20/7/2006',9.25,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1203','CTDLGT',1,'28/12/2006',9.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1203','THDC',1,'20/5/2006',10,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1203','CTRR',1,'13/5/2006',10,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1204','CSDL',1,'20/7/2006',8.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1204','CTDLGT',1,'28/12/2006',6.75,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1204','THDC',1,'20/5/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1204','CTRR',1,'13/5/2006',6,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1301','CSDL',1,'20/12/2006',4.25,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1301','CTDLGT',1,'25/7/2006',8,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1301','THDC',1,'20/5/2006',7.75,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1301','CTRR',1,'13/5/2006',8,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1302','CSDL',1,'20/12/2006',6.75,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1302','CTDLGT',1,'25/7/2006',5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1302','THDC',1,'20/5/2006',8,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1302','CTRR',1,'13/5/2006',8.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1303','CSDL',1,'20/12/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',1,'25/7/2006',4.5,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',2,'7/8/2006',4,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1303','CTDLGT',3,'15/8/2006',4.25,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1303','THDC',1,'20/5/2006',4.5,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',1,'13/5/2006',3.25,N'Không Đạt')
INSERT INTO KETQUATHI VALUES('K1303','CTRR',2,'20/5/2006',5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1304','CSDL',1,'20/12/2006',7.75,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1304','CTDLGT',1,'25/7/2006',9.75,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1304','THDC',1,'20/5/2006',5.5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1304','CTRR',1,'13/5/2006',5,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1305','CSDL',1,'20/12/2006',9.25,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1305','CTDLGT',1,'25/7/2006',10,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1305','THDC',1,'20/5/2006',8,N'Đạt')
INSERT INTO KETQUATHI VALUES('K1305','CTRR',1,'13/5/2006',10,N'Đạt')
----------------------------------------
--PART 3
--12. Tìm những học viên (mã học viên, họ tên) thi không đạt môn CSDL ở lần thi thứ 1 nhưng chưa thi lại môn này.
SELECT HV.MAHV, HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
WHERE KQUA = N'Không Đạt' AND LANTHI = 1
EXCEPT
SELECT HV.MAHV, HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
WHERE LANTHI >= 2

--13. Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào.
SELECT MAGV, HOTEN
FROM GIAOVIEN 
EXCEPT
SELECT GV.MAGV, HOTEN
FROM GIAOVIEN GV JOIN GIANGDAY ON GV.MAGV = GIANGDAY.MAGV
 
--14(*). Tìm giáo viên (mã giáo viên, họ tên) không được phân công giảng dạy bất kỳ môn học nào thuộc khoa giáo viên đó phụ trách.
SELECT MAGV, HOTEN
FROM GIAOVIEN
EXCEPT
SELECT GV.MAGV, HOTEN
FROM GIAOVIEN GV JOIN GIANGDAY GD ON GV.MAGV = GD.MAGV
WHERE MAMH IN (SELECT DISTINCT MONHOC.MAMH 
				FROM GIAOVIEN, MONHOC
				WHERE GIAOVIEN.MAKHOA = MONHOC.MAKHOA AND GV.MAGV = GIAOVIEN.MAGV)

--15. Tìm họ tên các học viên thuộc lớp “K11” thi một môn bất kỳ quá 3 lần vẫn “Khong dat” hoặc thi lần thứ 2 môn CTRR được 5 điểm.
SELECT HO, TEN
FROM HOCVIEN H
WHERE LEFT(MAHV, 3) = 'K11' AND 
			(MAHV IN (SELECT MAHV
			FROM KETQUATHI K
			WHERE H.MAHV = K.MAHV AND KQUA = N'Không Đạt'
			EXCEPT
			SELECT MAHV
			FROM KETQUATHI K
			WHERE H.MAHV = K.MAHV AND KQUA = N'Đạt' AND LANTHI >= 3))
--CÁCH 2 
SELECT HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
WHERE LEFT(HV.MAHV, 3) LIKE 'K11' AND KQUA = N'Không Đạt'
GROUP BY HO, TEN, HV.MAHV, MAMH
HAVING COUNT(*) >= 3
UNION
SELECT HO, TEN
FROM HOCVIEN HV JOIN KETQUATHI KQT ON HV.MAHV = KQT.MAHV
WHERE LEFT(HV.MAHV, 3) LIKE 'K11'
AND MAMH = 'CTRR' AND LANTHI = 2 AND DIEM = 5.00

--16. Tìm họ tên giáo viên dạy môn CTRR cho ít nhất hai lớp trong cùng một học kỳ của một năm học.
SELECT HOTEN, HOCKY, NAM, COUNT(*) SL
FROM GIAOVIEN GV JOIN GIANGDAY GD ON GV.MAGV = GD.MAGV
WHERE MAMH = 'CTRR'
GROUP BY HOTEN, HOCKY, NAM
HAVING COUNT(*) >= 2

--17. Danh sách học viên và điểm thi môn CSDL (chỉ lấy điểm của lần thi sau cùng).
SELECT HOCVIEN.*, DIEM, LANTHI
FROM HOCVIEN JOIN KETQUATHI K1 ON HOCVIEN.MAHV = K1.MAHV
WHERE MAMH = 'CSDL' AND LANTHI = (SELECT MAX(LANTHI) FROM KETQUATHI K2 
								  WHERE K1.MAHV = K2.MAHV AND K1.MAMH = K2.MAMH)

--18. Danh sách học viên và điểm thi môn “Co So Du Lieu” (chỉ lấy điểm cao nhất của các lần thi).
SELECT HOCVIEN.*, DIEM
FROM HOCVIEN JOIN KETQUATHI K1 ON HOCVIEN.MAHV = K1.MAHV
WHERE MAMH = 'CSDL' AND DIEM = (SELECT MAX(DIEM) FROM KETQUATHI K2 
								  WHERE K1.MAHV = K2.MAHV AND K1.MAMH = K2.MAMH)

--19. Khoa nào (mã khoa, tên khoa) được thành lập sớm thứ 2.
SELECT KHOA.MAKHOA, TENKHOA
FROM KHOA
WHERE NGTLAP = (SELECT TOP 2 NGTLAP FROM KHOA EXCEPT SELECT MAX(NGTLAP) FROM KHOA)

SELECT * FROM KHOA
--20. Có bao nhiêu giáo viên có học hàm là “GS” hoặc “PGS”.
SELECT MAGV, HOCHAM, COUNT(*) SL
FROM GIAOVIEN
WHERE HOCHAM = 'GS' OR HOCHAM = 'PGS'
GROUP BY MAGV, HOCHAM

--21. Thống kê có bao nhiêu giáo viên có học vị là “CN”, “KS”, “Ths”, “TS”, “PTS” trong mỗi khoa.
SELECT MAGV, HOCVI, COUNT(*) SL
FROM GIAOVIEN
WHERE HOCVI IN ('CN', 'KS', 'ThS', 'TS', 'PTS')
GROUP BY MAGV, HOCVI

--UPDATE TS thành TSKH và PTS thành TS
UPDATE GIAOVIEN
SET HOCVI = 'TSKH'
WHERE HOCVI = 'TS'

UPDATE GIAOVIEN
SET HOCVI = 'TS'
WHERE HOCVI = 'PTS'

SELECT * FROM GIAOVIEN 
--Xem TSKH và TS là 1 thống kê số lượng học vị
SELECT HOCVI, COUNT(*) SL
FROM GIAOVIEN
WHERE HOCVI IN ('CN', 'KS', 'ThS')
GROUP BY HOCVI
UNION
SELECT HOCVI_TSPTS = 'TS&PTS', COUNT(*) SL
FROM GIAOVIEN
WHERE HOCVI IN ('TS', 'TSKH')

SELECT * FROM GIAOVIEN WHERE HOCVI IN ('TS', 'TSKH')
--22. Mỗi môn học thống kê số lượng học viên theo kết quả (đạt và không đạt).
SELECT TENMH, KQUA, COUNT(*) SL
FROM MONHOC MH JOIN KETQUATHI KQT ON MH.MAMH = KQT.MAMH
GROUP BY TENMH, KQUA

--23. Tìm giáo viên (mã giáo viên, họ tên) là giáo viên chủ nhiệm của một lớp, đồng thời dạy cho lớp đó ít nhất một môn học.
 SELECT GV.MAGV, HOTEN
 FROM GIAOVIEN GV JOIN LOP L ON GV.MAGV = L.MAGVCN
 WHERE GV.MAGV IN (SELECT MAGV 
					FROM GIANGDAY GD
					WHERE GD.MAGV = GV.MAGV AND GD.MALOP = L.MALOP)

SELECT GV.MAGV, HOTEN
 FROM GIAOVIEN GV JOIN LOP L ON GV.MAGV = L.MAGVCN
 WHERE GV.MAGV IN (
				SELECT MAGV
				FROM GIANGDAY
				WHERE GIANGDAY.MALOP = L.MALOP
				GROUP BY MAGV
				HAVING COUNT(*) > 1
				)

--24.
SELECT * 
FROM HOCVIEN JOIN LOP ON HOCVIEN.MAHV = LOP.TRGLOP
WHERE LOP.MALOP IN (SELECT MALOP FROM LOP WHERE SISO = (SELECT MAX(SISO) FROM LOP))

--25
