-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: SCHEMABINDING - establishes a direct link between
-- a view or function and the tables, views, or functions it uses
-- must be removed from the VIEW first if needs to be dropped
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

CREATE OR ALTER VIEW HumanResources.vwEmployeePayRateCTEsb
/*
    SELECT * FROM HumanResources.vwEmployeePayRateCTEsb WHERE MiddleName IN ('A', 'B')
*/
WITH SCHEMABINDING
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
        -- [Person].[DummyField]
    FROM Person.Person
        JOIN MostRecentPayCTE 
            ON MostRecentPayCTE.BusinessEntityID = Person.BusinessEntityID


GO

-- ALTER TABLE Person.Person ADD DummyField VARCHAR (255)

-- ALTER TABLE Person.Person DROP COLUMN DummyField 

SELECT * FROM HumanResources.vwEmployeePayRateCTEsb