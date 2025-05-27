-- ----------------------------------------------------------------
-- Author: Lillian Elek
-- Create date: 2025-05-27
-- Description: System catalog views and metadata functions
-- ----------------------------------------------------------------

-- Query all Tables, Views, and Table_Schemas 
SELECT * FROM INFORMATION_SCHEMA.TABLES ORDER BY TABLE_SCHEMA;
SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'Sales' --'your_db';

-- Query all Columns, and Data Types From a Select Table
SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME =  'SalesTaxRate' --'your_table_name';

-- Query all Tables
SELECT * FROM sys.tables;

-- Query Schema Information
SELECT * FROM sys.schemas;

-- Query Types Information
SELECT * FROM sys.types;

-- Query Constraints and Foreign Keys
SELECT * FROM sys.check_constraints;
SELECT * FROM sys.foreign_keys;

-- Check where the Data Files are located on your machine to set the TO value by checking the results of this query:
SELECT * FROM sys.database_files
