SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

                alter view [dbo].[dPY_BY_SEX]
                as
                SELECT
                	Sex
                	,AVG(DollarPerYear ) AVG_DollarPerYear
                FROM
                	titanic1004  
                GROUP BY 
                	sex
                GO


[spInsertInvoice]
       @VendorID = 12,
       @InvoiceNumber = 'BLAH',
       @InvoiceDate = GETDATE(),
       @InvoiceTotal = 100,
       @TermsID = 3,
       @InvoiceDueDate = DATEADD(DAY,30, GETDATE())
AS


[spInsertInvoice]
        12,
        'BLAH',
        '2022-01-18 15:00:08.343',
        100,
        3,
        '2022-01-31 15:00:08.343'