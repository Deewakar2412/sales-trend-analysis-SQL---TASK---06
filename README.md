# 🛒 SQL Sales Trend Analysis (Internship Task 06)

![SQL](https://img.shields.io/badge/SQL-PostgreSQL%20%7C%20MySQL%20%7C%20SQLite-blue) 
![Level](https://img.shields.io/badge/Level-Beginner-green) 
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📑 Table of Contents
- [📌 Project Overview](#-project-overview)
- [🎯 Objectives](#-objectives)
- [🗂️ Project Structure](#️-project-structure)
- [📊 Data Analysis & Findings](#-data-analysis--findings)
- [🔎 Findings](#-findings)
- [📑 Reports](#-reports)
- [✅ Conclusion](#-conclusion)
- [🚀 How to Use](#-how-to-use)
- [👨‍💻 Author](#-author)
- [📜 License](#-license)

---

## 📌 Project Overview
**Project Title:** Sales Trend Analysis (Internship Task 06)  
**Level:** Beginner  
**Database:** PostgreSQL / MySQL / SQLite  

This project is part of the **Data Analyst Internship**. It demonstrates core SQL skills for analyzing sales data by calculating and interpreting **monthly revenue** and **order volume**.  
The analysis uncovers **time-based sales trends** and provides actionable insights for **business decision-making**.

---

## 🎯 Objectives
- **Database Setup:** Create schema with two related tables for customer orders and product details.  
- **Relationship Building:** Connect tables via **Foreign Key**.  
- **Data Aggregation:** Use **SUM()** and **COUNT(DISTINCT)** to compute KPIs.  
- **Business Analysis:** Answer real-world questions like revenue trends, peak months, and yearly performance.  

---

## 🗂️ Project Structure
### 1. Database Setup

```sql
-- Table: Customer Orders
CREATE TABLE Customer_Orders (
    "Name" VARCHAR(255),
    "Order ID" INT PRIMARY KEY,
    "Order Date" DATE,
    "Product ID" INT,
    "City" VARCHAR(255),
    "State" VARCHAR(255)
);

-- Table: Orders (Product & Pricing Details)
CREATE TABLE Orders (
    "Order ID" INT,
    "Product ID" INT,
    "Product" VARCHAR(255),
    "Product State" VARCHAR(255),
    "Selling Price" FLOAT,
    "Product Cost" FLOAT,
    "Quantity" FLOAT,

📊 Data Analysis & Findings
1. Overall Sales Trend (Revenue & Order Volume)

SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue,
    COUNT(DISTINCT o."Order ID") AS monthly_order_volume
FROM Customer_Orders co
JOIN Orders o ON co."Order ID" = o."Order ID"
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;

2. Top 3 Months by Revenue

SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue
FROM Customer_Orders co
JOIN Orders o ON co."Order ID" = o."Order ID"
GROUP BY sales_year, sales_month
ORDER BY monthly_revenue DESC
LIMIT 3;

3. Annual Performance Review (e.g., 2023)

SELECT
    EXTRACT(YEAR FROM co."Order Date") AS sales_year,
    EXTRACT(MONTH FROM co."Order Date") AS sales_month,
    SUM(o."Quantity" * o."Selling Price") AS monthly_revenue
FROM Customer_Orders co
JOIN Orders o ON co."Order ID" = o."Order ID"
WHERE EXTRACT(YEAR FROM co."Order Date") = 2023
GROUP BY sales_year, sales_month
ORDER BY sales_month;
    FOREIGN KEY ("Order ID") REFERENCES Customer_Orders("Order ID")
);

🔎 Findings

Business Health: Balanced view of revenue & order volume.

Peak Seasons: Identified top-performing months, helpful for marketing & inventory planning.

Performance Tracking: Easy YoY & MoM comparisons.

Actionable Insights: Allocate more resources in low seasons & capitalize on peaks.

📑 Reports

📌 Overall Sales Summary: Monthly revenue & order volume trends.

🏆 Top Performance Report: Highest revenue months.

📅 Annual Report: Year-specific revenue breakdown.

✅ Conclusion

This project demonstrates a complete SQL analysis workflow for time-series sales data.
It includes schema design, data aggregation, and reporting queries.
The approach can be reused for real-world retail monitoring & decision-making.

🚀 How to Use

Clone the repository:

git clone https://github.com/your-username/your-repo-name.git


Set up database tables using the SQL script in Project Structure.

Import your CSV data into Customer_Orders and Orders.

Run the analysis queries in your SQL environment.

## 👨‍💻 Author
**Deewakar Kumar**  
📧 [deewakar2412@gmail.com](mailto:deewakar2412@gmail.com)  
📍 Bokaro, Jharkhand, India  
🔗 [LinkedIn](https://www.linkedin.com/in/deewakar-kumar-b61652248/)  


## 📜 License
This project is licensed under the **MIT License**.  
Feel free to use, modify, and share for **learning & development purposes**.  



⚡ Now you can **copy-paste** this directly into your `README.md` file.  
Do you also want me to add a **preview section with example graphs/tables (monthly revenue trends)** to make it look more professional for GitHub?
