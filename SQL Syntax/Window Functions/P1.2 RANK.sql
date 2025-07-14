-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: RANK - adds a number to partitioned values but
-- can be the same value (if two values are the same)
-- RANK will skip numbers if multiple are duplicate & the following
-- will be the row number value
-- See row 7 & 8 PersonTypeRank = 7 & row 9 PersonTypeRank = 9
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding RANK to PARTITION BY PersonType
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    RANK() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRank,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRowNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName
;