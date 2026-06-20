/*
=============================================================
Stored Procedure: bronze.load_bronze
=============================================================

Purpose:
    Loads raw data into the Bronze layer of the Data Warehouse.

Description:
    - Performs Full Load (Truncate & Load) operation.
    - Removes existing data from Bronze tables.
    - Loads fresh data from CRM and ERP CSV source files.
    - Uses BULK INSERT for efficient data ingestion.
    - Tracks individual table loading duration.
    - Tracks total batch execution time.
    - Includes TRY-CATCH error handling.

Source Systems:

    CRM Source:
        - cust_info.csv
        - prd_info.csv
        - sales_details.csv

    ERP Source:
        - CUST_AZ12.csv
        - LOC_A101.csv
        - PX_CAT_G1V2.csv


Target Tables:

    CRM Tables:
        - bronze.crm_cust_info
        - bronze.crm_prd_info
        - bronze.crm_sales_details

    ERP Tables:
        - bronze.erp_cust_az12
        - bronze.erp_loc101
        - bronze.erp_px_cat_g1v2


Execution:
    EXEC bronze.load_bronze;


=============================================================
*/


ALTER PROCEDURE bronze.load_bronze
AS
BEGIN

    DECLARE @start_time DATETIME,
            @end_time DATETIME,
            @batch_start_time DATETIME,
            @batch_end_time DATETIME;


    BEGIN TRY

        SET @batch_start_time = GETDATE();


        PRINT '=====================================';
        PRINT 'Loading Bronze Layer';
        PRINT '=====================================';



        --=====================================================
        -- Load CRM Customer Information
        --=====================================================

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table : bronze.crm_cust_info';
        TRUNCATE TABLE bronze.crm_cust_info;


        PRINT '>> Inserting data into: bronze.crm_cust_info';

        BULK INSERT bronze.crm_cust_info
        FROM 'C:\Users\RITIK\Downloads\Software\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\cust_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );


        SET @end_time = GETDATE();

        PRINT '>> bronze.crm_cust_info Load Duration '
        + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR(50))
        + ' Seconds';

        PRINT '>>---------------';



        --=====================================================
        -- Load CRM Product Information
        --=====================================================

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table : bronze.crm_prd_info';
        TRUNCATE TABLE bronze.crm_prd_info;


        PRINT '>> Inserting data into: bronze.crm_prd_info';

        BULK INSERT bronze.crm_prd_info
        FROM 'C:\Users\RITIK\Downloads\Software\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\prd_info.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );


        SET @end_time = GETDATE();

        PRINT '>> bronze.crm_prd_info Load Duration '
        + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR(50))
        + ' Seconds';

        PRINT '>>---------------';



        --=====================================================
        -- Load CRM Sales Details
        --=====================================================

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table : bronze.crm_sales_details';
        TRUNCATE TABLE bronze.crm_sales_details;


        PRINT '>> Inserting data into: bronze.crm_sales_details';

        BULK INSERT bronze.crm_sales_details
        FROM 'C:\Users\RITIK\Downloads\Software\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_crm\sales_details.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );


        SET @end_time = GETDATE();

        PRINT '>> bronze.crm_sales_details Load Duration '
        + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR(50))
        + ' Seconds';

        PRINT '>>---------------';



        --=====================================================
        -- Load ERP Customer
        --=====================================================

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table : bronze.erp_cust_az12';
        TRUNCATE TABLE bronze.erp_cust_az12;


        PRINT '>> Inserting data into: bronze.erp_cust_az12';

        BULK INSERT bronze.erp_cust_az12
        FROM 'C:\Users\RITIK\Downloads\Software\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\CUST_AZ12.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );


        SET @end_time = GETDATE();

        PRINT '>> bronze.erp_cust_az12 Load Duration '
        + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR(50))
        + ' Seconds';

        PRINT '>>---------------';



        --=====================================================
        -- Load ERP Location
        --=====================================================

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table : bronze.erp_loc101';
        TRUNCATE TABLE bronze.erp_loc101;


        PRINT '>> Inserting data into: bronze.erp_loc101';

        BULK INSERT bronze.erp_loc101
        FROM 'C:\Users\RITIK\Downloads\Software\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\LOC_A101.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );


        SET @end_time = GETDATE();

        PRINT '>> bronze.erp_loc101 Load Duration '
        + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR(50))
        + ' Seconds';

        PRINT '>>---------------';



        --=====================================================
        -- Load ERP Product Category
        --=====================================================

        SET @start_time = GETDATE();

        PRINT '>> Truncating Table : bronze.erp_px_cat_g1v2';
        TRUNCATE TABLE bronze.erp_px_cat_g1v2;


        PRINT '>> Inserting data into: bronze.erp_px_cat_g1v2';

        BULK INSERT bronze.erp_px_cat_g1v2
        FROM 'C:\Users\RITIK\Downloads\Software\sql-data-warehouse-project-main\sql-data-warehouse-project-main\datasets\source_erp\PX_CAT_G1V2.csv'
        WITH (
            FIRSTROW = 2,
            FIELDTERMINATOR = ',',
            ROWTERMINATOR = '\n',
            TABLOCK
        );


        SET @end_time = GETDATE();

        PRINT '>> bronze.erp_px_cat_g1v2 Load Duration '
        + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR(50))
        + ' Seconds';

        PRINT '>>---------------';



        --=====================================================
        -- Batch Completion Time
        --=====================================================

        SET @batch_end_time = GETDATE();


        PRINT '=====================================';
        PRINT 'Bronze Layer Loaded Successfully';
        PRINT '=====================================';


        PRINT '>> TOTAL TIME TO LOAD THE DATA '
        + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR(50))
        + ' Seconds';


        PRINT '=====================================';



    END TRY



    BEGIN CATCH


        PRINT '=====================================';
        PRINT 'ERROR OCCURRED DURING LOADING';
        PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS NVARCHAR(50));
        PRINT '=====================================';


    END CATCH


END;
GO
