-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-06-30
-- Description: OFFSET - is used to skip a specified number 
-- of rows at the beginning of a result set before returning 
-- the desired rows
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

ALTER PROCEDURE HumanResources.spDepartments_Get
    @GroupName [dbo].[Name] = NULL
    , @DepartmentName [dbo].[Name] = NULL
    , @PageNumber INT = 1
    , @RowsToReturn INT = 7                   
/*
    EXEC HumanResources.spDepartments_Get 
        @DepartmentName = 'R and D'
        , @GroupName = 'R and D'

    EXEC HumanResources.spDepartments_Get 
        @PageNumber = 2

    EXEC HumanResources.spDepartments_Get 
        @PageNumber = 3
        , @RowsToReturn = 5

    EXEC HumanResources.spDepartments_Get 
        @PageNumber = 3
*/

AS
BEGIN
    DECLARE @Offset INT = @RowsToReturn * (@PageNumber - 1)

    SELECT Department.DepartmentID,
        Department.[Name],
        Department.GroupName,
        Department.ModifiedDate
    FROM HumanResources.Department AS Department
        WHERE Department.GroupName = ISNULL(@GroupName, Department.GroupName)           
            AND Department.[Name] = ISNULL(@DepartmentName, Department.[Name])
    ORDER BY Department.GroupName, Department.[Name] 
    OFFSET @Offset ROWS FETCH NEXT @RowsToReturn ROWS ONLY
END
GO

-- Query to see the Table in order and check 
-- if @RowsToReturn @PageNumber is working correctly
SELECT Department.DepartmentID,
    Department.[Name],
    Department.GroupName,
    Department.ModifiedDate
FROM HumanResources.Department AS Department
ORDER BY Department.GroupName, Department.[Name] 