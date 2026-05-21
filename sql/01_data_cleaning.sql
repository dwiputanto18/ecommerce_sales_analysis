/*==========================
 DATA CLEANING
 =========================== */
 
 -- Check Structure
describe sales_data ;

/* ====================================
   CONVERT ORDER DATE TO DATE
==================================== */

alter table sales_data
add column order_date_clean date;

/* ====================================
   DISABLE SAFE UPDATE
==================================== */

SET SQL_SAFE_UPDATES = 0;

/* ====================================
   CLEAN DATE COLUMN
==================================== */

update sales_data
set order_date_clean =
str_to_date(`Order Date`, '%Y-%m-%d');

describe sales_data;

/* ====================================
   RENAME COLUMNS
==================================== */

ALTER TABLE sales_data
RENAME COLUMN `Order Date` TO order_date;

ALTER TABLE sales_data
RENAME COLUMN `Product Name` TO product_name;

ALTER TABLE sales_data
RENAME COLUMN `Category` TO category;

ALTER TABLE sales_data
RENAME COLUMN `Region` TO region;

ALTER TABLE sales_data
RENAME COLUMN `Quantity` TO quantity;

ALTER TABLE sales_data
RENAME COLUMN `Sales` TO sales;

ALTER TABLE sales_data
RENAME COLUMN `Profit` TO profit;

/* ====================================
   CHECK NULL VALUES
==================================== */

SELECT
    SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
    SUM(CASE WHEN product_name IS NULL THEN 1 ELSE 0 END) AS null_product_name,
    SUM(CASE WHEN category IS NULL THEN 1 ELSE 0 END) AS null_category,
    SUM(CASE WHEN region IS NULL THEN 1 ELSE 0 END) AS null_region,
    SUM(CASE WHEN quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
    SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS null_sales,
    SUM(CASE WHEN profit IS NULL THEN 1 ELSE 0 END) AS null_profit
FROM sales_data;

/* ====================================
   CHECK DUPLICATE DATA
==================================== */

SELECT
    order_date,
    product_name,
    category,
    region,
    quantity,
    sales,
    profit,
    COUNT(*) AS total_duplicate
FROM sales_data
GROUP BY
    order_date,
    product_name,
    category,
    region,
    quantity,
    sales,
    profit
HAVING COUNT(*) > 1;

