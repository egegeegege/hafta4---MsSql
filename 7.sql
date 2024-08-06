/* Stored Procedure (Prosedürler)
Fonksiyon yapýsý gibi çalýþýr. Parametre alýr.
Yaptýðýmýz iþleri tekrar tekrar yapmamýzý önler.
Performans açýsýndan çok hýzlýdýrlar.
Fonksiyonlar gibi geriye deðer döndürmez. Dýþarýya output olarak deðerler verebilir.

Taným
create proc sp_employee
as
begin
	-- yapacaðý iþi
end	


*/

create proc sp_GetEmployee
as
begin
	select * from Employees
end

exec sp_GetEmployee

-- employee tablosuna ekleme yapan procedure ü yazýn

create proc sp_InstertEmployee @ad varchar(max),@soyad varchar(max)
as
begin
	insert into Employees (FirstName,LastName) values (@ad,@soyad)
	select * from Employees
end

exec sp_InstertEmployee 'Ali','Demir'

create proc sp_InstertCustomGetEmployee @ad varchar(max),@soyad varchar(max)
as
begin
	insert into Employees (FirstName,LastName) values (@ad,@soyad)
	select * from Employees where FirstName = @ad
end

exec sp_InstertCustomGetEmployee 'Ayþe','Çelik'

-- employee tablosunda countrysi belirlediðimiz ülke olan personellerin countrysini güncelleyen
--- procedure
create proc sp_EmployeeCountryUpdate @country varchar(max),@updateCountry varchar(max)
as
begin
	update Employees set Country = @updateCountry where Country = @country
	select * from Employees
end

exec sp_EmployeeCountryUpdate 'UK','Ýngiltere'

-- employee tablosunda countrysi belirlediðimiz ülke var ise  countrysini güncelleyen yok ise böyle
-- bir ülke bulunamadý diyen procedure

create proc sp_EmployeeCountryUpdateIsset @country varchar(max),@updateCountry varchar(max)
as
begin
	if(not exists(select * from Employees where Country = @country))
	begin
		print 'Böyle bir Ülke bulunamadý'
	end
	else
	begin
		update Employees set Country = @updateCountry where Country = @country
		select * from Employees
	end
end

exec sp_EmployeeCountryUpdateIsset 'Ýngiltere','UK'

/* 
Product tablosunda productName i var olan bir kayýt eklemeye çalýþtýðýmýz zaten böyle bir ürün
mevcut uyarýsý veren eðer ayný isimde ürün yoksa ürünü ekleyen procedure


*/
create proc sp_ProductCreate @productName varchar(max)
as
begin
	if(exists(select * from Products where ProductName = @productName))
	begin
		print 'Böyle bir ürün mevcut'
	end
	else
	begin
		insert into Products (ProductName) values (@productName)
		select * from Products
	end	
end

exec sp_ProductCreate 'Iphone 15'

-- Procedure içinde hata ayýklama
create proc sp_divide(@a decimal,@b decimal,@c decimal output)
as
begin
	set @c = @a / @b
end

declare @geriyeDonenDeger decimal
exec sp_divide 10,0,@geriyeDonenDeger output
print @geriyeDonenDeger

-- Hata ayýklayalým

create proc sp_divide_error_handling(@a decimal,@b decimal,@c decimal output)
as
begin
	begin try
		set @c = @a / @b
	end try
	begin catch
			select
				ERROR_LINE() as HataSatiri,
				ERROR_MESSAGE() as HataMesaji,
				ERROR_NUMBER() as HataNumarasi,
				ERROR_PROCEDURE() as HataProsedürü,
				ERROR_SEVERITY() as HataSiddeti,
				ERROR_STATE() as HataDurumu
	end catch
end

declare @geriyeDonenDeger decimal
exec sp_divide_error_handling 10,0,@geriyeDonenDeger output
print @geriyeDonenDeger

-- Ödev => Ýsmini belirttiðimiz kategori altýnda kaç adet ürün olduðunu veren procedure ü yazýn.

select * from Products
select * from Categories

-- Ödev => Çalýþanlarýn yaþlarýný hesaplayan procedure ü yazýn
-- Ödev => Ürüne göre verilen sipariþlerin Quantitylerini gruplayýn. Group by
