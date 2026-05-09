use master;
--create new database--
create database DataWarehouse;

---start using new database--
use DataWarehouse;

--create schema for the new data warehouse--
--create bronze schema--
create schema bronze;
Go
--create silver schema--
create schema silver;
Go

--create gold schema--
create schema gold;
Go
