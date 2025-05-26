----------------------------------------------------------------
-- Create a new database called 'TestDatabase'
-- GO seperates out different queries from each other and
-- will run all queries individually
----------------------------------------------------------------
USE master

DROP DATABASE IF EXISTS TestDatabase
CREATE DATABASE TestDatabase

GO
----------------------------------------------------------------
-- Create a new schema called 'Inventory'
----------------------------------------------------------------
USE TestDatabase
GO

DROP SCHEMA IF Exists Inventory
GO

CREATE SCHEMA Inventory