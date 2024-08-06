--1
-- Çalýþanlar tablosundaki çalýþanlarýn yaþlarý 70 ten büyük olanlarý Emeklilik yaþýnýz geldi 70 ten küçük olanlarý
-- ise Emekli olamadýnýz uyarýsýný fonksiyon ve if kavramlarýný kullanarak yazdýrýnýz.

create function fnc_EmployeeEmekli(@id int)
returns varchar(max)
as
begin
	declare @yas int
	select @yas = year(getdate()) - year(BirthDate) from Employees where EmployeeID = @id
	if(@yas>=70)
		begin
			return 'Emekli oldunuz.'
		end
	else
		begin
			return 'Emekli olamadýnýz'
		end
	return ''
end

select dbo.fnc_EmployeeEmekli(4)

select year(getDate()) - year(BirthDate) , EmployeeID, FirstName from Employees

--2
-- Category Id si 1 olan ürünlerin ortalama fiyatý 100 den büyük ise Ortalama yüksek 
-- Deðil ise Ortalama düþük yazan
-- sorguyu yazýnýz. Fonksiyon, if , aggregate
create function fnc_OrtalamaBilgisi(@id int)
returns varchar(max)
as
begin
	declare @ortalama int
	select @ortalama  = avg(UnitPrice) from Products where CategoryID = @id
	if(@ortalama>=100)
		begin
			return 'Ortalama yüksek'
		end
	else
		begin
			return 'Ortalama düþük'
		end
	return ''
end


print dbo.fnc_OrtalamaBilgisi(1)
