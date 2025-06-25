-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: LAST_VALUE supplies the last value in the window
-- does not work well as it just supplies the value that was last
-- noted in the window
-- better to use FIRST_VALUE DESC
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Adding LAST_VALUE to PARTITION BY PersonType
-- Using FIRST_VALUE DESC works better
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    FIRST_VALUE(FirstName) OVER (PARTITION BY PersonType 
        ORDER BY PersonType DESC, FirstName DESC) AS DescFirstPersonsName,
    LAST_VALUE(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastValuePersonsName,
    FIRST_VALUE(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS FirstPersonsName,
    LAG(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName
FROM Person.Person 
    ORDER BY PersonType, FirstName



-- Adding LAST_VALUE to PARTITION BY PersonType the correct way
-- included all rows in the window by invalidating a Windows function
SELECT 
    [PersonType],
    [FirstName],
    [LastName],
    LAST_VALUE(FirstName) OVER (PARTITION BY PersonType 
        ORDER BY PersonType, FirstName
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
        ) AS LastValuePersonsName,
    FIRST_VALUE(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS FirstPersonsName,
    LAG(FirstName) OVER (PARTITION BY PersonType ORDER BY PersonType, FirstName) AS LastPersonsName
FROM Person.Person 
    ORDER BY PersonType, FirstName