-- ----------------------------------------------------------------
-- Author: Lillian ELek
-- Create date: 2025-05-25
-- Description: Create a new database called 'TestDatabase'
-- Create a new schema called 'Inventory'
-- ----------------------------------------------------------------
 USE master

DROP DATABASE IF EXISTS TestDatabase
CREATE DATABASE TestDatabase

GO
-- GO seperates out different queries from each other and
-- will run all queries individually

-- Create a new schema called 'Inventory'

USE TestDatabase
GO

DROP SCHEMA IF Exists Inventory
GO

CREATE SCHEMA Inventory