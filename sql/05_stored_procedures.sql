USE Expense_Tracker;
GO

CREATE OR ALTER PROCEDURE dbo.sp_AddExpense
    @ExpenseDate DATE,
    @Amount DECIMAL(10,2),
    @Description NVARCHAR(255),
    @CategoryID INT,
    @PaymentMethodID INT,
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO dbo.Expenses
    (ExpenseDate, Amount, Description, CategoryID, PaymentMethodID, UserID)
    VALUES
    (@ExpenseDate, @Amount, @Description, @CategoryID, @PaymentMethodID, @UserID);
END;
GO


-- Insert Expense
-- Test It

EXEC dbo.sp_AddExpense
    @ExpenseDate = '2025-05-01',
    @Amount = 95.50,
    @Description = 'Groceries - Trader Joes',
    @CategoryID = 2,
    @PaymentMethodID = 2,
    @UserID = 1;



    -- Get Expenses by User


CREATE OR ALTER PROCEDURE dbo.sp_GetExpensesByUser
    @UserID INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM dbo.vw_ExpenseDetails
    WHERE UserID = @UserID
    ORDER BY ExpenseDate DESC;
END;
GO


-- Test sp_GetExpensesByUser

EXEC dbo.sp_GetExpensesByUser @UserID = 1;




-- Update Expense

CREATE OR ALTER PROCEDURE dbo.sp_UpdateExpense
    @ExpenseID INT,
    @Amount DECIMAL(10,2),
    @Description NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE dbo.Expenses
    SET
        Amount = @Amount,
        Description = @Description
    WHERE ExpenseID = @ExpenseID;
END;
GO


-- Test sp_UpdateExpense

EXEC dbo.sp_UpdateExpense
    @ExpenseID = 1,
    @Amount = 1250.00,
    @Description = 'Updated Rent Amount';



-- Delete Expense


CREATE OR ALTER PROCEDURE dbo.sp_DeleteExpense
    @ExpenseID INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM dbo.Expenses
    WHERE ExpenseID = @ExpenseID;
END;
GO



-- Test sp_DeleteExpense


EXEC dbo.sp_DeleteExpense @ExpenseID = 50;



-- Monthly Summary by User


CREATE OR ALTER PROCEDURE dbo.sp_GetMonthlySummary
    @UserID INT,
    @Year INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        MONTH(ExpenseDate) AS ExpenseMonth,
        SUM(Amount) AS TotalSpent
    FROM dbo.Expenses
    WHERE UserID = @UserID
      AND YEAR(ExpenseDate) = @Year
    GROUP BY MONTH(ExpenseDate)
    ORDER BY ExpenseMonth;
END;
GO


-- Test sp_GetMonthlySummary


EXEC dbo.sp_GetMonthlySummary @UserID = 1, @Year = 2025;
