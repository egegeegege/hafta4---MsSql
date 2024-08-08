-- JOIN (Birleþtirme)
-- 2 yada daha fazla tabloyu baðlamak için kullanýlýr.
-- Join iþlemi yaparken 2 tablonun ortak alanlarýnýn bulunmasý gerekir. (Yani tablolar arasýnda iliþki olmalýdýr.)

select * from Orders
select * from [Order Details]

-- self join
select Orders.OrderDate,[Order Details].ProductID,[Order Details].UnitPrice from Orders,[Order Details]
where Orders.OrderID = [Order Details].OrderID

/* 
Join Çeþitleri
1- Inner Join: Baðlanan tablolarda null olamayan kayýtlarý getirir. Ýki küme kesiþimi
* sadece join ifadesi kullandýðýmýzda da inner join iþlemi yapmýþ oluruz.
* baðlantý yapýlýrken tablo yerleri farklý olabilir.
2 - left join: Baðlanan iki tablodan left join keywordünün solunda kalan tablodaki 
tüm kayýtlarý getirir left join keywordünün saðýnda kalan tablodaki eþleþmeyen kayýtlarý null olarak getirir.
3 - right join: Baðlanan iki tablodan right join keywordünün saðýnda kalan tablodaki 
tüm kayýtlarý getirir right join keywordünün solunda kalan tablodaki eþleþmeyen kayýtlarý null olarak getirir.
4- full outer join: Baðlanan tablolarda eþleþen eþleþmeyen tüm kayýtlarý getirir. Birleþim kümesi.
*/
-- self join
select * from Employees, Orders
where Employees.EmployeeID = Orders.EmployeeID
-- personellerin aldýðý sipariþleri Personel Adi, Soyadý, Sipariþin Tarihi, Kargo ücreti olarak listeleyin
-- inner join
select e.FirstName,e.LastName,o.OrderDate,o.Freight from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID

select e.FirstName,e.LastName,o.OrderDate,o.Freight from Employees e
inner join Orders o
on e.EmployeeID = o.EmployeeID
-- left join
select e.FirstName,e.LastName,o.OrderDate,o.Freight from Employees e
left join Orders o
on e.EmployeeID = o.EmployeeID
-- right join
select e.FirstName,e.LastName,o.OrderDate,o.Freight from Orders o
right join Employees e
on e.EmployeeID = o.EmployeeID
-- full outer join
select e.FirstName,e.LastName,o.OrderDate,o.Freight from Orders o
full outer join Employees e
on e.EmployeeID = o.EmployeeID


-- Ürünleri ürünadý ve kategori adý olarak listeleyin.
select p.ProductName,c.CategoryName from Products p
join Categories c 
on p.CategoryID = c.CategoryID

-- Ürün adý ve üründen verilen sipariþin UnitPrice ve Quantitysini getirin
select p.ProductName,od.Quantity,od.UnitPrice from [Order Details] od 
join Products p 
on p.ProductID = od.ProductID

-- fiyata göre küçükten büyüðe doðru sýrala
select p.ProductName,od.Quantity,od.UnitPrice from [Order Details] od 
join Products p 
on p.ProductID = od.ProductID
order by od.UnitPrice asc

-- bu ürünleri adý ve sipariþlerin tarihi ?
select * from Products p 
join [Order Details] od on od.ProductID = p.ProductID
join Orders o on od.OrderID = o.OrderID


-- product idsi 3 olan üründen ürün adý sipariþ tarihi ve bu sipariþi hangi çalýþanýn aldýðý þekilde listeyin.
select * from Products
select * from [Order Details]
select * from Orders
select * from Employees

select p.ProductName,o.OrderDate,e.FirstName,e.LastName from Products p 
join [Order Details] od on p.ProductID = od.ProductID
join Orders o on od.OrderID = o.OrderID
join Employees e on e.EmployeeID = o.EmployeeID
where p.ProductID=3

-- Countrysi Germany olan müþterilerin sipariþ teslim tarihlerini küçükten büyüðe sýralayýnýz.

select c.CompanyName,o.ShippedDate from Orders o
join Customers c on o.CustomerID = c.CustomerID
where c.Country in ('Germany')
order by o.ShippedDate

