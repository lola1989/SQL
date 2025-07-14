-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: DENSE_RANK adds a number to partitioned values but
-- can be the same value (if two values are the same)
-- DENSE_ RANK will NOT skip numbers if multiple are duplicate 
-- the following will be the next number
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding DENSE_RANK to PARTITION BY PersonType
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    DENSE_RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeDenseRank,
    RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRank,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRowNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName
;