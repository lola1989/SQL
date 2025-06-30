-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-30
-- Description: Nested Query - a query embeded within another
-- SQL statement
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- SELECT The current Pay Rate of each employee
-- Using OUTER APPLY, but this is not the most efficient
-- This calls the query 290 times

SELECT Person.BusinessEntityID,
    Person.FirstName,
    Person.LastName,
    MostRecentPay.Rate
FROM Person.Person
    OUTER APPLY (
        SELECT PayHistory.Rate,
            ROW_NUMBER() OVER (
                PARTITION BY PayHistory.BusinessEntityID 
                ORDER BY PayHistory.RateChangeDate DESC
                ) AS RateIsMostRecent
        FROM HumanResources.EmployeePayHistory AS PayHistory
        WHERE PayHistory.BusinessEntityID = Person.BusinessEntityID
    ) MostRecentPay
    WHERE MostRecentPay.RateIsMostRecent = 1
    ORDER BY Person.BusinessEntityID


----------------------------------------------------------------

-- Using a Nested Query to SELECT The current Pay Rate of each employee
SELECT Person.BusinessEntityID,
    Person.FirstName,
    Person.LastName,
    MostRecentPay.Rate FROM (
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
    


