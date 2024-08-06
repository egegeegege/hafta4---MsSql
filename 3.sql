--- Döngüler (Loops)
-- bir iþi birden çok kez yapmak için kullanýlýr.

print ('Heyo')

declare @sayac int = 1
while(@sayac<=100)
begin
	print ('Heyo')
	set @sayac = @sayac + 1
end

-- break (kýrmak)

declare @sayac int = 1
while(@sayac<=100)
begin
	set @sayac = @sayac + 1
	print ('Heyo')
	if(@sayac = 5)
		begin
			print ('Sayý 5 e ulaþtý')
			break
		end
end

-- continue => döngüyü devam ettir.

