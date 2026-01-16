# Expense Tracker – SQL Project

## 📌 Project Overview
The Expense Tracker - SQL Project is a data-driven solution to manage, analyze, and visualize personal or organizational expenses. It captures expense transactions, categorizes them, and provides advanced reporting through SQL views, stored procedures, and Power BI dashboards. The project emphasizes best practices in data modeling, performance optimization, and interactive visualization.


---

## 🛠 Technologies Used
- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio (SSMS)
- Git & GitHub
- Power BI for reporting and visualization

---

## 🗂 Project Structure


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


---

## 🧱 Database Design
The database follows a normalized relational design and includes:

- **Users** – Stores user-level information
- **Categories** – Expense classification (e.g., Rent, Utilities, Food)
- **Expenses** – Individual expense transactions
- **Payment Methods** – Cash, Credit Card, Debit, etc.

Primary and foreign keys enforce referential integrity, and indexing is applied to optimize query performance.

---

## 📊 Views
The project includes reporting views such as:
- Expense detail view with category and user context
- Aggregated summaries for monthly and category-based reporting

These views are designed to support analytics tools such as Power BI.

---

## ⚙ Stored Procedures
Key stored procedures include:
- Retrieving expenses by user
- Monthly expense summaries
- Category-based spending analysis

Stored procedures encapsulate business logic and promote reusability.

---

## 📈 Advanced Reporting Queries
Advanced queries demonstrate:
- Monthly expense trends
- Category spending percentages
- High-spend detection
- Query optimization using indexing and aggregation techniques

---

## ▶ How to Run the Project
1. Open SQL Server Management Studio (SSMS)
2. Execute scripts in order:
   - `01_create_database.sql`
   - `02_create_tables.sql`
   - `03_seed_data.sql`
   - `04_views.sql`
   - `05_stored_procedures.sql`
   - `06_indexes.sql`
   - `07_advanced_reporting.sql`
3. Review results using SELECT queries or reporting views

---

## 🚀 Future Enhancements
- Power BI dashboards and visual reports
- Parameterized reporting procedures
- User authentication and role-based access
- Budget tracking and alerts

---

## 📌 Author
**Fikadu Beyene**  
Data & Financial Systems Professional  
