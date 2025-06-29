CREATE OR REPLACE TRIGGER CheckTransactionRules
BEFORE INSERT ON Transactions
FOR EACH ROW
DECLARE
    v_balance NUMBER;
BEGIN
    SELECT Balance INTO v_balance FROM Accounts WHERE AccountID = :NEW.AccountID;

    IF :NEW.TransactionType = 'Withdrawal' AND :NEW.Amount > v_balance THEN
        RAISE_APPLICATION_ERROR(-20001, 'Withdrawal exceeds account balance');
    ELSIF :NEW.TransactionType = 'Deposit' AND :NEW.Amount <= 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Deposit amount must be positive');
    END IF;
END;
/

-- Test: Valid deposit
INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (4, 1, SYSDATE, 100, 'Deposit');

-- Test: Invalid withdrawal (optional, will raise error)
-- INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
-- VALUES (5, 1, SYSDATE, 999999, 'Withdrawal');
