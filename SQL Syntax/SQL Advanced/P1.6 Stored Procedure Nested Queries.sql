-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-30
-- Description: Creating a Nested Query Stored Procedure 
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

ALTER PROCEDURE HumanResources.spEmployeePayRate_Get
/*
    EXEC HumanResources.spEmployeePayRate_Get
*/
AS

BEGIN

-- Using a Nested Query to SELECT The current Pay Rate of each employee
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
[Person].[ModifiedDate] FROM (
        SELECT PayHistory.Rate,
            ROW_NUMBER() OVER (
                PARTITION BY PayHistory.BusinessEntityID 
                ORDER BY PayHistory.RateChangeDate DESC
                ) AS RateIsMostRecent,
                PayHistory.BusinessEntityID
        FROM HumanResources.EmployeePayHistory AS PayHistory
    ) MostRecentPay
        LEFT JOIN Person.Person
            ON MostRecentPay.BusinessEntityID = Person.BusinessEntityID
        WHERE MostRecentPay.RateIsMostRecent = 1
    
END