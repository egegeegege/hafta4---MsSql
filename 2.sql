-- CASE WHEN

-- Çalýþanlarý iþe giriþ tarihlerine göre eski,yeni çalýþan olarak tabloda gösterelim

select FirstName,LastName,HireDate,
case 
	when HireDate between '1994-01-01' and '1995-01-01' then 'Yeni Çalýþan'
	when HireDate between '1993-01-01' and '1994-01-01' then 'Eski Çalýþan'
	when HireDate between '1992-01-01' and '1993-01-01' then 'Çok Eski Çalýþan'
end as 'Durum'
from Employees

select FirstName,LastName,HireDate,'Durum'=
case 
	when HireDate between '1994-01-01' and '1995-01-01' then 'Yeni Çalýþan'
	when HireDate between '1993-01-01' and '1994-01-01' then 'Eski Çalýþan'
	when HireDate between '1992-01-01' and '1993-01-01' then 'Çok Eski Çalýþan'
end
from Employees
-- ülkeye göre kdv durumunu yazýnýz
select OrderID,ShipCountry,OrderDate,'KDV Durumu'= 
case
	when ShipCountry in('France') then 18
	when ShipCountry in('Germany') then 17
	when ShipCountry in('Brazil') then 16
	else 20 -- geri kalan tüm koþullar için
end
from Orders


select ProductName,'Category Name'=
case
	when CategoryID = 1 then 'Beverages'
	when CategoryID = 2 then 'Condiments'
	when CategoryID = 3 then 'Confections'
	when CategoryID = 4 then 'Dairy Products'
	when CategoryID = 5 then 'Grains/Cereals'
	when CategoryID = 6 then 'Meat/Poultry'
	when CategoryID = 7 then 'Produce'
	when CategoryID = 8 then 'Seafood'
end
from Products





