-- SCENARIO 1: Apply 1% Interest Discount for Customers Aged > 60

--  Update DOB to ensure some customers are > 60
UPDATE Customers
SET DOB = '1950-01-01'
WHERE CustomerID = 1;

UPDATE Customers
SET DOB = '1945-03-22'
WHERE CustomerID = 4;

--   1% interest discount to  customers
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN 
        SELECT c.CustomerID, l.LoanID
        FROM Customers c
        JOIN Loans l ON c.CustomerID = l.CustomerID
        WHERE DATE_PART('year', AGE(c.DOB)) > 60
    LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE LoanID = rec.LoanID;
    END LOOP;
END
$$ LANGUAGE plpgsql;

--  output verification
SELECT c.CustomerID, c.Name, 
       DATE_PART('year', AGE(c.DOB)) AS Age, 
       l.LoanID, l.InterestRate
FROM Customers c
JOIN Loans l ON c.CustomerID = l.CustomerID
WHERE DATE_PART('year', AGE(c.DOB)) > 60;
