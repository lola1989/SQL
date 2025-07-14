-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-25
-- Description: CREATE Stored Procedures
-- is SQL code that you can save, so the code can be 
-- reused over and over again.
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- CREATE PROCEDURE SchemaName.spTableName_Action
-- CREATE PROCEDURE HumanResources.spDepartments_Get
-- AS
-- BEGIN
--     SELECT * FROM HumanResources.Department

-- END


-- -- Calling  the Stored Procedure
-- EXEC HumanResources.spDepartments_Get


--------------------------------------------------------------------
-- How to properly write out the Stored Procedure

CREATE OR ALTER PROCEDURE HumanResources.spDepartments_Get
/*
    EXEC HumanResources.spDepartments_Get

*/
AS
BEGIN
    SELECT Department.DepartmentID,
    Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department

END

