# Expense Tracker – SQL-Based Financial Reporting System

## 📌 Project Overview
The **Expense Tracker SQL Project** is a relational database–driven financial tracking and reporting system designed to capture, manage, and analyze expense data for one or more users.

This project is intentionally **SQL-centric** and demonstrates enterprise-level database development practices commonly used in financial systems, data warehouses, and reporting platforms.

---

## 🎯 Project Objectives
- Design a normalized relational database model
- Implement full CRUD functionality using stored procedures
- Build reporting-ready SQL views
- Optimize query performance with indexing strategies
- Demonstrate advanced SQL concepts (CTEs, window functions, aggregations)
- Prepare a backend suitable for Power BI, SSRS, or Excel reporting

---

## 🧱 Technology Stack
- **Database:** Microsoft SQL Server (Developer Edition)
- **Query Tool:** SQL Server Management Studio (SSMS)
- **Version Control:** Git & GitHub
- **Reporting & Visualization:** Power BI (planned / implemented separately)
- **IDE:** PyCharm (project organization & version control)

---

```text
Expense_Tracker_SQL/
├── sql/                           # All SQL scripts
│   ├── 01_create_database.sql     # Script to create the Expense_Tracker database
│   ├── 02_create_tables.sql       # Script to create all tables
│   ├── 03_seed_data.sql           # Script to insert sample/more expense data
│   ├── 04_views.sql               # Script to create reporting views
│   ├── 05_stored_procedures.sql   # Script for all CRUD and business logic procedures
│   ├── 06_indexes.sql             # Script to create indexes for performance optimization
│   └── 07_advanced_reporting.sql  # Script for advanced reporting queries
├── README.md                       # Project overview, instructions, and documentation
└── .gitignore                      # Git ignore file (optional but recommended)

```

---

## 🗄️ Data Model Overview

### Core Tables
- **Users** – Stores system users
- **Categories** – Expense categories (Rent, Groceries, Utilities, etc.)
- **PaymentMethods** – Cash, Credit Card, Debit Card, Bank Transfer
- **Expenses** – Fact table containing expense transactions

### Relationships
- One User → Many Expenses  
- One Category → Many Expenses  
- One Payment Method → Many Expenses  

This design follows **3rd Normal Form (3NF)** principles.

---

## 🔄 CRUD Operations (Stored Procedures)
The system implements full CRUD functionality using parameterized stored procedures:

- `sp_AddExpense` – Insert new expense records
- `sp_GetExpensesByUser` – Retrieve expenses by user
- `sp_UpdateExpense` – Update existing expense records
- `sp_DeleteExpense` – Delete expense records
- `sp_GetMonthlySummary` – Monthly expense aggregation per user

These procedures reflect how applications securely interact with databases in production environments.

---

## 📊 Reporting Views
To support analytics and BI tools, the following SQL views are created:

- **vw_ExpenseDetails** – Fully joined, human-readable expense data
- **vw_MonthlyExpenseSummary** – Monthly totals by user
- **vw_ExpenseByCategory** – Category-level spending totals
- **vw_ExpenseByPaymentMethod** – Spend and transaction count by payment method
- **vw_UserSpendingRank** – User ranking by total spending

These views are designed for **direct consumption by Power BI or SSRS**.

---

## ⚡ Performance Optimization
Performance tuning techniques applied include:
- Nonclustered indexes on foreign key columns
- Indexing on date columns for time-based reporting
- Composite index on `(UserID, ExpenseDate)` with included columns
- Validation using `SET STATISTICS IO` and `SET STATISTICS TIME`

---

## 📈 Advanced Reporting Queries
Advanced SQL reporting includes:
- Monthly spending trends
- Category and payment method analysis
- Running totals using window functions
- Month-over-month variance calculations
- High-value transaction detection for audit and control purposes

These queries reflect real-world finance and operational reporting needs.

---

## 🚀 Future Enhancements
- Power BI dashboards and interactive visuals
- Row-level security
- Budget thresholds and alerts
- Parameterized reporting procedures
- Application or API integration

---

## 👤 Author
**Fikadu Beyene**  
Data & Financial Systems Professional  

---

## 📄 License
This project is intended for educational and portfolio demonstration purposes.
