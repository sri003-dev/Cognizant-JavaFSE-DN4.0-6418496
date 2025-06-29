CREATE OR REPLACE PACKAGE AccountOperations AS
    PROCEDURE OpenAccount(p_accid NUMBER, p_custid NUMBER, p_type VARCHAR2, p_balance NUMBER);
    PROCEDURE CloseAccount(p_accid NUMBER);
    FUNCTION GetTotalBalance(p_custid NUMBER) RETURN NUMBER;
END AccountOperations;
/

CREATE OR REPLACE PACKAGE BODY AccountOperations AS

    PROCEDURE OpenAccount(p_accid NUMBER, p_custid NUMBER, p_type VARCHAR2, p_balance NUMBER) IS
    BEGIN
        INSERT INTO Accounts(AccountID, CustomerID, AccountType, Balance, LastModified)
        VALUES (p_accid, p_custid, p_type, p_balance, SYSDATE);
        COMMIT;
    END;

    PROCEDURE CloseAccount(p_accid NUMBER) IS
    BEGIN
        DELETE FROM Accounts WHERE AccountID = p_accid;
        COMMIT;
    END;

    FUNCTION GetTotalBalance(p_custid NUMBER) RETURN NUMBER IS
        v_total NUMBER;
    BEGIN
        SELECT SUM(Balance) INTO v_total FROM Accounts WHERE CustomerID = p_custid;
        RETURN v_total;
    END;

END AccountOperations;
/

BEGIN
    AccountOperations.OpenAccount(3, 1, 'Savings', 4000);
    DBMS_OUTPUT.PUT_LINE(AccountOperations.GetTotalBalance(1));
    AccountOperations.CloseAccount(3);
END;
/
