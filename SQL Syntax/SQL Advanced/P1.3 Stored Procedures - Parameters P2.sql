-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-30
-- Description: Stored Procedures - Parameters: 
-- a variable that allows you to pass data into the procedure 
-- and, in some cases, receive data back from it
-- They enable stored procedures to be dynamic and reusable, 
-- eliminating the need to hardcode values directly into the 
-- procedure's code
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

ALTER PROCEDURE HumanResources.spDepartments_Get
    @GroupName [dbo].[Name] = NULL
    , @DepartmentName [dbo].[Name] = NULL                   
/*
    EXEC HumanResources.spDepartments_Get 
        @DepartmentName = 'R and D'
        , @GroupName = 'R and D'
        
*/
AS
BEGIN
    SELECT Department.DepartmentID,
        Department.[Name],
        Department.GroupName,
        Department.ModifiedDate
    FROM HumanResources.Department AS Department
        WHERE Department.GroupName = ISNULL(@GroupName, Department.GroupName)           -- Makes the Paramater Nullable
            AND Department.[Name] = ISNULL(@DepartmentName, Department.[Name])
END
GO

