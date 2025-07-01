-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: Temporary Tables - Creation
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

ALTER PROCEDURE HumanResources.spEmployeePayRateTempTable_Get
/*
    EXEC HumanResources.spEmployeePayRateTempTable_Get
*/
AS

BEGIN

    -- Creating a Temporary Table with INTO #
    SELECT MostRecentPay.Rate, 
        MostRecentPay.BusinessEntityID
        INTO #MostRecentPay 
    FROM (
        SELECT PayHistory.Rate,
            ROW_NUMBER() OVER (PARTITION BY PayHistory.BusinessEntityID 
                ORDER BY PayHistory.RateChangeDate DESC) AS RateIsMostRecent,
            PayHistory.BusinessEntityID
        FROM HumanResources.EmployeePayHistory AS PayHistory
    ) MostRecentPay
        WHERE MostRecentPay.RateIsMostRecent = 1

    -- SELECT * FROM #MostRecentPay
    SELECT [#MostRecentPay].[Rate],
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
        JOIN #MostRecentPay 
            ON #MostRecentPay.BusinessEntityID = Person.BusinessEntityID

END