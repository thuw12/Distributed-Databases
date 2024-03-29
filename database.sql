ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MM-YYYY HH24:MI:SS'
SET SERVEROUTPUT ON

CREATE TABLE KHACHSAN (
MAKS varchar2(8) PRIMARY KEY, 
 TENKS varchar2(20), 
THANHPHO varchar2(20),
 SDT number
);
CREATE TABLE PHONGBAN
(MAPB varchar2(8) PRIMARY KEY, 
 TENPB varchar2(20)
);
CREATE TABLE CHUCVU
(MACV varchar2(8) PRIMARY KEY, 
TENCV varchar2(20)
);
CREATE TABLE NHANVIEN
(MANV varchar2(8) PRIMARY KEY, 
TENNV varchar2(20), 
MACV varchar2(8),
MAPB varchar2(8),
MAKS varchar2(8),
NGAYBATDAU date,
NGAYKETTHUC date,
TRANGTHAI number,
LUONG number
);
CREATE TABLE LOAIPHONG
(MALP varchar2(8) PRIMARY KEY, 
GIA number,
MOTA varchar2(50)
);
CREATE TABLE PHONG
(MAP varchar2(8) PRIMARY KEY, 
SOPHONG number,
MALP varchar2(8),
MAKS varchar2(8),
MOTA varchar2(50)
);
CREATE TABLE KHACHHANG
(MAKH varchar2(8) PRIMARY KEY, 
TENKH varchar2(20), 
CMND varchar2(10),
SODIENTHOAI varchar2(10),
QUOCTICH varchar2(20),
GIOITINH varchar2(5)
);
CREATE TABLE DATPHONG
(MADP varchar2(8) PRIMARY KEY, 
MAKS varchar2(8),
MAKH varchar2(8), 
MAP varchar2(8),
NGAYBATDAU date,
NGAYKETTHUC date,
MANV varchar2(8)
);
CREATE TABLE HOADON
(MAHD varchar2(8) PRIMARY KEY, 
MADP varchar2(8),
NGHD date,
THANHTIEN  number
);

--Kh�a Ngo?i 
ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_CV FOREIGN KEY (MACV) 
REFERENCES CHUCVU(MACV);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_PB FOREIGN KEY (MAPB) 
REFERENCES PHONGBAN(MAPB);

ALTER TABLE NHANVIEN
ADD CONSTRAINT FK_NV_KS FOREIGN KEY (MAKS) 
REFERENCES KHACHSAN(MAKS);
----------------------------
ALTER TABLE PHONG
ADD CONSTRAINT FK_P_KS FOREIGN KEY (MAKS) 
REFERENCES KHACHSAN(MAKS);


ALTER TABLE PHONG
ADD CONSTRAINT FK_P_LP FOREIGN KEY (MALP) 
REFERENCES LOAIPHONG(MALP);
------------------------------------
ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_KH FOREIGN KEY (MAKH) 
REFERENCES KHACHHANG(MAKH);

ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_P FOREIGN KEY (MAP) 
REFERENCES PHONG(MAP);

ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_NV FOREIGN KEY (MANV) 
REFERENCES NHANVIEN(MANV);

ALTER TABLE DATPHONG
ADD CONSTRAINT FK_DP_KS FOREIGN KEY (MAKS) 
REFERENCES KHACHSAN(MAKS);

-----------------------------------
ALTER TABLE HOADON
ADD CONSTRAINT FK_HD_DP FOREIGN KEY (MADP) 
REFERENCES DATPHONG(MADP);

-----------------------------------

--KHACHSAN
INSERT INTO KHACHSAN VALUES ('KS1', 'Hang Dieu', 'TP  Ha Giang', '123456789'); 
INSERT INTO KHACHSAN VALUES ('KS2', 'Ma Vi', 'TP Dien Bien Phu', '102345678'); 
INSERT INTO KHACHSAN VALUES ('KS3', 'Phuc Kien', 'TP Thanh Hoa', '987654321'); 
--PHONGBAN
INSERT INTO PHONGBAN VALUES ('PB1', 'Phong Hanh Chinh'); 
INSERT INTO PHONGBAN VALUES ('PB2', 'Phong Ke Toan'); 
INSERT INTO PHONGBAN VALUES ('PB3', 'Phong CSKH');

