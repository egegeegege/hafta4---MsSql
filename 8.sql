-- Trigger (Tetikleyici)
/* 
Bir tabloda ger�ekle�en sorgu(olay(insert,update,delete)) sonucunda ba�ka bir durumun �al��mas�n� 
sa�larlar.
Stored procedure ve fonksiyonlardan fark� kullan�c� taraf�ndan �a��r�lmamas�d�r. Otomatik olarak 
olaya g�re tetiklenir.
** Triggerlar 2 ye ayr�l�r
1. After For => Birlikte �al��an
2. Instead Of => Ana sorguyu engelleyen

trigger tan�m�

create trigger TriggerAdi
on Trigger�TetikleyecekTablo
after olay(insert,update,delete)
as
begin
	burada ger�ekle�ecek olay.
end

*/

create trigger tg_InsertEmployee
on Employees
after insert -- after employee tablosuna hem insert yap�l�r hemde trigger�n i�i �al���r.
as
begin
	print ('Yeni Bir �al��an Eklendi')
end

insert into Employees (FirstName,LastName) values ('Tahsin','Canpolat')
select FirstName,LastName from Employees

create table EmployeeCount(
	ID int primary key identity(1,1),
	EmployeeCount int
)
select * from EmployeeCount

create trigger tg_InsertEmployeeAndCountUpdate
on Employees
after insert -- after employee tablosuna hem insert yap�l�r hemde trigger�n i�i �al���r.
as
begin
	update EmployeeCount set EmployeeCount = EmployeeCount + 1 where ID = 1
end

insert into Employees (FirstName,LastName) values ('Tahsin','Canpolat')

-- trigger � disable etme
disable trigger all on Employees
enable trigger all on Employees

-- instead of