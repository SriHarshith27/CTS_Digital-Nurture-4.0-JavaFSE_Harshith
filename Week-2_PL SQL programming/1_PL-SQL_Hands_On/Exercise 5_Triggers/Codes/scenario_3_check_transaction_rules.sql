-- Scenario 3: Enforce business rules for deposit/withdrawal validity

--  Trigger Function
CREATE OR REPLACE FUNCTION CheckTransactionRules()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
DECLARE
    current_balance NUMERIC;
BEGIN
    -- Fetch account balance
    SELECT Balance INTO current_balance
    FROM Accounts
    WHERE AccountID = NEW.AccountID;

    -- Ensure account exists
    IF NOT FOUND THEN
        RAISE EXCEPTION '❌ Account ID % does not exist.', NEW.AccountID;
    END IF;

    -- Rule 1: Withdrawals must not exceed balance
    IF LOWER(NEW.TransactionType) = 'withdrawal' AND NEW.Amount > current_balance THEN
        RAISE EXCEPTION '❌ Insufficient balance: Trying to withdraw % from balance %', NEW.Amount, current_balance;
    END IF;

    -- Rule 2: Deposits must be positive
    IF LOWER(NEW.TransactionType) = 'deposit' AND NEW.Amount <= 0 THEN
        RAISE EXCEPTION '❌ Deposit amount must be greater than 0.';
    END IF;

    RETURN NEW;
END;
$$;

--  Trigger
DROP TRIGGER IF EXISTS trg_check_transaction_rules ON Transactions;

CREATE TRIGGER trg_check_transaction_rules
BEFORE INSERT ON Transactions
FOR EACH ROW
EXECUTE FUNCTION CheckTransactionRules();

--  Test Cases

--  Valid Deposit
INSERT INTO Transactions (
    TransactionID, AccountID, TransactionDate, Amount, TransactionType
) VALUES (
    11, 1, NOW(), 100, 'Deposit'
);


SELECT * FROM Transactions ORDER BY TransactionDate DESC;
