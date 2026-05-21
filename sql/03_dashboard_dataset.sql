/* ====================================
   MASTER DASHBOARD DATASET
==================================== */

CREATE TABLE master_sales_dashboard AS

SELECT
    order_date_clean,
    YEAR(order_date_clean) AS year,
    MONTH(order_date_clean) AS month,

    product_name,
    category,
    region,

    quantity,
    sales,
    profit,

    ROUND(
        (profit / sales) * 100,
        2
    ) AS profit_margin_percentage

FROM sales_data;

SELECT *
FROM master_sales_dashboard
LIMIT 10;