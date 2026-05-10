USE DataWarehouse;
GO

/*========================================================
    CREATE BRONZE SCHEMA
========================================================*/

IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze');
END;
GO


/*========================================================
    DROP TABLES IF EXISTS
========================================================*/

DROP TABLE IF EXISTS bronze.crm_cust_info;
DROP TABLE IF EXISTS bronze.crm_prod_info;
DROP TABLE IF EXISTS bronze.crm_sales_details;
DROP TABLE IF EXISTS bronze.erp_CUST_AZ12;
DROP TABLE IF EXISTS bronze.erp_loc_a101;
DROP TABLE IF EXISTS bronze.erp_px_cat_g1v2;
GO


/*========================================================
    CREATE TABLE : bronze.crm_cust_info
========================================================*/

CREATE TABLE bronze.crm_cust_info (
    cst_id              INT,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(100),
    cst_lastname        VARCHAR(100),
    cst_marital_status  VARCHAR(20),
    cst_gndr            VARCHAR(10),
    cst_create_date     DATE
);
GO


/*========================================================
    CREATE TABLE : bronze.crm_prod_info
========================================================*/

CREATE TABLE bronze.crm_prod_info (
    prd_id         INT,
    prd_key        VARCHAR(50),
    prd_nm         VARCHAR(200),
    prd_cost       DECIMAL(10,2),
    prd_line       VARCHAR(100),
    prd_start_dt   DATE,
    prd_end_dt     DATE
);
GO


/*========================================================
    CREATE TABLE : bronze.crm_sales_details
========================================================*/

CREATE TABLE bronze.crm_sales_details (
    sls_ord_num     VARCHAR(50),
    sls_prd_key     VARCHAR(50),
    sls_cust_id     INT,
    sls_order_dt    DATE,
    sls_ship_dt     DATE,
    sls_due_dt      DATE,
    sls_sales       DECIMAL(12,2),
    sls_quantity    INT,
    sls_price       DECIMAL(12,2)
);
GO


/*========================================================
    CREATE TABLE : bronze.erp_CUST_AZ12
========================================================*/

CREATE TABLE bronze.erp_CUST_AZ12 (
    CID              VARCHAR(40),
    BDATE            DATE,
    GEN              VARCHAR(10)
);
GO


/*========================================================
    CREATE TABLE : bronze.erp_loc_a101
========================================================*/

CREATE TABLE bronze.erp_loc_a101 (
    CID      VARCHAR(40),
    CNTRY    VARCHAR(100)
);
GO


/*========================================================
    CREATE TABLE : bronze.erp_px_cat_g1v2
========================================================*/

CREATE TABLE bronze.erp_px_cat_g1v2 (
    ID             VARCHAR(50),
    CAT            VARCHAR(100),
    SUBCAT         VARCHAR(100),
    MAINTENANCE    VARCHAR(50)
);
GO


PRINT '=========================================';
PRINT 'Bronze Layer Tables Created Successfully';
PRINT '=========================================';
GO
