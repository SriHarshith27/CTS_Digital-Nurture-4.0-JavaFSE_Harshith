-- Scenario 1: CustomerManagement Package (Schema-Based)
-- Includes: add_customer, update_customer, get_balance

--  Create Schema
CREATE SCHEMA IF NOT EXISTS CustomerManagement;

-- ➕ Procedure: Add new customer
CREATE OR REPLACE FUNCTION CustomerManagement.add_customer(
    cid INT,
    cname TEXT,
    dob DATE,
    balance NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Customers(CustomerID, Name, DOB, Balance, LastModified)
    VALUES (cid, cname, dob, balance, NOW());

    RETURN '✅ Customer added successfully.';
EXCEPTION
    WHEN OTHERS THEN
        RETURN '❌ Failed to add customer: ' || SQLERRM;
END;
$$;

-- Procedure: Update customer details
CREATE OR REPLACE FUNCTION CustomerManagement.update_customer(
    cid INT,
    new_name TEXT,
    new_dob DATE
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Customers
    SET Name = new_name,
        DOB = new_dob,
        LastModified = NOW()
    WHERE CustomerID = cid;

    RETURN '✅ Customer details updated.';
EXCEPTION
    WHEN OTHERS THEN
        RETURN '❌ Update failed: ' || SQLERRM;
END;
$$;

--  Function: Get customer balance
CREATE OR REPLACE FUNCTION CustomerManagement.get_balance(cid INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    bal NUMERIC;
BEGIN
    SELECT Balance INTO bal FROM Customers WHERE CustomerID = cid;
    RETURN bal;
END;
$$;

--  Sample Test
SELECT CustomerManagement.add_customer(3, 'Ram Kumar', '1991-09-10', 1200);
SELECT CustomerManagement.update_customer(3, 'Ram K.', '1991-10-10');
SELECT CustomerManagement.get_balance(3);
