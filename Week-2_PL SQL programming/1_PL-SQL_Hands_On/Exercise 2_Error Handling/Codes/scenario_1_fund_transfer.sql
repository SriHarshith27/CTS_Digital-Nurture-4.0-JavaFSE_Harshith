-- SCENARIO 1: Safe Fund Transfer Between Accounts with Logging

CREATE OR REPLACE FUNCTION SafeTransferFunds(
    from_account INT,
    to_account INT,
    amount NUMERIC
) RETURNS TEXT
LANGUAGE plpgsql
AS $$
DECLARE
    from_balance NUMERIC;
BEGIN
    SELECT Balance INTO from_balance FROM Accounts WHERE AccountID = from_account;

    IF NOT FOUND THEN
        RAISE NOTICE '❌ From account % does not exist.', from_account;
        RETURN '❌ From account does not exist';
    END IF;

    IF from_balance < amount THEN
        RAISE NOTICE '❌ Insufficient balance in account %.', from_account;
        RETURN '❌ Insufficient balance';
    END IF;

    -- Transfer funds
    UPDATE Accounts SET Balance = Balance - amount WHERE AccountID = from_account;
    UPDATE Accounts SET Balance = Balance + amount WHERE AccountID = to_account;

    -- Log transaction
    INSERT INTO Transactions(AccountID, TransactionDate, Amount, TransactionType)
    VALUES
        (from_account, NOW(), amount, 'Transfer-Out'),
        (to_account, NOW(), amount, 'Transfer-In');

    RAISE NOTICE '✅ Transfer of % from account % to % successful.', amount, from_account, to_account;
    RETURN '✅ Transfer successful';

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE '❌ Error during transfer: %', SQLERRM;
        RETURN '❌ Transfer failed';
END;
$$;

-- ✅ Test Call
SELECT SafeTransferFunds(1, 2, 100);

-- 📸 Verification
SELECT * FROM Accounts;
SELECT * FROM Transactions;
