-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-26
-- Description: RESTORE Adventureworks backup
-- Run a command similar to the below, but with the correct 
-- path to these files and folders in your computer:
-- Run SELECT statement first to obtain the correct path
-- ----------------------------------------------------------------
USE master

-- Check where the Data Files are located on your machine to set the TO value by checking the results of this query:
SELECT * FROM sys.database_files
 
RESTORE FILELISTONLY FROM  DISK = N'AdventureWorks2019.bak' 
 
RESTORE DATABASE AdventureWorks2019 FROM  DISK = N'AdventureWorks2019.bak' 
WITH MOVE N'AdventureWorks2019' TO N'AdventureWorks2019.mdf',  
     MOVE N'AdventureWorks2019_log' TO N'AdventureWorks2019.ldf'

