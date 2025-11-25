/*
===============================================================================
Stored Procedure: Loads data from sources to the Bronze Schema
-------------------------------------------------------------------------------
Script Purpose:
    This stored procedure loads data from csv files to the Bronze schema, which
    - truncates tables before loading data; and
    - uses 'BULK INSERT' to load data from csv files to the Bronze schema.

Example:
    EXEC bronze.load_bronze;
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
    BEGIN TRY
        TRUNCATE TABLE bronze.source1_transactions;
        BULK INSERT bronze.source1_transactions
        FROM 'D:\sql-warehouse-retail-sales-project\datasets\source1\transactions.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.source2_customers;
        BULK INSERT bronze.source2_customers
        FROM 'D:\sql-warehouse-retail-sales-project\datasets\source2\customers.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );

        TRUNCATE TABLE bronze.source2_products;
        BULK INSERT bronze.source2_products
        FROM 'D:\sql-warehouse-retail-sales-project\datasets\source2\products.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            TABLOCK
        );
    END TRY
    BEGIN CATCH
        -- Handle error, optionally rethrow or log
        DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
        RAISERROR('Error occurred during bronze layer load: %s', 16, 1, @ErrorMessage);
    END CATCH
END;
