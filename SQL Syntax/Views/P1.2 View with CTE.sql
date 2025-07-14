-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: Setting up a View with a CTE
-- CTE - common table expression
-- CTE do not write to disk space and they are dopped
-- as soon as the query is completed
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

CREATE OR ALTER VIEW HumanResources.vwEmployeePayRateCTE
/*
    SELECT * FROM HumanResources.vwEmployeePayRateCTE WHERE MiddleName IN ('A', 'B')
*/
AS
    -- Creating a CTE as opposed to a temporary table
    WITH MostRecentPayCTE AS (
        SELECT MostRecentPay.Rate,
            MostRecentPay.BusinessEntityID 
        FROM (
            SELECT PayHistory.Rate,
                ROW_NUMBER() OVER (PARTITION BY PayHistory.BusinessEntityID 
                    ORDER BY PayHistory.RateChangeDate DESC) AS RateIsMostRecent,
                PayHistory.BusinessEntityID
            FROM HumanResources.EmployeePayHistory AS PayHistory
        ) MostRecentPay
            WHERE MostRecentPay.RateIsMostRecent = 1
    )

    SELECT [MostRecentPayCTE].[Rate],
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
    FROM Person.Person
        JOIN MostRecentPayCTE 
            ON MostRecentPayCTE.BusinessEntityID = Person.BusinessEntityID


GO