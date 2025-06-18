-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-06-10
-- Description: UNION - taking 2 seperate SELECT statements and
-- joining them together from top to bottom
-- UNION by default removes duplicates
-- UNION AL does not remove duplicates
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Use UNION to join the SELECT Statements
SELECT Department.DepartmentID,
    Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
-- UNION
UNION ALL
SELECT Department.DepartmentID,
    Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department



-- Use UNION to join the SELECT Statements
-- Represents how one of the SELECT statements can be
-- modified with out modifying the other
SELECT Department.DepartmentID,
    'QA: ' + Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
    WHERE GroupName = 'Quality Assurance'
-- UNION
UNION ALL
SELECT Department.DepartmentID * 10,
    'R & D: ' + Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
    WHERE GroupName = 'R and D'
    UNION ALL
SELECT Department.DepartmentID * 10,
    'Manufacturing: ' + Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
    WHERE GroupName = 'Manufacturing'