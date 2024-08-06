/* Stored Procedure (Prosed�rler)
Fonksiyon yap�s� gibi �al���r. Parametre al�r.
Yapt���m�z i�leri tekrar tekrar yapmam�z� �nler.
Performans a��s�ndan �ok h�zl�d�rlar.
Fonksiyonlar gibi geriye de�er d�nd�rmez. D��ar�ya output olarak de�erler verebilir.

Tan�m
create proc sp_employee
as
begin
	-- yapaca�� i�i
end	


*/

create proc sp_GetEmployee
as
begin
	select * from Employees
end

exec sp_GetEmployee

-- employee tablosuna ekleme yapan procedure � yaz�n

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

exec sp_InstertCustomGetEmployee 'Ay�e','�elik'

-- employee tablosunda countrysi belirledi�imiz �lke olan personellerin countrysini g�ncelleyen
--- procedure
create proc sp_EmployeeCountryUpdate @country varchar(max),@updateCountry varchar(max)
as
begin
	update Employees set Country = @updateCountry where Country = @country
	select * from Employees
end

exec sp_EmployeeCountryUpdate 'UK','�ngiltere'

-- employee tablosunda countrysi belirledi�imiz �lke var ise  countrysini g�ncelleyen yok ise b�yle
-- bir �lke bulunamad� diyen procedure

create proc sp_EmployeeCountryUpdateIsset @country varchar(max),@updateCountry varchar(max)
as
begin
	if(not exists(select * from Employees where Country = @country))
	begin
		print 'B�yle bir �lke bulunamad�'
	end
	else
	begin
		update Employees set Country = @updateCountry where Country = @country
		select * from Employees
	end
end

exec sp_EmployeeCountryUpdateIsset '�ngiltere','UK'

/* 
Product tablosunda productName i var olan bir kay�t eklemeye �al��t���m�z zaten b�yle bir �r�n
mevcut uyar�s� veren e�er ayn� isimde �r�n yoksa �r�n� ekleyen procedure


*/
create proc sp_ProductCreate @productName varchar(max)
as
begin
	if(exists(select * from Products where ProductName = @productName))
	begin
		print 'B�yle bir �r�n mevcut'
	end
	else
	begin
		insert into Products (ProductName) values (@productName)
		select * from Products
	end	
end

exec sp_ProductCreate 'Iphone 15'

-- Procedure i�inde hata ay�klama
create proc sp_divide(@a decimal,@b decimal,@c decimal output)
as
begin
	set @c = @a / @b
end

declare @geriyeDonenDeger decimal
exec sp_divide 10,0,@geriyeDonenDeger output
print @geriyeDonenDeger

-- Hata ay�klayal�m

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
				ERROR_PROCEDURE() as HataProsed�r�,
				ERROR_SEVERITY() as HataSiddeti,
				ERROR_STATE() as HataDurumu
	end catch
end

declare @geriyeDonenDeger decimal
exec sp_divide_error_handling 10,0,@geriyeDonenDeger output
print @geriyeDonenDeger

-- �dev => �smini belirtti�imiz kategori alt�nda ka� adet �r�n oldu�unu veren procedure � yaz�n.

select * from Products
select * from Categories

-- �dev => �al��anlar�n ya�lar�n� hesaplayan procedure � yaz�n
-- �dev => �r�ne g�re verilen sipari�lerin Quantitylerini gruplay�n. Group by
