CREATE OR ALTER PROCEDURE bronze.load_bronze_final
AS
BEGIN

    SET NOCOUNT ON;

    DECLARE @start_time DATETIME;
    DECLARE @end_time DATETIME;

    PRINT '=========================================';
    PRINT 'Starting Bronze Layer Load';
    PRINT '=========================================';

    BEGIN TRY

    /*========================================================
      CRM TABLES
    ========================================================*/

    PRINT ' ';
    PRINT '=========== Loading CRM Tables ===========';


    --=====================================================
    -- crm_cust_info
    --=====================================================
    SET @start_time = GETDATE();

    PRINT 'Loading table: bronze.crm_cust_info';
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @start_time, 120);

    TRUNCATE TABLE bronze.crm_cust_info;

    BULK INSERT bronze.crm_cust_info
    FROM 'C:\Users\pande\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @end_time = GETDATE();

    PRINT 'Completed: bronze.crm_cust_info';
    PRINT 'End Time: ' + CONVERT(VARCHAR, @end_time, 120);
    PRINT 'Duration (Seconds): ' 
          + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);


    --=====================================================
    -- crm_prod_info
    --=====================================================
    SET @start_time = GETDATE();

    PRINT ' ';
    PRINT 'Loading table: bronze.crm_prod_info';
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @start_time, 120);

    TRUNCATE TABLE bronze.crm_prod_info;

    BULK INSERT bronze.crm_prod_info
    FROM 'C:\Users\pande\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @end_time = GETDATE();

    PRINT 'Completed: bronze.crm_prod_info';
    PRINT 'End Time: ' + CONVERT(VARCHAR, @end_time, 120);
    PRINT 'Duration (Seconds): '
          + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);


    --=====================================================
    -- crm_sales_details
    --=====================================================
    SET @start_time = GETDATE();

    PRINT ' ';
    PRINT 'Loading table: bronze.crm_sales_details';
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @start_time, 120);

    TRUNCATE TABLE bronze.crm_sales_details;

    BULK INSERT bronze.crm_sales_details
    FROM 'C:\Users\pande\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @end_time = GETDATE();

    PRINT 'Completed: bronze.crm_sales_details';
    PRINT 'End Time: ' + CONVERT(VARCHAR, @end_time, 120);
    PRINT 'Duration (Seconds): '
          + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);


    /*========================================================
      ERP TABLES
    ========================================================*/

    PRINT ' ';
    PRINT '=========== Loading ERP Tables ===========';


    --=====================================================
    -- erp_CUST_AZ12
    --=====================================================
    SET @start_time = GETDATE();

    PRINT ' ';
    PRINT 'Loading table: bronze.erp_CUST_AZ12';
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @start_time, 120);

    TRUNCATE TABLE bronze.erp_CUST_AZ12;

    BULK INSERT bronze.erp_CUST_AZ12
    FROM 'C:\Users\pande\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @end_time = GETDATE();

    PRINT 'Completed: bronze.erp_CUST_AZ12';
    PRINT 'End Time: ' + CONVERT(VARCHAR, @end_time, 120);
    PRINT 'Duration (Seconds): '
          + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);


    --=====================================================
    -- erp_LOC_A101
    --=====================================================
    SET @start_time = GETDATE();

    PRINT ' ';
    PRINT 'Loading table: bronze.erp_LOC_A101';
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @start_time, 120);

    TRUNCATE TABLE bronze.erp_LOC_A101;

    BULK INSERT bronze.erp_LOC_A101
    FROM 'C:\Users\pande\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @end_time = GETDATE();

    PRINT 'Completed: bronze.erp_LOC_A101';
    PRINT 'End Time: ' + CONVERT(VARCHAR, @end_time, 120);
    PRINT 'Duration (Seconds): '
          + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);


    --=====================================================
    -- erp_px_cat_g1v2
    --=====================================================
    SET @start_time = GETDATE();

    PRINT ' ';
    PRINT 'Loading table: bronze.erp_px_cat_g1v2';
    PRINT 'Start Time: ' + CONVERT(VARCHAR, @start_time, 120);

    TRUNCATE TABLE bronze.erp_px_cat_g1v2;

    BULK INSERT bronze.erp_px_cat_g1v2
    FROM 'C:\Users\pande\Downloads\dbc9660c89a3480fa5eb9bae464d6c07\sql-data-warehouse-project\datasets\source_erp\px_cat_g1v2.csv'
    WITH (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '\n',
        TABLOCK
    );

    SET @end_time = GETDATE();

    PRINT 'Completed: bronze.erp_px_cat_g1v2';
    PRINT 'End Time: ' + CONVERT(VARCHAR, @end_time, 120);
    PRINT 'Duration (Seconds): '
          + CAST(DATEDIFF(SECOND, @start_time, @end_time) AS VARCHAR);


    PRINT ' ';
    PRINT '=========================================';
    PRINT 'Bronze Layer Load Completed Successfully';
    PRINT '=========================================';

    END TRY

    BEGIN CATCH

        PRINT ' ';
        PRINT '=========================================';
        PRINT 'ERROR OCCURRED DURING LOAD';
        PRINT '=========================================';

        PRINT 'Error Number  : ' + CAST(ERROR_NUMBER() AS VARCHAR(20));
        PRINT 'Error Message : ' + ERROR_MESSAGE();
        PRINT 'Error Line    : ' + CAST(ERROR_LINE() AS VARCHAR(20));

    END CATCH

END;
