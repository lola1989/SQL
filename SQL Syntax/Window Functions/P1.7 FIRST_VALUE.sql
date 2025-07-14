-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: FIRST_VALUE pulls the first value from the 
-- first row in the partiton
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding FIRST_VALUE to PARTITION BY PersonType
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    FIRST_VALUE(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS FirstPersonsName,
    LEAD(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS NextPersonsName,
    LAG(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRowNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName