--DATABADE(veri tabanı)oluşturma
create database Mehmet;

--DDL - DATA DEFINITION LANG.
--CREATE - TABLO OLUŞTURMA
CREATE TABLE ogrenciler5
(
ogrenci_no char(7),--uzunlugunu bildiğimiz stringler için char kullanılır
isim varchar(20),  --uzunlugunu bilmediğimiz stringler için varchar kullanılır
soyisim varchar(25),
not_ort real,-- Ondalıklı sayılar için kullanılır(Double gibi)
kayit_tarih date);

--VAROLAN TABLODAN YENİ BİR TABLO OLUŞTURMA
CREATE TABLE ogrenci_notlari1
AS -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler;

-- DML - DATA MANUPULATION LANG.
-- INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler2 VALUES ('1234567','Said','ILHAN',85.5,now());
INSERT INTO ogrenciler2 VALUES ('1234567','Said','ILHAN',85.5,'2020-12-11');

-- BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('Erol','Evren');


-- DQL - DATA QUERY LANG.
-- SELECT
select * FROM ogrenciler2; -- Burdaki * sembolü herşeyi anlamındadır


























































