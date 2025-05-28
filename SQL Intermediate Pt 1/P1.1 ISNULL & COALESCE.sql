-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-28
-- Description: ISNULL & COALESCE
-- ISNULL is used to compare a null value to something else
-- COALESCE() function returns the first non-null value in a list.
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Query to obtain Null values along with other requests
SELECT [Person].[BusinessEntityID],
    [Person].[PersonType],
    [Person].[NameStyle],
    [Person].[Title],
    ISNULL([Person].[Title], ''),                               -- Adding new colum for if titleis Null, then replace with blank
    [Person].[FirstName],
    [Person].[MiddleName],
    ISNULL( [Person].[MiddleName], 'No Middle Name'),           -- Adding new colum for if middle name is Null, then replace with text
    ISNULL( [Person].[MiddleName], [Person].[FirstName]),       -- Adding new colum for if middle name is Null, then replace with Dynamic Value
    [Person].[LastName]
FROM Person.Person AS Person
WHERE ISNULL(Title, '') <> 'Mr.'                                -- ISNULL is used to bring in the Null values as well



-- Query to obtain Null values along with COALESCE & other requests
SELECT [Person].[BusinessEntityID],
    [Person].[PersonType],
    [Person].[NameStyle],
    [Person].[Title],
    ISNULL([Person].[Title], ''),                                       -- Adding new colum for if titleis Null, then replace with blank
    [Person].[FirstName],
    [Person].[MiddleName],
    ISNULL([Person].[MiddleName], 'No Middle Name'),                    -- Adding new colum for if middle name is Null, then replace with text
    COALESCE([Person].[MiddleName], [Person].[Title], ''),              -- Using COALESCE for if middle name is Null, then replace with assigned value
    [Person].[LastName]
FROM Person.Person AS Person
WHERE ISNULL(Title, '') <> 'Mr.'                                        -- ISNULL is used to bring in the Null values as well