-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-29
-- Description: CASE expression goes through conditions and returns 
-- a value when the first condition is met (an if-then-else statement). 
-- So, once a condition is true, it will stop reading and return 
-- the result. If no conditions are true, it returns the 
-- value in the ELSE clause.
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Single CASE Statement
SELECT [FirstName],
	[MiddleName],
	[LastName],
    CASE 
        WHEN MiddleName = 'A'
            THEN 2
        WHEN MiddleName IS NOT NULL
            THEN 1
        ELSE 0
    END                                     -- END signifies the ending of the CASE statement
FROM Person.Person

-- Nested CASE Statement
SELECT [FirstName],
	[MiddleName],
	[LastName],
    CASE 
        WHEN MiddleName IS NOT NULL
            THEN
                CASE WHEN MiddleName = 'A'
                    THEN 2
                    ELSE 1 
                END                         -- END signifies the ending of the First CASE statement
        ELSE 0
    END                                     -- END signifies the ending of the Second CASE statement
FROM Person.Person

-- Aggregate SUM of CASE statement
-- How many people have a middle name & how many do not
SELECT
    SUM(CASE
        WHEN MiddleName IS NOT NULL
            THEN 1
        ELSE 0
    END) AS HasMiddleName,
    SUM(CASE
        WHEN MiddleName IS NULL
            THEN 1
        ELSE 0
    END) AS HasNoMiddleName             
FROM Person.Person

-- How many people have a middle name
SELECT COUNT(MiddleName)
FROM Person.Person
WHERE MiddleName IS NOT NULL