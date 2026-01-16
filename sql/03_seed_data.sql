/*
Author: Fikadu Beyene
Purpose: Create core expense tracking tables
Last Updated: 2025-12
*/



USE Expense_Tracker;
GO

INSERT INTO dbo.Users (UserName, Email)
VALUES
('Fikir Beyu', 'fikad@example.com'),
('Test User', 'testuser@example.com');
GO


INSERT INTO dbo.Categories (CategoryName)
VALUES
('Rent'),
('Groceries'),
('Utilities'),
('Transportation'),
('Entertainment'),
('Healthcare');
GO


INSERT INTO dbo.PaymentMethods (MethodName)
VALUES
('Cash'),
('Credit Card'),
('Debit Card'),
('Bank Transfer');
GO


INSERT INTO dbo.Expenses
(ExpenseDate, Amount, Description, CategoryID, PaymentMethodID, UserID)
VALUES
-- January
('2025-01-01', 1200.00, 'January Rent', 1, 4, 1),
('2025-01-03', 145.30, 'Grocery Shopping - Walmart', 2, 2, 1),
('2025-01-05', 82.75, 'Electric Bill', 3, 4, 1),
('2025-01-07', 60.00, 'Gas Refill', 4, 3, 1),
('2025-01-10', 45.00, 'Streaming Subscription', 5, 2, 1),
('2025-01-12', 210.00, 'Urgent Care Visit', 6, 3, 1),

-- February
('2025-02-01', 1200.00, 'February Rent', 1, 4, 1),
('2025-02-04', 162.10, 'Groceries - Costco', 2, 2, 1),
('2025-02-06', 90.40, 'Gas & Water Bill', 3, 4, 1),
('2025-02-09', 75.00, 'Uber Rides', 4, 2, 1),
('2025-02-11', 65.00, 'Concert Ticket', 5, 2, 1),
('2025-02-14', 180.00, 'Dental Cleaning', 6, 3, 1),

-- March
('2025-03-01', 1200.00, 'March Rent', 1, 4, 1),
('2025-03-03', 155.75, 'Groceries - Target', 2, 2, 1),
('2025-03-05', 88.20, 'Electric Bill', 3, 4, 1),
('2025-03-08', 55.00, 'Public Transit Pass', 4, 1, 1),
('2025-03-11', 70.00, 'Dinner Out', 5, 2, 1),
('2025-03-15', 95.00, 'Prescription Medication', 6, 3, 1),

-- April
('2025-04-01', 1200.00, 'April Rent', 1, 4, 1),
('2025-04-04', 170.40, 'Groceries - Aldi', 2, 2, 1),
('2025-04-06', 92.10, 'Internet Bill', 3, 4, 1),
('2025-04-09', 80.00, 'Gas', 4, 3, 1),
('2025-04-12', 120.00, 'Sports Event', 5, 2, 1),
('2025-04-18', 220.00, 'Physical Therapy', 6, 3, 1),

-- User 2 Expenses
('2025-01-02', 900.00, 'January Rent', 1, 4, 2),
('2025-01-06', 120.00, 'Groceries', 2, 2, 2),
('2025-01-08', 65.00, 'Electric Bill', 3, 4, 2),
('2025-01-10', 30.00, 'Bus Fare', 4, 1, 2),
('2025-01-13', 40.00, 'Movie Night', 5, 2, 2),
('2025-01-20', 150.00, 'Clinic Visit', 6, 3, 2),

('2025-02-02', 900.00, 'February Rent', 1, 4, 2),
('2025-02-07', 135.00, 'Groceries', 2, 2, 2),
('2025-02-09', 70.00, 'Utilities', 3, 4, 2),
('2025-02-15', 55.00, 'Dining Out', 5, 2, 2),

('2025-03-02', 900.00, 'March Rent', 1, 4, 2),
('2025-03-06', 145.00, 'Groceries', 2, 2, 2),
('2025-03-09', 68.00, 'Water Bill', 3, 4, 2),
('2025-03-14', 95.00, 'Car Repair', 4, 3, 2);
GO