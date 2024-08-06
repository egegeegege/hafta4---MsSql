--1
-- �al��anlar tablosundaki �al��anlar�n ya�lar� 70 ten b�y�k olanlar� Emeklilik ya��n�z geldi 70 ten k���k olanlar�
-- ise Emekli olamad�n�z uyar�s�n� fonksiyon ve if kavramlar�n� kullanarak yazd�r�n�z.

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
			return 'Emekli olamad�n�z'
		end
	return ''
end

select dbo.fnc_EmployeeEmekli(4)

select year(getDate()) - year(BirthDate) , EmployeeID, FirstName from Employees

--2
-- Category Id si 1 olan �r�nlerin ortalama fiyat� 100 den b�y�k ise Ortalama y�ksek 
-- De�il ise Ortalama d���k yazan
-- sorguyu yaz�n�z. Fonksiyon, if , aggregate
create function fnc_OrtalamaBilgisi(@id int)
returns varchar(max)
as
begin
	declare @ortalama int
	select @ortalama  = avg(UnitPrice) from Products where CategoryID = @id
	if(@ortalama>=100)
		begin
			return 'Ortalama y�ksek'
		end
	else
		begin
			return 'Ortalama d���k'
		end
	return ''
end


print dbo.fnc_OrtalamaBilgisi(1)
