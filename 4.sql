-- Cursor
/* 
Cursorlar, veri k�mesindeki her bir veriyi ad�m ad�m bizlere getiren ve bu
�ekilde sat�rsal bazda i�lem yapmam�z� sa�layan yap�lard�r.
�al��ma �ekilleri varsay�lan olarak ileri do�ru olsada ileri ve geri olmak �zere
s�ras�yla t�m sat�rlar� elde etme us�l�ne dayan�r.
�leri do�ru okuma i�lemi yapan cursorlar geri do�ru okuma i�lemi yapan cursorlardan 
kat be kat h�zl� �al��maktad�r.

*/

select * from Employees

declare @Adi nvarchar(max),@Soyadi nvarchar(max),@Unvan nvarchar(max)
--cursor olu�tural�m
declare PersonelCursor cursor
for
--- cursor�n temsil edece�i veri k�mesini getirecek olan sorguyu belirtiyoruz.
select FirstName,LastName,Title from Employees
-- cursor a��larak t�ketim ba�lat�l�r.
open PersonelCursor
-- S�radaki veri yakalan�yor ve haf�zaya al�n�yor. o andaki veri 'PersonelCursor' taraf�ndan temsil ediliyor ve s�tun de�erleri belirtilen ilgili de�i�kenlere atan�yor
fetch next from PersonelCursor into @Adi,@Soyadi,@Unvan
-- i�lem ba�ar�l� ise @@FETCH_STATUS de�i�ken de�eri '0' ise i�lem ba�ar�l�d�r ve bir sonraki kay�t var demektir.
while @@FETCH_STATUS = 0
	begin
		print @Adi + ' ' + @Soyadi + ' ' + @Unvan
		-- S�radaki veriye ge�ilir ve tekrardan cursor �zerinden s�tun de�erleri ilgili de�i�kenlere atan�r.
		fetch next from PersonelCursor into @Adi,@Soyadi,@Unvan
	end
close PersonelCursor -- cursor kapan�r.

deallocate PersonelCursor
