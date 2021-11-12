SELECT Name, 
		Spe,
		Type_1
From Pokemon
WHERE Spe >= 100 AND Type_1 = 'Water'
ORDER BY Spe desc