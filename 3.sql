--- D�ng�ler (Loops)
-- bir i�i birden �ok kez yapmak i�in kullan�l�r.

print ('Heyo')

declare @sayac int = 1
while(@sayac<=100)
begin
	print ('Heyo')
	set @sayac = @sayac + 1
end

-- break (k�rmak)

declare @sayac int = 1
while(@sayac<=100)
begin
	set @sayac = @sayac + 1
	print ('Heyo')
	if(@sayac = 5)
		begin
			print ('Say� 5 e ula�t�')
			break
		end
end

-- continue => d�ng�y� devam ettir.

