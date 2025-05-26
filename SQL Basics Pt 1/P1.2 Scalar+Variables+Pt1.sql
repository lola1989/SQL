----------------------------------------------------------------
-- Scalar Variables are variables that hold a single value
-- such as a number, string, date, or 
-- boolean—not a set or a table. 
-- They only hold during the query
----------------------------------------------------------------

USE TestDatabase;
GO

DECLARE @IntegerValue INT = 7                                   -- Whole Number - 32 Bit MAX 2,147,483,647
        , @LargeIntegerValue BIGINT                             -- Whole Number - 64 Bit MAX 9,223,372,036,854,775,807
        , @SmallerIntegerValue SMALLINT                         -- Whole Number - 16 Bit MAX 32,767
        , @TinyIntegerValue TINYINT                             -- Whole Number - 8 Bit MAX 255
        , @FloatDecimal FLOAT                                   -- 32 Bit
        , @DoubleDecimal DOUBLE PRECISION                       -- 64 Bit
        , @RegularDecimal DECIMAL(18, 4)                        -- 128 Bit
        , @NumericDecimal NUMERIC(18, 4)                        -- 128 Bit Same as Decimal
                                                                -- FurnitureId UNIQUEIDENTIFIER -- GREATER THAN 9,223,372,036,854,775,807 options
        , @CharType CHAR(255)                                   --'chair'(255 Bytes) --1 byte per character (255 Bits)
        , @VarcharType VARCHAR(255)                             --'chair'(7 Bytes) --1 byte per character (8 Bits) + 2 byte to store the length of the string
                                                                -- 255 myth - used to only take 1 byte to store the length for less than 256
        , @VarcharTypeLarger VARCHAR(256)                       --'chair'(7 Bytes) --1 byte per character (8 Bits) + 2 bytes to store the length of the string - max 8000 characters
        , @NvarcharType NVARCHAR(255)                           --'chair'(12 Bytes) --2 byte per character (16 Bits) + 2 bytes to store the length of the string 
                                                                -- can store non unicode variables - max of 4000 characters
        , @Discontinued BIT                                     -- 0/1 -- 1 byte (8 Bits) in size (Buy 1 get 7 Free in the same table)
        , @ReleaseDate DATE --'2024-08-2
        , @CreateDate DATETIME --'2024-08-25 15:
        , @CreateDateTime DATETIME2 --'2024-08-25 15:00:00:00'; -- Ultra percise

SELECT @IntegerValue

----------------------------------------------------------------
-- SET is used to SET the value of a scalar variable
----------------------------------------------------------------

SET @IntegerValue = 10;
SELECT @IntegerValue
GO