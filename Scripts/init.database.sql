/*
=========================================================
Data Warehouse Initialization Script
=========================================================
Database  : DataWarehouse
Architecture : Medallion (Bronze, Silver, Gold)

Bronze Layer : Raw source data
Silver Layer : Cleaned and transformed data
Gold Layer   : Business-ready analytical models
=========================================================
*/

-- Create Database
CREATE DATABASE DataWarehouse;
GO

-- Switch to Database
USE DataWarehouse;
GO

-- Bronze Schema (Raw Data Layer)
CREATE SCHEMA bronze;
GO

-- Silver Schema (Transformation Layer)
CREATE SCHEMA silver;
GO

-- Gold Schema (Business Layer)
CREATE SCHEMA gold;
GO
