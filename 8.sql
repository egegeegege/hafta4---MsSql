-- Trigger (Tetikleyici)
/* 
Bir tabloda gerçekleþen sorgu(olay(insert,update,delete)) sonucunda baþka bir durumun çalýþmasýný 
saðlarlar.
Stored procedure ve fonksiyonlardan farký kullanýcý tarafýndan çaðýrýlmamasýdýr. Otomatik olarak 
olaya göre tetiklenir.
** Triggerlar 2 ye ayrýlýr
1. After For => Birlikte çalýþan
2. Instead Of => Ana sorguyu engelleyen

trigger tanýmý

create trigger TriggerAdi
on TriggerýTetikleyecekTablo
after olay(insert,update,delete)
as
begin
	burada gerçekleþecek olay.
end

*/

create trigger tg_InsertEmployee
on Employees
after insert -- after employee tablosuna hem insert yapýlýr hemde triggerýn içi çalýþýr.
as
begin
	print ('Yeni Bir Çalýþan Eklendi')
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
after insert -- after employee tablosuna hem insert yapýlýr hemde triggerýn içi çalýþýr.
as
begin
	update EmployeeCount set EmployeeCount = EmployeeCount + 1 where ID = 1
end

insert into Employees (FirstName,LastName) values ('Tahsin','Canpolat')

-- trigger ý disable etme
disable trigger all on Employees
enable trigger all on Employees

-- instead of