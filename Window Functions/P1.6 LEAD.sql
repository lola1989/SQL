-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: LEAD give accesses to a next row value in the pervious row
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding LEAD to PARTITION BY PersonType
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    LEAD(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS NextPersonsName,
    LAG(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRowNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName