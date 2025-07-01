-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: Temporary Tables - Management
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

ALTER PROCEDURE HumanResources.spEmployeePayRateTempTable_Get
/*
    EXEC HumanResources.spEmployeePayRateTempTable_Get
*/
AS

BEGIN

    DROP TABLE IF EXISTS #MostRecentPay 

    -- If older version of SQL Server
    -- IF OBJECT_ID('tempdb..#MostRecentPay') IS NOT NULL 
    --     DROP TABLE #MostRecenPay

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

    -- Creating a Clustered Index to speed up the Query
    CREATE CLUSTERED INDEX cix_MostRecentPay_BusinessEntityID ON #MostRecentPay(BusinessEntityID)


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