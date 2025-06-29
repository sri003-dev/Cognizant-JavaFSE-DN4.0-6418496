CREATE OR REPLACE TRIGGER LogTransaction
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    INSERT INTO AuditLog (AccountID, Amount, TransactionType, LogDate)
    VALUES (:NEW.AccountID, :NEW.Amount, :NEW.TransactionType, SYSDATE);
END;
/

INSERT INTO Transactions (TransactionID, AccountID, TransactionDate, Amount, TransactionType)
VALUES (3, 1, SYSDATE, 400, 'Deposit');

SELECT * FROM AuditLog;