--CHUCVU
INSERT INTO CHUCVU VALUES ( 'CV1', 'Quan Ly'); 
INSERT INTO CHUCVU VALUES ( 'CV2', 'Le Tan'); 
INSERT INTO CHUCVU VALUES ( 'CV3', 'Nhan Vien'); 

--NHANVIEN
INSERT INTO NHANVIEN VALUES ('NV1', 'Cam Tu', 'CV2', 'PB3', 'KS1', '10/10/2010', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV2', 'Huong Duong', 'CV2', 'PB3', 'KS1', '25/08/2018', NULL,'0', '20000000'); 
INSERT INTO NHANVIEN VALUES ('NV4', 'Hong Cam', 'CV2', 'PB3', 'KS1', '29/10/2015', NULL, '0', '20000000'); 
INSERT INTO NHANVIEN VALUES ('NV8', 'Dien Vi', 'CV2', 'PB3', 'KS1', '08/12/2008', NULL, '0', '15000000'); 
INSERT INTO NHANVIEN VALUES ('NV11', 'Tu Dinh Huong', 'CV2', 'PB3', 'KS1', '14/03/2018', NULL, '0', '15000000'); 
INSERT INTO NHANVIEN VALUES ('NV12', 'Phong Lan', 'CV2', 'PB3', 'KS1', '15/03/2013', NULL, '0', '15000000'); 
INSERT INTO NHANVIEN VALUES ('NV13', 'Lay On', 'CV2', 'PB3', 'KS1', '23/07/2012', NULL,'0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV18', 'Bo Cong Anh', 'CV2', 'PB3', 'KS1', '27/07/2014', '14/10/2016', '1', '20000000');
INSERT INTO NHANVIEN VALUES ('NV21', 'Anh Dao', 'CV2', 'PB3', 'KS1', '25/09/2016', '10/03/2020', '1', '20000000');
INSERT INTO NHANVIEN VALUES ('NV22', 'Thuy Linh', 'CV1', 'PB1', 'KS1', '27/07/2014', '14/10/2016', '1', '20000000');
INSERT INTO NHANVIEN VALUES ('NV23', 'Ly Ly', 'CV1', 'PB1', 'KS1', '25/09/2016', '10/03/2020', '1', '20000000');


INSERT INTO NHANVIEN VALUES ('NV10', 'Thuy Tien', 'CV2', 'PB3', 'KS2', '22/2/2012', NULL, '0', '15000000'); 
INSERT INTO NHANVIEN VALUES ('NV5', 'Lan Ho Diep', 'CV2', 'PB3', 'KS2', '08/02/2020', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV6', 'Cam Chuong', 'CV2', 'PB3', 'KS2', '17/7/2017', '05/05/2018', '1', '20000000'); 
INSERT INTO NHANVIEN VALUES ('NV14', 'Trang Nguyen', 'CV2', 'PB3', 'KS2', '12/11/2016', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV16', 'Moc Hoa Mi', 'CV2', 'PB3', 'KS2', '08/08/2018', NULL, '0', '20000000'); 
INSERT INTO NHANVIEN VALUES ('NV9', 'Thien Dieu', 'CV2', 'PB3', 'KS2', '18/05/2013', '13/01/2018', '1', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV3', 'Ly Ly', 'CV2', 'PB3', 'KS2', '01/09/2012', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV7', 'Cat Tuong', 'CV2', 'PB3', 'KS2', '14/06/2016', NULL, '0', '15000000'); 

INSERT INTO NHANVIEN VALUES ('NV15', 'Mao Luong', 'CV1', 'PB1', 'KS2', '23/03/2014', '08/12/2020', '1', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV17', 'Bi Ngan', 'CV1', 'PB2', 'KS2', '25/12/2014', NULL, '0', '20000000');
INSERT INTO NHANVIEN VALUES ('NV19', 'Anh Tuc', 'CV1', 'PB3', 'KS2', '22/08/2015', NULL, '0', '30000000'); 
INSERT INTO NHANVIEN VALUES ('NV20', 'Da Lan Huong', 'CV3', 'PB3', 'KS2', '26/06/2017', NULL, '0', '20000000');

--LOAIPHONG
INSERT INTO LOAIPHONG VALUES ( 'LP1', '130000', 'Don'); 
INSERT INTO LOAIPHONG VALUES ( 'LP2', '200000', 'Doi'); 
INSERT INTO LOAIPHONG VALUES ( 'LP3', '280000', 'Gia Dinh'); 

--PHONG
INSERT INTO PHONG VALUES ( 'P1', '110', 'LP1', 'KS1', 'Tang 1 co view bien'); 
INSERT INTO PHONG VALUES ( 'P2', '120', 'LP2', 'KS1', 'Tang 1 co view nui'); 
INSERT INTO PHONG VALUES ( 'P3', '210', 'LP3', 'KS1', 'Tang 2 khong co view'); 
INSERT INTO PHONG VALUES ( 'P4', '120', 'LP1', 'KS1', 'Tang 1 co view bien'); 
INSERT INTO PHONG VALUES ( 'P5', '130', 'LP2', 'KS1', 'Tang 1 co view nui'); 
INSERT INTO PHONG VALUES ( 'P6', '220', 'LP3', 'KS1', 'Tang 2 khong co view'); 
INSERT INTO PHONG VALUES ( 'P7', '130', 'LP1', 'KS1', 'Tang 1 co view bien'); 
INSERT INTO PHONG VALUES ( 'P8', '130', 'LP2', 'KS1', 'Tang 1 co view nui'); 
INSERT INTO PHONG VALUES ( 'P9', '230', 'LP3', 'KS1', 'Tang 2 khong co view'); 


INSERT INTO PHONG VALUES ( 'P10', '201', 'LP2', 'KS2', 'Tang 1 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P11', '202', 'LP1', 'KS2', 'Tang 2 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P12', '203', 'LP1', 'KS2', 'Tang 2 co view bien'); 
INSERT INTO PHONG VALUES ( 'P13', '301', 'LP3', 'KS2', 'Tang 2 co view bien');
INSERT INTO PHONG VALUES ( 'P14', '302', 'LP2', 'KS2', 'Tang 1 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P15', '303', 'LP1', 'KS2', 'Tang 2 khong co view bien'); 
INSERT INTO PHONG VALUES ( 'P16', '304', 'LP1', 'KS2', 'Tang 2 co view bien'); 
INSERT INTO PHONG VALUES ( 'P17', '401', 'LP3', 'KS2', 'Tang 2 co view bien');
INSERT INTO PHONG VALUES ( 'P18', '402', 'LP1', 'KS2', 'Tang 2 co view bien'); 
INSERT INTO PHONG VALUES ( 'P19', '403', 'LP3', 'KS2', 'Tang 2 co view bien');


--KHACHHANG
INSERT INTO KHACHHANG VALUES ('KH1', 'Cam Thao', '161813584', '014785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH2', 'Chi Tu', '161223584', '094785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH3', 'Can Khuong', '161848584', '014735236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH4', 'Boi Mau', '251813584', '014715236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH5', 'Bach Dau Khau', '261813584', '014785235', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH6', 'Bach Thuoc', '271813584', '015785236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH7', 'Bac Ha', '301813584', '014782236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH8', 'Ba Tu Nhan', '311813584', '014780236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH9', 'Anh Tuc', '501813584', '017785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH10', 'An Tuc Huong', '131813584', '014755236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH11', 'Simpor', '5518135', '014285236', 'Brunei', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH12', 'A Giao', '481413584', '014785231', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH13', 'Do Trong', '265313584', '014185236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH14', 'Dinh Huong', '255313584', '014785636', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH15', 'Y Di', '495313584', '0146785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH16', 'Xa Can', '333113584', '0147852936', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH17', ' Poppy', '2447890', '0147085236', 'Bhutan', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH18', 'Vuong Bat Luu Hanh', '555313584', '014485236', 'Viet Nam', 'Nam'); 
INSERT INTO KHACHHANG VALUES ('KH19', 'Tan Di Hoa', '445213584', '044785236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH20', 'Tran Chau', '165641584', '014285236', 'Viet Nam', 'Nu'); 
INSERT INTO KHACHHANG VALUES ('KH21', 'Bach Quyet Minh', '161812221', '014785036', 'Viet Nam', 'Nam'); 

--DATPHONG
INSERT INTO DATPHONG VALUES ('DP1', 'KS1','KH12', 'P2', '20/10/2021', '22/10/2021', 'NV1'); 
INSERT INTO DATPHONG VALUES ('DP2', 'KS1','KH10', 'P3', '16/09/2021', '20/09/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP3', 'KS1', 'KH20', 'P2', '10/02/2021', '11/02/2021', 'NV12'); 
INSERT INTO DATPHONG VALUES ('DP4', 'KS1', 'KH8', 'P3', '29/04/2021', '30/4/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP5', 'KS1', 'KH5', 'P2', '25/12/2021', '27/12/2021', 'NV13'); 
INSERT INTO DATPHONG VALUES ('DP11', 'KS1', 'KH11', 'P3', '20/11/2021', '24/11/2021', 'NV11'); 
INSERT INTO DATPHONG VALUES ('DP12', 'KS1', 'KH1', 'P3', '20/11/2021', '21/11/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP13', 'KS1', 'KH15', 'P2', '25/11/2021', '28/11/2021', 'NV21'); 
INSERT INTO DATPHONG VALUES ('DP14', 'KS1', 'KH13', 'P1', '20/9/2021', '21/9/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP22', 'KS1', 'KH1', 'P1', '20/12/2021', '21/12/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP23', 'KS1', 'KH8', 'P2', '20/9/2021', '21/9/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP24', 'KS1', 'KH10', 'P3', '20/9/2021', '21/9/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP25', 'KS1', 'KH1', 'P1', '20/12/2021', '21/12/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP26', 'KS1', 'KH8', 'P2', '20/9/2021', '21/9/2021', 'NV12'); 
INSERT INTO DATPHONG VALUES ('DP27', 'KS1', 'KH10', 'P3', '20/9/2021', '21/9/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP28', 'KS1', 'KH1', 'P4', '20/12/2021', '21/12/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP29', 'KS1', 'KH10', 'P4', '20/11/2021', '21/11/2021', 'NV2'); 


INSERT INTO DATPHONG VALUES ('DP6', 'KS2', 'KH10', 'P11', '05/01/2021', '08/01/2021', 'NV10'); 
INSERT INTO DATPHONG VALUES ('DP7', 'KS2', 'KH21', 'P11', '24/07/2021', '26/07/2021', 'NV5'); 
INSERT INTO DATPHONG VALUES ('DP8', 'KS2', 'KH14', 'P11', '13/10/2021', '15/10/2021', 'NV6'); 
INSERT INTO DATPHONG VALUES ('DP9', 'KS2', 'KH7', 'P13', '11/06/2021', '14/06/2021', 'NV14'); 
INSERT INTO DATPHONG VALUES ('DP15', 'KS2', 'KH16', 'P11', '25/10/2021', '28/10/2021', 'NV20');

INSERT INTO DATPHONG VALUES ('DP17', 'KS2', 'KH4', 'P10', '16/06/2021', '18/06/2021', 'NV10'); 
INSERT INTO DATPHONG VALUES ('DP21', 'KS2', 'KH6', 'P12', '20/11/2021', '25/11/2021', 'NV6'); 
INSERT INTO DATPHONG VALUES ('DP10', 'KS2', 'KH3', 'P13', '05/12/2021', '06/12/2021', 'NV6'); 
INSERT INTO DATPHONG VALUES ('DP18', 'KS2', 'KH9', 'P13', '10/09/2021', '13/09/2021', 'NV3'); 
INSERT INTO DATPHONG VALUES ('DP20', 'KS2', 'KH17', 'P11', '30/08/2021', '02/09/2021', 'NV7'); 
INSERT INTO DATPHONG VALUES ('DP16', 'KS2', 'KH18', 'P13', '29/05/2021', '30/05/2021', 'NV9'); 
INSERT INTO DATPHONG VALUES ('DP19', 'KS2', 'KH19', 'P10', '16/12/2021', '18/12/2021', 'NV7');
----------------------------
INSERT INTO DATPHONG VALUES ('DP30', 'KS2','KH12', 'P11', '20/10/2021', '22/10/2021', 'NV1'); 
INSERT INTO DATPHONG VALUES ('DP31', 'KS2','KH10', 'P11', '16/09/2021', '20/09/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP32', 'KS2', 'KH20', 'P11', '10/02/2021', '11/02/2021', 'NV12'); 
INSERT INTO DATPHONG VALUES ('DP33', 'KS2', 'KH8', 'P11', '29/04/2021', '30/4/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP34', 'KS2', 'KH5', 'P11', '25/12/2021', '27/12/2021', 'NV13'); 
INSERT INTO DATPHONG VALUES ('DP35', 'KS2', 'KH11', 'P11', '20/11/2021', '24/11/2021', 'NV11'); 
INSERT INTO DATPHONG VALUES ('DP36', 'KS2', 'KH1', 'P12', '20/11/2021', '21/11/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP37', 'KS2', 'KH15', 'P11', '25/11/2021', '28/11/2021', 'NV21'); 
INSERT INTO DATPHONG VALUES ('DP38', 'KS2', 'KH13', 'P12', '20/9/2021', '21/9/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP39', 'KS2', 'KH1', 'P11', '20/12/2021', '21/12/2021', 'NV2');

INSERT INTO DATPHONG VALUES ('DP40', 'KS2','KH12', 'P15', '20/10/2021', '22/10/2021', 'NV1'); 
INSERT INTO DATPHONG VALUES ('DP41', 'KS2','KH10', 'P15', '16/09/2021', '20/09/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP42', 'KS2', 'KH20', 'P15', '10/02/2021', '11/02/2021', 'NV12'); 
INSERT INTO DATPHONG VALUES ('DP43', 'KS2', 'KH8', 'P15', '29/04/2021', '30/4/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP44', 'KS2', 'KH5', 'P15', '25/12/2021', '27/12/2021', 'NV13'); 
INSERT INTO DATPHONG VALUES ('DP45', 'KS2', 'KH11', 'P15', '20/11/2021', '24/11/2021', 'NV11'); 
INSERT INTO DATPHONG VALUES ('DP46', 'KS2', 'KH1', 'P16', '20/11/2021', '21/11/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP47', 'KS2', 'KH15', 'P16', '25/11/2021', '28/11/2021', 'NV21'); 
INSERT INTO DATPHONG VALUES ('DP48', 'KS2', 'KH13', 'P16', '20/9/2021', '21/9/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP49', 'KS2', 'KH1', 'P16', '20/12/2021', '21/12/2021', 'NV2'); 

INSERT INTO DATPHONG VALUES ('DP50', 'KS2','KH12', 'P16', '20/10/2021', '22/10/2021', 'NV1'); 
INSERT INTO DATPHONG VALUES ('DP51', 'KS2','KH10', 'P16', '16/09/2021', '20/09/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP52', 'KS2', 'KH20', 'P16', '10/02/2021', '11/02/2021', 'NV12'); 
INSERT INTO DATPHONG VALUES ('DP53', 'KS2', 'KH8', 'P16', '29/04/2021', '30/4/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP54', 'KS2', 'KH5', 'P16', '25/12/2021', '27/12/2021', 'NV13'); 
INSERT INTO DATPHONG VALUES ('DP55', 'KS2', 'KH11', 'P16', '20/11/2021', '24/11/2021', 'NV11'); 
INSERT INTO DATPHONG VALUES ('DP56', 'KS2', 'KH1', 'P15', '20/11/2021', '21/11/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP57', 'KS2', 'KH15', 'P15', '25/11/2021', '28/11/2021', 'NV21'); 
INSERT INTO DATPHONG VALUES ('DP58', 'KS2', 'KH13', 'P15', '20/9/2021', '21/9/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP59', 'KS2', 'KH1', 'P15', '20/12/2021', '21/12/2021', 'NV2'); 

INSERT INTO DATPHONG VALUES ('DP60', 'KS2','KH12', 'P12', '20/10/2021', '22/10/2021', 'NV1'); 
INSERT INTO DATPHONG VALUES ('DP61', 'KS2','KH10', 'P12', '16/09/2021', '20/09/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP62', 'KS2', 'KH20', 'P12', '10/02/2021', '11/02/2021', 'NV12'); 
INSERT INTO DATPHONG VALUES ('DP63', 'KS2', 'KH8', 'P12', '29/04/2021', '30/4/2021', 'NV8'); 
INSERT INTO DATPHONG VALUES ('DP64', 'KS2', 'KH5', 'P12', '25/12/2021', '27/12/2021', 'NV13'); 
INSERT INTO DATPHONG VALUES ('DP65', 'KS2', 'KH11', 'P12', '20/11/2021', '24/11/2021', 'NV11'); 
INSERT INTO DATPHONG VALUES ('DP66', 'KS2', 'KH1', 'P18', '20/11/2021', '21/11/2021', 'NV4'); 
INSERT INTO DATPHONG VALUES ('DP67', 'KS2', 'KH15', 'P12', '25/11/2021', '28/11/2021', 'NV21'); 
INSERT INTO DATPHONG VALUES ('DP68', 'KS2', 'KH13', 'P18', '20/9/2021', '21/9/2021', 'NV2'); 
INSERT INTO DATPHONG VALUES ('DP69', 'KS2', 'KH1', 'P12', '20/12/2021', '21/12/2021', 'NV2');


select * from phong where malp='LP1' and maks='KS2'
--HOADON
INSERT INTO HOADON VALUES ('HD6', 'DP6',  '05/01/2021', '560000'); 
INSERT INTO HOADON VALUES ('HD7', 'DP7',  '24/07/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD8', 'DP8',  '13/10/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD9', 'DP9',  '11/06/2021', '390000'); 
INSERT INTO HOADON VALUES ('HD15', 'DP15',  '25/10/2021', '390000'); 

INSERT INTO HOADON VALUES ('HD17', 'DP17',  '16/06/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD21', 'DP21',  '03/01/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD10', 'DP10',  '22/03/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD18', 'DP18',  '10/09/2021', '560000'); 
INSERT INTO HOADON VALUES ('HD20', 'DP20',  '30/08/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD16', 'DP16',  '29/05/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD19', 'DP19',  '16/12/2021', '400000');

INSERT INTO HOADON VALUES ('HD1', 'DP1',  '20/10/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD2', 'DP2',  '16/09/2021', '560000'); 
INSERT INTO HOADON VALUES ('HD3', 'DP3',  '10/02/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD4', 'DP4',  '29/04/2021', '260000'); 
INSERT INTO HOADON VALUES ('HD5', 'DP5',  '25/12/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD11', 'DP11',  '20/11/2021', '1120000'); 
INSERT INTO HOADON VALUES ('HD12', 'DP12',  '20/11/2021', '280000'); 
INSERT INTO HOADON VALUES ('HD13', 'DP13',  '25/11/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD14', 'DP14',  '20/09/2021', '130000'); 
INSERT INTO HOADON VALUES ('HD26', 'DP26',  '20/09/2021', '300000'); 
INSERT INTO HOADON VALUES ('HD27', 'DP27',  '20/09/2021', '400000'); 
INSERT INTO HOADON VALUES ('HD28', 'DP28',  '21/11/2021', '220000'); 
INSERT INTO HOADON VALUES ('HD29', 'DP29',  '20/10/2021', '360000');

