-- SCENARIO 2: Promote to VIP for Balance > 10,000

-- To Ensure balances are above 10,000 for some customers
UPDATE Customers
SET Balance = 12000
WHERE CustomerID = 2;

UPDATE Customers
SET Balance = 15000
WHERE CustomerID = 4;

--  Add IsVIP column 
ALTER TABLE Customers
ADD COLUMN IF NOT EXISTS IsVIP BOOLEAN DEFAULT FALSE;

--  Set IsVIP = TRUE where Balance > 10,000
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN 
        SELECT CustomerID 
        FROM Customers 
        WHERE Balance > 10000
    LOOP
        UPDATE Customers 
        SET IsVIP = TRUE 
        WHERE CustomerID = rec.CustomerID;
    END LOOP;
END
$$ LANGUAGE plpgsql;

--  output verification
SELECT CustomerID, Name, Balance, IsVIP
FROM Customers;
