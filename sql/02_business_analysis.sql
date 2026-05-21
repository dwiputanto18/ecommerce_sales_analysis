/* ====================================
   CHECK BUSINESS VALUE VALIDATION
==================================== */

SELECT
    MIN(sales) AS min_sales,
    MAX(sales) AS max_sales,
    AVG(sales) AS avg_sales,

    MIN(profit) AS min_profit,
    MAX(profit) AS max_profit,
    AVG(profit) AS avg_profit,

    MIN(quantity) AS min_quantity,
    MAX(quantity) AS max_quantity,
    AVG(quantity) AS avg_quantity
FROM sales_data;

/* ====================================
   BUSINESS OVERVIEW KPI
==================================== */

SELECT
    COUNT(*) AS total_orders,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(sales) AS average_sales,
    AVG(profit) AS average_profit,
    SUM(quantity) AS total_quantity
FROM sales_data;

/* ====================================
   MONTHLY SALES TREND
==================================== */

SELECT
    YEAR(order_date_clean) AS year,
    MONTH(order_date_clean) AS month,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    COUNT(*) AS total_orders
FROM sales_data
GROUP BY
    YEAR(order_date_clean),
    MONTH(order_date_clean)
ORDER BY
    year,
    month;
    
    /* ====================================
   CATEGORY PERFORMANCE ANALYSIS
==================================== */

SELECT
    category,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(sales) AS average_sales,
    AVG(profit) AS average_profit
FROM sales_data
GROUP BY category
ORDER BY total_sales DESC;

/* ====================================
   REGIONAL PERFORMANCE ANALYSIS
==================================== */

SELECT
    region,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    AVG(sales) AS average_sales,
    AVG(profit) AS average_profit
FROM sales_data
GROUP BY region
ORDER BY total_sales DESC;

/* ====================================
   TOP PRODUCT ANALYSIS
==================================== */

SELECT
    product_name,
    category,
    COUNT(*) AS total_orders,
    SUM(quantity) AS total_quantity,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM sales_data
GROUP BY
    product_name,
    category
ORDER BY total_sales DESC
LIMIT 10;