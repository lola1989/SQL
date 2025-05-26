-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: DELETE STATEMENTS
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

SET NOCOUNT ON;

-- DELETE the Production Department
SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate]
FROM HumanResources.Department
WHERE DepartmentID = 7

DELETE FROM HumanResources.Department
WHERE DepartmentID = 7

-- ERROR
-- Msg 547, Level 16, State 0, Line 1
-- The DELETE statement conflicted with the REFERENCE constraint 
-- "FK_EmployeeDepartmentHistory_Department_DepartmentID". 
-- The conflict occurred in database "AdventureWorks2019", table 
-- "HumanResources.EmployeeDepartmentHistory", column 'DepartmentID'.
-- The statement has been terminated.

DELETE FROM HumanResources.EmployeeDepartmentHistory
WHERE DepartmentID = 7

SELECT * FROM HumanResources.EmployeeDepartmentHistory
WHERE DepartmentID = 7