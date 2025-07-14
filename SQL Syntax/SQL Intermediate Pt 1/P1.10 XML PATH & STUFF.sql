-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-30
-- Description: XML PATH & STUFF
-- STUFF takes in 4 arguments. 
-- First is where is goes to look for something to replace
-- Second is how many characters to replace
-- Third is what to replace it with
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- List out all of the Departments inside of a group in a single row
SELECT
    [Department].[GroupName],
    STRING_AGG([Name], ', ') AS DepartmentInGroup,
    STRING_AGG([Name], ';') AS DepartmentInGroupProgram
FROM HumanResources.Department AS Department
GROUP BY [Department].[GroupName]


-- XML Example
-- <name> value </name>

-- Nested Query to remove Name node on output of XML Path 
SELECT [Department].[GroupName],
    STUFF((
    SELECT ', ' +                                                        -- ADDS , to Name field and drops the Name node
        [DepartmentInner].[Name]                    
    FROM HumanResources.Department AS DepartmentInner
        WHERE DepartmentInner.GroupName = Department.GroupName
        -- FOR XML PATH('Main')
        FOR XML PATH('')),
        1,
        2,
        '')
FROM HumanResources.Department AS Department
GROUP BY [Department].[GroupName]

