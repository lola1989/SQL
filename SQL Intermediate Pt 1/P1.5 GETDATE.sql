-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-28
-- Description: GETDATE: Returns current database system date & time
-- ----------------------------------------------------------------
USE [AdventureWorks2019]
GO

SELECT GETDATE() AS GetDate;
SELECT CURRENT_TIMESTAMP AS CurrentTimestamp;
SELECT SYSDATETIME() AS SysDateTime;
SELECT GETUTCDATE() AS UTCdate;