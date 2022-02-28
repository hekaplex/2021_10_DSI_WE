DECLARE @jsonisland nvarchar(max);
DECLARE @jsonpowerbi nvarchar(max)

--add JSON from string or SELECT into nvarchar(max) from table
set @jsonpowerbi = 
--paste the DataModelSchema file here after replacing the ' character with ` 
N''

--get island of schema with table definitions
SELECT @jsonisland = edgetable
  FROM OPENJSON(@jsonpowerbi) 
 with (edgetable nvarchar(max) '$.model.tables' AS JSON )

--DAX columns
SELECT 
    'DAX Column' AS Object_Type
    ,table_name as [Table]
    , col_name 
        + ' = '
        +  replace
            (
                DAX
                ,'`'
                ,char(39)
            ) as [DAX]
from
    OPENJSON(@jsonisland)
        WITH
            (
                table_name VARCHAR(max) '$.name',
                col_list NVARCHAR(max) '$.columns' AS JSON
            )
cross apply 
    OPENJSON(col_list)
        with 
            (
                col_name VARCHAR(max) '$.name'
                ,DAX VARCHAR(max) '$.expression'
            ) 
            col_details
        WHERE 
            col_details.DAX is not null
UNION ALL
--DAX measures
SELECT 
    'DAX Measure' AS Object_Type
    ,table_name AS [Table]
    , col_name 
        + ' = '
        +  replace
            (
                DAX
                ,'`'
                ,char(39)
            )  AS DAX
from
    OPENJSON(@jsonisland)
        WITH
            (
                table_name VARCHAR(max) '$.name',
                col_list NVARCHAR(max) '$.measures' AS JSON
            )
cross apply 
    OPENJSON(col_list)
        with 
            (
                col_name VARCHAR(max) '$.name'
                ,DAX VARCHAR(max) '$.expression'
            ) 
            col_details
        WHERE 
            col_details.DAX is not null            
UNION ALL
--DAX or M for Table Definition 
SELECT 
CASE 
	WHEN 
		SUBSTRING(DAX,1,3)='let'
	THEN 
		'M Query' 
	ELSE 
		'DAX Table' 
	END 
		AS Object_Type
    ,table_name as [Table]
    , DAX as [DAX]
from
    OPENJSON(@jsonisland)
        WITH
            (
                table_name VARCHAR(max) '$.name',
                col_list NVARCHAR(max) '$.partitions' AS JSON
            )
cross apply 
    OPENJSON(col_list)
        with 
            (
                col_name VARCHAR(max) '$.name'
                ,DAX VARCHAR(max) '$.source.expression'
            ) 
            col_details
        WHERE 
            col_details.DAX is not null
Order by 1 ASC


--LEN(DAX)- LEN(REPLACE(DAX,'#"','')