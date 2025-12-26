USE Expense_Tracker;
GO


-- Monthly Expense Report (Business Standard)
     -- Monthly Expense Report by User

SELECT
    u.UserName,
    FORMAT(e.ExpenseDate, 'yyyy-MM') AS ExpenseMonth,
    SUM(e.Amount) AS TotalSpent
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
GROUP BY
    u.UserName,
    FORMAT(e.ExpenseDate, 'yyyy-MM')
ORDER BY
    u.UserName,
    ExpenseMonth;



-- Category Spending Breakdown (Top Categories)
    -- Category Spending Breakdown


SELECT
    c.CategoryName,
    SUM(e.Amount) AS TotalSpent
FROM dbo.Expenses e
JOIN dbo.Categories c ON e.CategoryID = c.CategoryID
GROUP BY c.CategoryName
ORDER BY TotalSpent DESC;



-- Running Total (Window Function)
    -- Running Total by User


SELECT
    u.UserName,
    e.ExpenseDate,
    e.Amount,
    SUM(e.Amount) OVER (
        PARTITION BY u.UserName
        ORDER BY e.ExpenseDate
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS RunningTotal
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
ORDER BY u.UserName, e.ExpenseDate;


-- Month-Over-Month Comparison
    -- Month-over-Month Spending Comparison


WITH MonthlyTotals AS (
    SELECT
        u.UserName,
        YEAR(e.ExpenseDate) AS ExpenseYear,
        MONTH(e.ExpenseDate) AS ExpenseMonth,
        SUM(e.Amount) AS MonthlyTotal
    FROM dbo.Expenses e
    JOIN dbo.Users u ON e.UserID = u.UserID
    GROUP BY
        u.UserName,
        YEAR(e.ExpenseDate),
        MONTH(e.ExpenseDate)
)
SELECT
    UserName,
    ExpenseYear,
    ExpenseMonth,
    MonthlyTotal,
    MonthlyTotal
      - LAG(MonthlyTotal) OVER (
            PARTITION BY UserName
            ORDER BY ExpenseYear, ExpenseMonth
        ) AS MonthOverMonthChange
FROM MonthlyTotals
ORDER BY UserName, ExpenseYear, ExpenseMonth;


-- High-Value Transactions (Audit & Risk)
    -- High-Value Transactions


SELECT
    u.UserName,
    e.ExpenseDate,
    e.Amount,
    c.CategoryName,
    p.MethodName
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
JOIN dbo.Categories c ON e.CategoryID = c.CategoryID
JOIN dbo.PaymentMethods p ON e.PaymentMethodID = p.PaymentMethodID
WHERE e.Amount > 500
ORDER BY e.Amount DESC;


-- Reporting Validation Queries


    -- Total Expenses Check

SELECT SUM(Amount) AS GrandTotal
FROM dbo.Expenses;



    -- Transaction Count by User

SELECT
    u.UserName,
    COUNT(*) AS TransactionCount
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
GROUP BY u.UserName;


