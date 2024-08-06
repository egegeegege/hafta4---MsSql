-- Union (Birleþtirme)
-- Joine benzer fakat joinin yaptýðý iþi yapmaz.
-- iki sorguyu tek tablodan veri çeker gibi alt alta sonuçlarýný gösterir. Ve tek tablodan
-- veri çekiliyor gibi çýktý verir.

select FirstName,LastName from Employees
union
select ShipCity,ShipCountry from Orders


select City from Suppliers
select City from Customers

-- union asceding olarak sýralama yapar
select City from Suppliers
union
select City from Customers

select City from Suppliers 
union all -- hepsini birleþtirir ve tekrar edenleri getirir.
select City from Customers

-- Intersect, Except
-- Intersect: Union operatörü hem distinct (tekrar etmeyen) hemde all biçimini destekler.
-- Ancak intersect þu anda yalnýzca distinct seçeneðini destekler.Bu operatörle
-- yapýlan iþlemde tekrarlý satýrlar döndürülür.
select City from Suppliers 
intersect -- sadece iki sütundan tekrarlý satýrlar tekil olarak döndürülür.
select City from Customers
-- Except: iki tablodan sadece birinde bulunan benzersiz satýrlarý döndürür. 
select City from Suppliers 
except 
select City from Customers