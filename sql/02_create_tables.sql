USE Expense_Tracker;
GO

CREATE TABLE dbo.Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    UserName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE()
);
GO

CREATE TABLE dbo.Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE dbo.PaymentMethods (
    PaymentMethodID INT IDENTITY(1,1) PRIMARY KEY,
    MethodName VARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE dbo.Expenses (
    ExpenseID INT IDENTITY(1,1) PRIMARY KEY,
    ExpenseDate DATE NOT NULL,
    Amount DECIMAL(10,2) NOT NULL CHECK (Amount > 0),
    Description VARCHAR(255),
    CategoryID INT NOT NULL,
    PaymentMethodID INT NOT NULL,
    UserID INT NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT GETDATE(),

    CONSTRAINT FK_Expenses_Categories 
        FOREIGN KEY (CategoryID) 
        REFERENCES dbo.Categories(CategoryID),

    CONSTRAINT FK_Expenses_PaymentMethods 
        FOREIGN KEY (PaymentMethodID) 
        REFERENCES dbo.PaymentMethods(PaymentMethodID),

    CONSTRAINT FK_Expenses_Users 
        FOREIGN KEY (UserID) 
        REFERENCES dbo.Users(UserID)
);
GO


SELECT name 
FROM sys.tables;