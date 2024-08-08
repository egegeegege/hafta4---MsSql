-- JOIN (Birle�tirme)
-- 2 yada daha fazla tabloyu ba�lamak i�in kullan�l�r.
-- Join i�lemi yaparken 2 tablonun ortak alanlar�n�n bulunmas� gerekir. (Yani tablolar aras�nda ili�ki olmal�d�r.)

select * from Orders
select * from [Order Details]

-- self join
select Orders.OrderDate,[Order Details].ProductID,[Order Details].UnitPrice from Orders,[Order Details]
where Orders.OrderID = [Order Details].OrderID

/* 
Join �e�itleri
1- Inner Join: Ba�lanan tablolarda null olamayan kay�tlar� getirir. �ki k�me kesi�imi
* sadece join ifadesi kulland���m�zda da inner join i�lemi yapm�� oluruz.
* ba�lant� yap�l�rken tablo yerleri farkl� olabilir.
2 - left join: Ba�lanan iki tablodan left join keyword�n�n solunda kalan tablodaki 
t�m kay�tlar� getirir left join keyword�n�n sa��nda kalan tablodaki e�le�meyen kay�tlar� null olarak getirir.
3 - right join: Ba�lanan iki tablodan right join keyword�n�n sa��nda kalan tablodaki 
t�m kay�tlar� getirir right join keyword�n�n solunda kalan tablodaki e�le�meyen kay�tlar� null olarak getirir.
4- full outer join: Ba�lanan tablolarda e�le�en e�le�meyen t�m kay�tlar� getirir. Birle�im k�mesi.
*/
-- self join
select * from Employees, Orders
where Employees.EmployeeID = Orders.EmployeeID
-- personellerin ald��� sipari�leri Personel Adi, Soyad�, Sipari�in Tarihi, Kargo �creti olarak listeleyin
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


-- �r�nleri �r�nad� ve kategori ad� olarak listeleyin.
select p.ProductName,c.CategoryName from Products p
join Categories c 
on p.CategoryID = c.CategoryID

-- �r�n ad� ve �r�nden verilen sipari�in UnitPrice ve Quantitysini getirin
select p.ProductName,od.Quantity,od.UnitPrice from [Order Details] od 
join Products p 
on p.ProductID = od.ProductID

-- fiyata g�re k���kten b�y��e do�ru s�rala
select p.ProductName,od.Quantity,od.UnitPrice from [Order Details] od 
join Products p 
on p.ProductID = od.ProductID
order by od.UnitPrice asc

-- bu �r�nleri ad� ve sipari�lerin tarihi ?
select * from Products p 
join [Order Details] od on od.ProductID = p.ProductID
join Orders o on od.OrderID = o.OrderID


-- product idsi 3 olan �r�nden �r�n ad� sipari� tarihi ve bu sipari�i hangi �al��an�n ald��� �ekilde listeyin.
select * from Products
select * from [Order Details]
select * from Orders
select * from Employees

select p.ProductName,o.OrderDate,e.FirstName,e.LastName from Products p 
join [Order Details] od on p.ProductID = od.ProductID
join Orders o on od.OrderID = o.OrderID
join Employees e on e.EmployeeID = o.EmployeeID
where p.ProductID=3

-- Countrysi Germany olan m��terilerin sipari� teslim tarihlerini k���kten b�y��e s�ralay�n�z.

select c.CompanyName,o.ShippedDate from Orders o
join Customers c on o.CustomerID = c.CustomerID
where c.Country in ('Germany')
order by o.ShippedDate

