-- Scenario 3: AccountOperations Package (Schema-Based)
-- Includes: open_account, close_account, get_total_balance

-- 📦 Create Schema
CREATE SCHEMA IF NOT EXISTS AccountOperations;

--  Procedure: Open new account
CREATE OR REPLACE FUNCTION AccountOperations.open_account(
    accid INT,
    custid INT,
    acctype TEXT,
    init_balance NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Accounts(AccountID, CustomerID, AccountType, Balance, LastModified)
    VALUES (accid, custid, acctype, init_balance, NOW());

    RETURN '✅ Account opened.';
EXCEPTION
    WHEN OTHERS THEN
        RETURN '❌ Failed to open account: ' || SQLERRM;
END;
$$;

-- ❌ Procedure: Close account
CREATE OR REPLACE FUNCTION AccountOperations.close_account(accid INT)
RETURNS TEXT
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Accounts WHERE AccountID = accid;
    RETURN '✅ Account closed.';
EXCEPTION
    WHEN OTHERS THEN
        RETURN '❌ Error closing account: ' || SQLERRM;
END;
$$;

-- Function: Get total balance of a customer
CREATE OR REPLACE FUNCTION AccountOperations.get_total_balance(custid INT)
RETURNS NUMERIC
LANGUAGE plpgsql
AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT COALESCE(SUM(Balance), 0) INTO total FROM Accounts WHERE CustomerID = custid;
    RETURN total;
END;
$$;

--  Sample Test
 SELECT AccountOperations.open_account(5, 2, 'Savings', 1000);
 SELECT AccountOperations.close_account(5);
 SELECT AccountOperations.get_total_balance(2);
