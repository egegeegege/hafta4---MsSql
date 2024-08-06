-- Union (Birle�tirme)
-- Joine benzer fakat joinin yapt��� i�i yapmaz.
-- iki sorguyu tek tablodan veri �eker gibi alt alta sonu�lar�n� g�sterir. Ve tek tablodan
-- veri �ekiliyor gibi ��kt� verir.

select FirstName,LastName from Employees
union
select ShipCity,ShipCountry from Orders


select City from Suppliers
select City from Customers

-- union asceding olarak s�ralama yapar
select City from Suppliers
union
select City from Customers

select City from Suppliers 
union all -- hepsini birle�tirir ve tekrar edenleri getirir.
select City from Customers

-- Intersect, Except
-- Intersect: Union operat�r� hem distinct (tekrar etmeyen) hemde all bi�imini destekler.
-- Ancak intersect �u anda yaln�zca distinct se�ene�ini destekler.Bu operat�rle
-- yap�lan i�lemde tekrarl� sat�rlar d�nd�r�l�r.
select City from Suppliers 
intersect -- sadece iki s�tundan tekrarl� sat�rlar tekil olarak d�nd�r�l�r.
select City from Customers
-- Except: iki tablodan sadece birinde bulunan benzersiz sat�rlar� d�nd�r�r. 
select City from Suppliers 
except 
select City from Customers