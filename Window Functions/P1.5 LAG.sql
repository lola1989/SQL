-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: LAG give accesses to a prior row in the pervious row
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding LAG to PARTITION BY PersonType as well as without PPARTITION BY
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    LAG(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName,
    LAG(FirstName) OVER (ORDER BY PersonType, FirstName) AS LastPersonsNameNP,
    RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRank,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRowNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName
;