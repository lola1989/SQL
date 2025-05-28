-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-28
-- Description: NULLIF
-- NULLIF() function returns NULL if two expressions are equal, 
-- otherwise it returns the first expression
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Query to obtain Null values along with COALESCE & other requests
SELECT [Person].[BusinessEntityID],
    [Person].[PersonType],
    [Person].[Title],
    ISNULL([Person].[Title], '') AS IsNullTitle,                                     -- Adding new colum for if titleis Null, then replace with blank
    [Person].[FirstName],
    [Person].[MiddleName],
    ISNULL([Person].[MiddleName], 'No Middle Name') AS  IsNullMiddleName,            -- Adding new colum for if middle name is Null, then replace with text
    COALESCE([Person].[MiddleName], [Person].[Title], '') AS CoalesceMiddle,         -- Using COALESCE for if middle name is Null, then replace with assigned value
    NULLIF([Person].[MiddleName], 'A') AS NullIfMiddle,                              -- Using NULLIF to show if MiddleName is A it will be Null isntead
    ISNULL(NULLIF([Person].[MiddleName], 'A'), [Person].[Title]),                    -- Wrap NullIF in ISNULL - if middle name is A, nullify it then replace new values
    [Person].[LastName]
FROM Person.Person AS Person
WHERE ISNULL(Title, '') <> 'Mr.'                                                     -- ISNULL is used to bring in the Null values as well