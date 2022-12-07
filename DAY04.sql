--ALIASES
CREATE TABLE calisanlar3 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );

INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar3

--Eger iki sütunun verilerini birleştirmek istersek concet sembolu || kullanırız
select calisan_id as id, calisan_isim || calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3

--arada boşluk istersen
select calisan_id as id, calisan_isim ||' '|| calisan_dogdugu_sehir as calisan_bilgisi from calisanlar3

--2.yol
select calisan_id as id,concat (calisan_isim, calisan_dogdugu_sehir) as calisan_bilgisi from calisanlar3


--IS NULL CONDITION

CREATE TABLE insanlar1
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);
INSERT INTO insanlar1 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar1 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar1 VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar1 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar1 (ssn, adres) VALUES(567890123, 'Denizli');

SELECT * FROM insanlar1

--Name sutununda null olan değerleri listeleyelim

SELECT name FROM insanlar1 WHERE name is null

--Insanlar tablosunda sadece null olmayan değerleri listeleyiniz

SELECT name FROM insanlar1 WHERE name IS NOT NULL

--Insanlar tablosunda null deger almıs verileri NO NAME OLARAK DEĞİŞTİRİNİZ

UPDATE insanlar1
SET name='No Name'
WHERE name is null;

--ORDER BY CLAUSE
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar ASC
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

CREATE TABLE insanlar2
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);

INSERT INTO insanlar2 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar2 VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar2 VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar2 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar2 VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar2 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar2

--Insanlar tablosundaki datalari adres’e gore siralayin

SELECT * FROM insanlar2 ORDER BY adres;
SELECT * FROM insanlar2 ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin

SELECT * FROM insanlar2 WHERE isim='Mine' ORDER BY ssn;

--NOT : Order By komutundan sonra field ismi yerine field numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin

SELECT * FROM insanlar2 WHERE soyisim='Bulut' ORDER BY 2;
 
--ORDER BY field_name DESC CLAUSE

--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin

SELECT * FROM insanlar2 ORDER BY ssn DESC;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin

SELECT * FROM insanlar2 ORDER BY isim ASC, soyisim DESC;

--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
   Eger sutun uzunluguna göre sıralamak istersek LENGTH komutu kullanırız
   ve yine uzunlugu buyukten kucuge sıralamak istersek sonuna DESC komutunu ekleriz
*/

SELECT isim,soyisim FROM insanlar2 ORDER BY LENGTH (soyisim);

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız

SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar2 ORDER BY LENGTH(isim||soyisim);

--2.yol:

SELECT CONCAT (isim, ' ' , soyisim) AS isim_soyisim FROM insanlar2 ORDER BY LENGTH(isim)+LENGTH(soyisim);

--diğer yollar

SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar2 ORDER BY LENGTH (isim)+LENGTH (soyisim)

SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar2 ORDER BY LENGTH (concat(isim,soyisim))

--GROUP BY CLAUSE

CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2);
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3);
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5);
INSERT INTO manav VALUES( 'Ali', 'Armut', 2);
INSERT INTO manav VALUES( 'Veli', 'Elma', 3);
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

select * from manav

-- Isme gore alinan toplam urunleri bulun 

SELECT isim, SUM(urun_miktar) AS Alinan_Toplam_Meyve FROM manav
GROUP BY isim;

-- Isme gore alinan toplam urunleri bulun ve urunleri buyukten kucuge listeleyiniz

SELECT isim,sum(urun_miktar) AS aldığı_toplam_urun FROM manav
GROUP BY isim
ORDER BY aldığı_toplam_urun DESC;

--Urun ismine gore urunu alan toplam kisi sayisi

SELECT urun_adi, COUNT(isim) AS Urunu_Alan_Kisi_Sayisi 
FROM manav
GROUP BY urun_adi;


















