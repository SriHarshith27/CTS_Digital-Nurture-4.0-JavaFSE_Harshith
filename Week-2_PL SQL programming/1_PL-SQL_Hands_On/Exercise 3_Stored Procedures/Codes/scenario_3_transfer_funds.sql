--  Function: TransferFunds(from_account INT, to_account INT, amount NUMERIC)
CREATE OR REPLACE FUNCTION TransferFunds(
    from_account INT,
    to_account INT,
    amount NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    from_balance NUMERIC;
    from_customer INT;
    to_customer INT;
BEGIN
    -- Fetch account data
    SELECT Balance, CustomerID INTO from_balance, from_customer
    FROM Accounts WHERE AccountID = from_account;

    SELECT CustomerID INTO to_customer FROM Accounts WHERE AccountID = to_account;

    -- Validation
    IF NOT FOUND THEN
        RAISE NOTICE '❌ One or both accounts do not exist.';
        RETURN '❌ Invalid accounts';
    END IF;

    IF from_customer != to_customer THEN
        RAISE NOTICE '❌ Accounts belong to different customers.';
        RETURN '❌ Unauthorized transfer';
    END IF;

    IF from_balance < amount THEN
        RAISE NOTICE '❌ Insufficient balance in account %.', from_account;
        RETURN '❌ Insufficient balance';
    END IF;

    -- Transfer
    UPDATE Accounts SET Balance = Balance - amount, LastModified = NOW()
    WHERE AccountID = from_account;

    UPDATE Accounts SET Balance = Balance + amount, LastModified = NOW()
    WHERE AccountID = to_account;

    -- Log
    INSERT INTO Transactions(AccountID, TransactionDate, Amount, TransactionType)
    VALUES
        (from_account, NOW(), amount, 'Internal Transfer-Out'),
        (to_account, NOW(), amount, 'Internal Transfer-In');

    RAISE NOTICE '✅ Transfer of % from account % to % complete.', amount, from_account, to_account;
    RETURN '✅ Transfer complete';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '❌ Transfer error: %', SQLERRM;
        RETURN '❌ Transfer failed';
END;
$$;

--  Test Call (accounts must belong to same customer)
SELECT TransferFunds(1, 2, 300);

--  Verification
SELECT * FROM Accounts WHERE AccountID IN (1, 2);
SELECT * FROM Transactions ORDER BY TransactionDate DESC;
