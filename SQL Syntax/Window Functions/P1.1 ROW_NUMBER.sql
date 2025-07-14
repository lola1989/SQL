-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: ROW_NUMBER - provides a row number within a partition
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding a ROW_NUMBER to PARTITION BY PersonType
SELECT 
    [PersonType],
    [Title],
    [FirstName],
    [LastName],
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName
;

-- Creating a CTE to filter for only PertonTypeNumber = 1
WITH RankedPeople AS (
    SELECT 
        [PersonType],
        [Title],
        [FirstName],
        [LastName],
        ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeNumber
    FROM Person.Person 
)
SELECT *
FROM RankedPeople
WHERE PersonTypeNumber = 1
ORDER BY PersonType, FirstName;

