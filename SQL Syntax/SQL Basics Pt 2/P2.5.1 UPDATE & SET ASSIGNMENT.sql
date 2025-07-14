-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: UPDATE Assignment
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
WHERE GroupName = 'Research and Development'

-- UPDATE [TABLE_NAME] SET [COLUMN] TO VALUE WHERE
-- update the "GroupName" field in the HumanResources.Department 
-- table from "Research and Development" to "R and D".
-- best practice is to use ID in WHERE clause but not always ideal for multiple rows
UPDATE HumanResources.Department SET [GroupName] = 'R and D'
WHERE GroupName = 'Research and Development'