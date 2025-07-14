-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: UPDATE values in a table
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

SET NOCOUNT ON;

-- UPDATE SET
SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate]
FROM HumanResources.Department

-- UPDATE [TABLE_NAME] SET [COLUMN] TO VALUE WHERE
-- best practice is to use ID in WHERE clause
UPDATE HumanResources.Department SET [NAME] = 'R and D'
WHERE DepartmentID = 6