USE Expense_Tracker;
GO

CREATE OR ALTER VIEW dbo.vw_ExpenseDetails AS
SELECT
    e.ExpenseID,
    e.ExpenseDate,
    e.Amount,
    e.Description,
    e.UserID,              -- ? Add this
    u.UserName,
    c.CategoryName,
    p.MethodName AS PaymentMethod
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
JOIN dbo.Categories c ON e.CategoryID = c.CategoryID
JOIN dbo.PaymentMethods p ON e.PaymentMethodID = p.PaymentMethodID;
GO


CREATE OR ALTER VIEW dbo.vw_MonthlyExpenseSummary AS
SELECT
    u.UserName,
    YEAR(e.ExpenseDate) AS ExpenseYear,
    MONTH(e.ExpenseDate) AS ExpenseMonth,
    SUM(e.Amount) AS TotalAmount
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
GROUP BY
    u.UserName,
    YEAR(e.ExpenseDate),
    MONTH(e.ExpenseDate);
GO



CREATE OR ALTER VIEW dbo.vw_ExpenseByCategory AS
SELECT
    c.CategoryName,
    SUM(e.Amount) AS TotalSpent
FROM dbo.Expenses e
JOIN dbo.Categories c ON e.CategoryID = c.CategoryID
GROUP BY c.CategoryName;
GO



CREATE OR ALTER VIEW dbo.vw_ExpenseByPaymentMethod AS
SELECT
    p.MethodName,
    COUNT(e.ExpenseID) AS TransactionCount,
    SUM(e.Amount) AS TotalSpent
FROM dbo.Expenses e
JOIN dbo.PaymentMethods p ON e.PaymentMethodID = p.PaymentMethodID
GROUP BY p.MethodName;
GO



CREATE OR ALTER VIEW dbo.vw_UserSpendingRank AS
SELECT
    u.UserName,
    SUM(e.Amount) AS TotalSpent,
    RANK() OVER (ORDER BY SUM(e.Amount) DESC) AS SpendingRank
FROM dbo.Expenses e
JOIN dbo.Users u ON e.UserID = u.UserID
GROUP BY u.UserName;
GO




SELECT * FROM dbo.vw_ExpenseDetails;
SELECT * FROM dbo.vw_MonthlyExpenseSummary;
SELECT * FROM dbo.vw_ExpenseByCategory;
SELECT * FROM dbo.vw_ExpenseByPaymentMethod;
SELECT * FROM dbo.vw_UserSpendingRank;