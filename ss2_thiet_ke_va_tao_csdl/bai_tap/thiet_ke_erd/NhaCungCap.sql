DROP DATABASE IF EXISTS quan_li_don_hang;
CREATE DATABASE quan_li_don_hang;
USE quan_li_don_hang;
CREATE TABLE nha_cung_cap
(
    ma_ncc  int AUTO_INCREMENT NOT NULL,
    ten_ncc varchar(40)        NOT NULL,
    dia_chi varchar(80)        NOT NULL,
    PRIMARY KEY (ma_ncc)
);

CREATE TABLE so_dien_thoai
(
    so_dien_thoai varchar(12),
    ma_ncc        int,
    PRIMARY KEY (so_dien_thoai),
    FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap (ma_ncc)
);

CREATE TABLE don_dat_hang
(
    so_don_hang   int AUTO_INCREMENT NOT NULL,
    ngay_don_hang datetime,
    ma_ncc        int,
    PRIMARY KEY (so_don_hang),
    FOREIGN KEY (ma_ncc) REFERENCES nha_cung_cap (ma_ncc)
);
CREATE TABLE vat_tu
(
    ma_vat_tu  int AUTO_INCREMENT NOT NULL,
    ten_vat_tu varchar(40)        NOT NULL,
    PRIMARY KEY (ma_vat_tu)
);

CREATE TABLE phieu_xuat
(
    so_phieu_xuat int AUTO_INCREMENT NOT NULL,
    ngay_xuat     datetime,
    PRIMARY KEY (so_phieu_xuat)
);

CREATE TABLE phieu_nhap
(
    so_phieu_nhap int AUTO_INCREMENT NOT NULL,
    ngay_nhap     datetime,
    PRIMARY KEY (so_phieu_nhap)
);

CREATE TABLE chi_tiet_don_dat_hang
(
    so_don_hang int,
    ma_vat_tu   int,
    PRIMARY KEY (so_don_hang, ma_vat_tu),
    FOREIGN KEY (so_don_hang) REFERENCES don_dat_hang (so_don_hang),
    FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu)
);

CREATE TABLE chi_tiet_phieu_nhap
(
    ma_vat_tu     int,
    so_phieu_nhap int,
    don_gia_nhap  double NOT NULL,
    so_luong_nhap int    NOT NULL,
    FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_phieu_nhap) REFERENCES phieu_nhap (so_phieu_nhap),
    PRIMARY KEY (ma_vat_tu, so_phieu_nhap)

);

CREATE TABLE chi_tiet_phieu_xuat
(
    ma_vat_tu     int,
    so_phieu_xuat int,
    don_gia_xuat  double NOT NULL,
    so_luong_xuat int    NOT NULL,
    FOREIGN KEY (ma_vat_tu) REFERENCES vat_tu (ma_vat_tu),
    FOREIGN KEY (so_phieu_xuat) REFERENCES phieu_xuat (so_phieu_xuat),
    PRIMARY KEY (ma_vat_tu, so_phieu_xuat)
);
