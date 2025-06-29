-- Scenario 2: Create AuditLog entry when a transaction is inserted

--  Audit Table (if not exists)
CREATE TABLE IF NOT EXISTS AuditLog (
    AuditID SERIAL PRIMARY KEY,
    ActionType TEXT,
    TransactionID INT,
    AccountID INT,
    Amount NUMERIC,
    TransactionType TEXT,
    ActionTimestamp TIMESTAMP DEFAULT NOW()
);

--  Trigger Function
CREATE OR REPLACE FUNCTION LogTransaction()
RETURNS TRIGGER
LANGUAGE plpgsql
AS
$$
BEGIN
    -- Insert a new audit log row on transaction insert
    INSERT INTO AuditLog (
        ActionType,
        TransactionID,
        AccountID,
        Amount,
        TransactionType
    ) VALUES (
        'INSERT',
        NEW.TransactionID,
        NEW.AccountID,
        NEW.Amount,
        NEW.TransactionType
    );
    RETURN NEW;
END;
$$;

--  Trigger
DROP TRIGGER IF EXISTS trg_log_transaction_insert ON Transactions;

CREATE TRIGGER trg_log_transaction_insert
AFTER INSERT ON Transactions
FOR EACH ROW
EXECUTE FUNCTION LogTransaction();

--  Insert Sample Transaction
INSERT INTO Transactions (
    TransactionID,
    AccountID,
    TransactionDate,
    Amount,
    TransactionType
) VALUES (
    10, 1, NOW(), 150, 'Deposit'
);

-- Verify Audit Log
SELECT * FROM AuditLog ORDER BY ActionTimestamp DESC;
