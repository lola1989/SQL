-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: Using WHERE Statements and understanding operators
-- ----------------------------------------------------------------
USE AdventureWorks2019
GO

SELECT [DepartmentID],
    [Name],
    [GroupName],
    [ModifiedDate] 
FROM HumanResources.Department
-- WHERE DepartmentID > 7
-- WHERE [Name] = 'Production Control'
-- WHERE GroupName = 'Manufacturing'
-- WHERE [Name] LIKE 'Production%'
-- WHERE DepartmentID = 7
-- WHERE DepartmentID <> 7
-- WHERE GroupName <> 'Manufacturing'
-- WHERE GroupName IS NULL
-- WHERE GroupName IS NOT NULL
-- WHERE DepartmentID IN (7,11)
-- WHERE [Name] IN ('Production','Sales')
WHERE DepartmentID BETWEEN 10 AND 14 
OR GroupName = 'Manufacturing'




-- % is a wildcard to use with LIKE to find similiar strings
-- % can be used before, after, or on both ends to include
-- SQL has an easier time searching for known text before %

/*
Operator	    Description	
=	            Equal	
>	            Greater than	
<	            Less than	
>=	            Greater than or equal	
<=	            Less than or equal	
<>	            Not equal. Note: In some versions of SQL this operator may be written as !=	
BETWEEN	        Between a certain range	- include listed values
LIKE	        Search for a pattern	
IN	            To specify multiple possible values for a column
*/

