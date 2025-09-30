DROP TABLE Orders;

CREATE TABLE Orders (
    "Order ID" INT,
    "Product ID" INT,
    "Product" VARCHAR(255),
    "Product State" VARCHAR(255),
    "Selling Price" FLOAT,
    "Product Cost" FLOAT,
    "Quantity" INT
);

CREATE TABLE Customer_Orders (
    "Name" VARCHAR(255),
    "Order ID" INT PRIMARY KEY, -- We'll make Order ID the primary key here
    "Order Date" DATE,
    "Product ID" INT,
    "City" VARCHAR(255),
    "State" VARCHAR(255)
);


ALTER TABLE Orders
ADD FOREIGN KEY ("Order ID") REFERENCES Customer_Orders("Order ID");

select count(*) from Customer_Orders;
select count(*) from Orders;


--Use EXTRACT(MONTH FROM order_date) for month.
SELECT
    "Order Date",
    EXTRACT(MONTH FROM "Order Date") AS order_month,
    EXTRACT(YEAR FROM "Order Date") AS order_year
FROM
    Customer_Orders;

--GROUP BY year/month.
SELECT
    EXTRACT(YEAR FROM "Order Date") AS sales_year,
    EXTRACT(MONTH FROM "Order Date") AS sales_month
    -- Aggregate functions will go here
FROM
    Customer_Orders
GROUP BY
    sales_year,
    sales_month;

--Use SUM() for revenue.

SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue,
    COUNT(DISTINCT o."Order ID") AS monthly_order_volume
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_year,
    sales_month;
	
--COUNT(DISTINCT order_id) for volume.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue,
    COUNT(DISTINCT o."Order ID") AS monthly_order_volume
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
GROUP BY
    sales_year,
    sales_month;

--Use ORDER BY for sorting.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue,
    COUNT(DISTINCT o."Order ID") AS monthly_order_volume
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_year ASC, sales_month ASC;

--Limit results for specific time periods.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
WHERE
    EXTRACT(YEAR FROM co."Order Date") = 2023
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_month;


--Get the top 3 months with the highest revenue.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
GROUP BY
    sales_year,
    sales_month
ORDER BY
    monthly_revenue DESC -- Sort from highest to lowest revenue
LIMIT 3; -- Get only the top 3 rows


--Business Problem 
--1: Marketing and Inventory Planning
-- Get the top 3 months with the highest revenue.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
GROUP BY
    sales_year,
    sales_month
ORDER BY
    monthly_revenue DESC -- Sort from highest to lowest revenue
LIMIT 3; -- Get only the top 3 rows

--2: Annual Performance Review
-- Get the monthly revenue trend for the year 2023.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
WHERE
    EXTRACT(YEAR FROM co."Order Date") = 2023 -- Filter for a specific year
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_month;

--3: Understanding Customer Behavior and Business Health
-- Get a full monthly report of revenue and order volume.
SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue,
    COUNT(DISTINCT o."Order ID") AS monthly_order_volume
FROM
    Customer_Orders co
JOIN
    Orders o ON co."Order ID" = o."Order ID"
GROUP BY
    sales_year,
    sales_month
ORDER BY
    sales_year,
    sales_month;
