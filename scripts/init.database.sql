/* 
=============================================
Create Database and Schemas
=============================================

Script Purpose:
    The following script creates a new database named 'DataWarehouse' after checking if it is already exists.
    If it exists, it then will be dropped, and then a new database with the same name will be created. 
    The script also creates three schemas in the database named 'bronze', 'silver', and 'gold'.

WARNING:
    Running this script with drop the 'DataWarehouse' database if it exists, thus all data in the database will be
    permanently deleted. Please proceed with caution and make sure that you have proper backups before running this script.
*/


-- Create the database DataWarehouse


USE master;
GO

-- Drop and recreate the database DataWarehouse if it exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
    ALTER DATABASE Datawarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE DataWarehouse;
END;
GO

CREATE DATABASE DataWarehouse;

USE DataWarehouse;

-- Create Schema

CREATE SCHEMA bronze;
GO
  
CREATE SCHEMA silver;
GO
  
CREATE SCHEMA gold;
GO
