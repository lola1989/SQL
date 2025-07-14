-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: NTILE - splits the partition into x amount of groups
-- each partiton will be split into the defined NTILE(x)
-- PersonType EM has 273 records / 5 = 54.6
-- PersonType EM will be 1 for rows 1-55 then 2 starting on row 56
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding NTILE to PARTITION BY PersonType
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    NTILE(5) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeNTILE,
    ROW_NUMBER() OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS PersonTypeRowNumber
FROM Person.Person 
    ORDER BY PersonType, FirstName
;