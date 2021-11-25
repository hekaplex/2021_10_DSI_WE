SELECT *
FROM StellarData;

SELECT *
FROM StellarData
ORDER BY st_teff DESC;

SELECT *
INTO StellarDataCopy
FROM StellarData;

SELECT DISTINCT hostname
FROM StellarData
WHERE st_teff is not null
	or st_rad is not null
	or st_mass is not null;

-- clearing NULL values from stars with no temp, radius or mass reported (binary/tertiary systems)

DELETE FROM StellarData
	WHERE st_teff is null
	OR st_rad is null
	OR st_mass is null;

--Partition to remove duplicate hostnames and leave the higher mass if there's any difference

WITH PartitionedData AS
(
    SELECT 
       hostname
	   , st_mass
       ,ROW_NUMBER() OVER(PARTITION BY hostname ORDER BY st_mass DESC) AS 'RowNum'
    FROM StellarData
)
DELETE FROM PartitionedData
WHERE RowNum > 1

-- All G-type main-sequence stars ordered by highest temp (k)

SELECT *
FROM StellarData
WHERE st_spectype LIKE 'G_'
ORDER BY st_teff desc;
	