-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: Setting up a View
-- Views are limited to 1 Query
-- Can put a WHERE clause when selecting the view as opposed to 
-- a variable (which is needed in a Stored Procedure)
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

CREATE OR ALTER VIEW HumanResources.vwEmployeePayRate
/*
    SELECT * FROM HumanResources.vwEmployeePayRate WHERE MiddleName IN ('A', 'B')
*/
AS
    SELECT [MostRecentPay].[Rate],
        [Person].[BusinessEntityID],
        [Person].[PersonType],
        [Person].[NameStyle],
        [Person].[Title],
        [Person].[FirstName],
        [Person].[MiddleName],
        [Person].[LastName],
        [Person].[Suffix],
        [Person].[EmailPromotion],
        [Person].[AdditionalContactInfo],
        [Person].[Demographics],
        [Person].[rowguid],
        [Person].[ModifiedDate] 
    FROM (
         SELECT PayHistory.Rate,
            ROW_NUMBER() OVER (PARTITION BY PayHistory.BusinessEntityID 
                ORDER BY PayHistory.RateChangeDate DESC) AS RateIsMostRecent,
                PayHistory.BusinessEntityID
        FROM HumanResources.EmployeePayHistory AS PayHistory
    ) MostRecentPay
        LEFT JOIN Person.Person
            ON MostRecentPay.BusinessEntityID = Person.BusinessEntityID
        WHERE MostRecentPay.RateIsMostRecent = 1

GO