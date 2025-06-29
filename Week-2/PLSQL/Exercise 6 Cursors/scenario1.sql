SET SERVEROUTPUT ON;

DECLARE
    CURSOR cur_txn IS
        SELECT C.Name, A.AccountID, T.TransactionDate, T.Amount, T.TransactionType
        FROM Customers C
        JOIN Accounts A ON C.CustomerID = A.CustomerID
        JOIN Transactions T ON A.AccountID = T.AccountID
        WHERE TO_CHAR(T.TransactionDate, 'MMYYYY') = TO_CHAR(SYSDATE, 'MMYYYY');

    v_name Customers.Name%TYPE;
    v_accid Accounts.AccountID%TYPE;
    v_date Transactions.TransactionDate%TYPE;
    v_amt Transactions.Amount%TYPE;
    v_type Transactions.TransactionType%TYPE;
BEGIN
    OPEN cur_txn;
    LOOP
        FETCH cur_txn INTO v_name, v_accid, v_date, v_amt, v_type;
        EXIT WHEN cur_txn%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer: ' || v_name || ', Account: ' || v_accid ||
                             ', Date: ' || v_date || ', Amount: ' || v_amt ||
                             ', Type: ' || v_type);
    END LOOP;
    CLOSE cur_txn;
END;
/
