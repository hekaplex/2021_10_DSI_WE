select * from [Production].[vProductAndDescription]

select @@ver
dbcc freeproccache
;
dbcc dropcleanbuffers
;
select * from sysprocesses

select * from sys.indexes

--BEFORE:  139 ms
--GOAL:	70 ms
--AFTER: 138 ms
--BEST CASE: 143 ms +/- 30 ms
--Index #2: [152,199]

select * from Bestcase

dbcc freeproccache
;
dbcc dropcleanbuffers
;
select 
	d.* 
--into Bestcase
from FactFinance f
join DimAccount d
on d.AccountKey
= f.AccountKey
where f.AccountKey between 65 and 68
--CAST(f.AccountKey  as varchar(20))= '66' index scan when we had covering index
--f.DepartmentGroupKey = 2 table scan
--d.AccountType = 'Expenditures' index scan

select @@spid

SET STATISTICS PROFILE ON
SET STATISTICS TIME ON
SET STATISTICS IO ON

select object_name (i.object_id), o.type_desc, count(*) 
from sys.indexes i
join sys.objects o on i.object_id  = o.object_id
group by object_name (i.object_id),o.type_desc
order by 2 desc

select * from sys.objects
SET SHOWPLAN_ALL OFF
SET SHOWPLAN_TEXt OFF


SET STATISTICS PROFILE OFF
SET STATISTICS TIME OFF
SET STATISTICS IO OFF


--RULE #1: Have a covering index for your predicates
--WHERE clauses and the ON clause in a JOIN , PARTITION BY  AND ORDER BY IN windowing 
--RULE #2: Prepare to add NC indexes to foreign keys
--RULE #3: Profile, Review plans and manage stats
--RULE #4: Profile, Review plans and manage index
--RULE #5: Composite indexes need statistics on secondary columns
--RULE #6: Always use the native data type of a column in a seach arg
--RULE #7: Convert UDF(User-Defined Functions) to stored procedures and tables when possible
--RULE #8: Temporary objects may need indexes too (dev in normal tables first)

DBCC SHOW_STATISTICS('[Production].[vProductAndDescription]',[IX_vProductAndDescription])

use [AdventureWorksDW2019]
GO
DBCC SHOW_STATISTICS([FactProductInventory],[PK_FactProductInventory] )
GO

