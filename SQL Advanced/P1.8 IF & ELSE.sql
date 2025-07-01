-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: IF & ELSE
-- ----------------------------------------------------------------
USE AdventureWorks2019
GO

DROP TABLE IF EXISTS #MostRecentPay 


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


    -- Declaring a new variable
    DECLARE @CountInMostRecentPay INT

    SELECT @CountInMostRecentPay = COUNT (*) FROM #MostRecentPay

    -- IF & ELSE Logic
    IF @CountInMostRecentPay > 300
        BEGIN
            PRINT('Greater than 300')
        END
        ELSE IF @CountInMostRecentPay > 200
        BEGIN
            PRINT('Greater than 200 v2')
        END
        ELSE
        BEGIN
            PRINT('Not greater than 200')
        END


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