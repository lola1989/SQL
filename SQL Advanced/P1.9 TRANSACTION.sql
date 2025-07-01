-- ----------------------------------------------------------------
-- Author: Lillian Elek 
-- Create date: 2025-07-01
-- Description: TRANSACTION - creates an isolated environment 
-- can be committed to the database or roll it back
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO


BEGIN TRANSACTION

    SELECT * FROM HumanResources.DepartmentCopy

    -- Adding a Data departement using INSERT INTO
    INSERT INTO HumanResources.DepartmentCopy (
         [Name],
        [GroupName],
        [ModifiedDate] )
    SELECT
        [Name],
        [GroupName],
        [ModifiedDate]
    FROM HumanResources.Department


    -- Removes all data from the table
    --TRUNCATE TABLE HumanResources.DepartmentCopy

-- Rolls back the transaction - undo
ROLLBACK TRANSACTION

-- Commits the transaction
COMMIT TRANSACTION



