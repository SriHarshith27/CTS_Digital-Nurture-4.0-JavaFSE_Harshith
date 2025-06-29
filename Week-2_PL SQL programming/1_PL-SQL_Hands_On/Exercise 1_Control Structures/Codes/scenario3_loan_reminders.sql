-- SCENARIO 3: Send Reminder for Loans Due Within Next 30 Days

-- TO Ensure at least 2 loans are due within next 30 days
UPDATE Loans
SET EndDate = CURRENT_DATE + INTERVAL '10 days'
WHERE LoanID = 301;

UPDATE Loans
SET EndDate = CURRENT_DATE + INTERVAL '20 days'
WHERE LoanID = 304;

--  SELECT loans due within next 30 days
SELECT c.CustomerID, c.Name, l.LoanID, l.EndDate
FROM Loans l
JOIN Customers c ON l.CustomerID = c.CustomerID
WHERE l.EndDate <= CURRENT_DATE + INTERVAL '30 days';
