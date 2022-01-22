/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [Date]
      ,[Open]
      ,[High]
      ,[Low]
      ,[Close]
      ,[Adj_Close]
      ,[Volume]
  FROM [Capstone].[dbo].[AAPL]

  SELECT SUM(CAST(Volume AS BIGINT))
  FROM AAPL
  WHERE Date BETWEEN '2011-01-01' AND '2011-12-31';
  
