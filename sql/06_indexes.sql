USE Expense_Tracker;
GO


-- Index Foreign Keys (MOST IMPORTANT)


CREATE NONCLUSTERED INDEX IX_Expenses_UserID
ON dbo.Expenses (UserID);
GO

CREATE NONCLUSTERED INDEX IX_Expenses_CategoryID
ON dbo.Expenses (CategoryID);
GO

CREATE NONCLUSTERED INDEX IX_Expenses_PaymentMethodID
ON dbo.Expenses (PaymentMethodID);
GO



-- Index for Date-Based Queries


CREATE NONCLUSTERED INDEX IX_Expenses_ExpenseDate
ON dbo.Expenses (ExpenseDate);
GO


-- Composite Index for Reporting
	

CREATE NONCLUSTERED INDEX IX_Expenses_User_Date
ON dbo.Expenses (UserID, ExpenseDate)
INCLUDE (Amount);
GO


-- Validate Index Usage
 -- Run this query before and after indexes (optional but powerful):


SET STATISTICS IO ON;
SET STATISTICS TIME ON;

EXEC dbo.sp_GetMonthlySummary @UserID = 1, @Year = 2025;

SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;