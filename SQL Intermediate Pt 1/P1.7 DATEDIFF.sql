-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-28
-- Description: DATEDIFF returns the difference between two dates, 
-- as an integer.
-- DATEDIFF(interval, date1, date2)
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

-- Date1 - Date2
-- Smaller date should come first
SELECT DATEDIFF(YEAR, GETDATE(), DATEADD(YEAR, 20, GETDATE())),
    DATEDIFF(DAY, GETDATE(), DATEADD(YEAR, 1, GETDATE()));

