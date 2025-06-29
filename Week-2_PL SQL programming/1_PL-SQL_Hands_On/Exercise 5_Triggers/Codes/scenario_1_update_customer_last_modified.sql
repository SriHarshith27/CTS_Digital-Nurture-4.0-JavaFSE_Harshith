-- Scenario 1: Auto-update Customers.LastModified on UPDATE

-- Trigger Function
CREATE OR REPLACE FUNCTION UpdateCustomerLastModified()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    -- Set the LastModified column to current timestamp
    NEW.LastModified := NOW();
    RETURN NEW;
END;
$$;

--  Create Trigger
DROP TRIGGER IF EXISTS trg_update_customer_modified ON Customers;

CREATE TRIGGER trg_update_customer_modified
BEFORE UPDATE ON Customers
FOR EACH ROW
EXECUTE FUNCTION UpdateCustomerLastModified();

--  Test Case
UPDATE Customers
SET Name = 'Updated Name'
WHERE CustomerID = 1;

--  Verify Result
SELECT CustomerID, Name, LastModified FROM Customers WHERE CustomerID = 1;