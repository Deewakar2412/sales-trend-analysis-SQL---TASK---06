# 🛒 SQL Sales Trend Analysis (Internship Task 06)

![SQL](https://img.shields.io/badge/SQL-Analysis-blue)  ![Beginner](https://img.shields.io/badge/Level-Beginner-green)  ![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📑 Table of Contents

* [Project Overview](#-project-overview)
* [Objectives](#-objectives)
* [Project Structure](#-project-structure)
* [Data Analysis & Findings](#-data-analysis--findings)
* [Findings](#-findings)
* [Reports](#-reports)
* [Conclusion](#-conclusion)
* [How to Use](#-how-to-use)
* [Author](#-author)
* [License](#-license)

---

## 📌 Project Overview

**Project Title**: Sales Trend Analysis (Internship Task 06)  
**Level**: Beginner  
**Database**: PostgreSQL / MySQL / SQLite  

This project is part of the **Data Analyst Internship (Task 06)**.  
It demonstrates SQL skills for analyzing sales data by calculating and interpreting **monthly revenue** and **order volume**.  
The analysis uncovers time-based trends and provides actionable insights for **business decision-making**.

---

## 🎯 Objectives

1. **Database Setup**: Create a two-table schema for customer orders and product details.  
2. **Relationship Building**: Establish a relationship between the tables using a Foreign Key.  
3. **Data Aggregation**: Use aggregate functions (`SUM()`, `COUNT(DISTINCT)`) to calculate key metrics.  
4. **Business Analysis**: Answer real-world business questions by analyzing sales trends over time.  

---

## 🗂️ Project Structure

### 1. Database Setup

```sql
-- Table to store customer and order date information
CREATE TABLE Customer_Orders (
    "Name" VARCHAR(255),
    "Order ID" INT PRIMARY KEY,
    "Order Date" DATE,
    "Product ID" INT,
    "City" VARCHAR(255),
    "State" VARCHAR(255)
);

-- Table to store product and pricing details for each order
CREATE TABLE Orders (
    "Order ID" INT,
    "Product ID" INT,
    "Product" VARCHAR(255),
    "Product State" VARCHAR(255),
    "Selling Price" FLOAT,
    "Product Cost" FLOAT,
    "Quantity" FLOAT,
    FOREIGN KEY ("Order ID") REFERENCES Customer_Orders("Order ID")
);
