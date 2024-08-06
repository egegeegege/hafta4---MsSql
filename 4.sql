-- Cursor
/* 
Cursorlar, veri kümesindeki her bir veriyi adým adým bizlere getiren ve bu
þekilde satýrsal bazda iþlem yapmamýzý saðlayan yapýlardýr.
Çalýþma þekilleri varsayýlan olarak ileri doðru olsada ileri ve geri olmak üzere
sýrasýyla tüm satýrlarý elde etme usülüne dayanýr.
Ýleri doðru okuma iþlemi yapan cursorlar geri doðru okuma iþlemi yapan cursorlardan 
kat be kat hýzlý çalýþmaktadýr.

*/

select * from Employees

declare @Adi nvarchar(max),@Soyadi nvarchar(max),@Unvan nvarchar(max)
--cursor oluþturalým
declare PersonelCursor cursor
for
--- cursorýn temsil edeceði veri kümesini getirecek olan sorguyu belirtiyoruz.
select FirstName,LastName,Title from Employees
-- cursor açýlarak tüketim baþlatýlýr.
open PersonelCursor
-- Sýradaki veri yakalanýyor ve hafýzaya alýnýyor. o andaki veri 'PersonelCursor' tarafýndan temsil ediliyor ve sütun deðerleri belirtilen ilgili deðiþkenlere atanýyor
fetch next from PersonelCursor into @Adi,@Soyadi,@Unvan
-- iþlem baþarýlý ise @@FETCH_STATUS deðiþken deðeri '0' ise iþlem baþarýlýdýr ve bir sonraki kayýt var demektir.
while @@FETCH_STATUS = 0
	begin
		print @Adi + ' ' + @Soyadi + ' ' + @Unvan
		-- Sýradaki veriye geçilir ve tekrardan cursor üzerinden sütun deðerleri ilgili deðiþkenlere atanýr.
		fetch next from PersonelCursor into @Adi,@Soyadi,@Unvan
	end
close PersonelCursor -- cursor kapanýr.

deallocate PersonelCursor
