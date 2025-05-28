-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-28
-- Description: DATEADD - used to add or subtract a int to a date
-- DATEADD(interval, number, date)
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

SELECT GETDATE() AS GetDate,
    DATEADD(SECOND, 20, GETDATE()) AS SecondAdd,
    DATEADD(MINUTE, 20, GETDATE()) AS MinuiteAdd,
    DATEADD(HOUR, 20, GETDATE()) AS HourAdd,
    DATEADD(DAY, 20, GETDATE()) AS DayAdd,
    DATEADD(WEEK, 20, GETDATE()) AS WeekAdd,
    DATEADD(YEAR, 20, GETDATE()) AS YearAdd,
    DATEADD(MINUTE, -20, GETDATE()) AS DateAddNeg;

