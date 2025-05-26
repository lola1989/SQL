----------------------------------------------------------------
-- Custom Types on Scalar variables
----------------------------------------------------------------
USE TestDatabase
GO

-- CREATE TYPE (String) on default schema (dbo)
CREATE TYPE dbo.String FROM VARCHAR(255)

-- CREATE Scalar variable
DECLARE @MyString dbo.String = 'Up to 255 unicode characters that will take 1 byte each'

SELECT @MyString


-- View all of the types in database
SELECT * FROM sys.types

-- user_type_id = type_id &
-- if system_type_id /= user_type_id 
-- then the system_type_id is based on another name
-- the one where system_type_id matches the user_type_id
-- example is String system_type_id = 167 = varchar user_type_id = 167