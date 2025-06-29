CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account   IN NUMBER,
    p_amount       IN NUMBER
) IS
    v_from_balance NUMBER;
    v_from_customer NUMBER;
    v_to_customer   NUMBER;
BEGIN
    
    SELECT Balance, CustomerID INTO v_from_balance, v_from_customer
    FROM Accounts WHERE AccountID = p_from_account;

    SELECT CustomerID INTO v_to_customer
    FROM Accounts WHERE AccountID = p_to_account;

    IF v_from_customer != v_to_customer THEN
        RAISE_APPLICATION_ERROR(-20001, 'Accounts must belong to same customer.');
    ELSIF v_from_balance < p_amount THEN
        RAISE_APPLICATION_ERROR(-20002, 'Insufficient balance.');
    END IF;

   
    UPDATE Accounts SET Balance = Balance - p_amount WHERE AccountID = p_from_account;
    UPDATE Accounts SET Balance = Balance + p_amount WHERE AccountID = p_to_account;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Funds transferred between accounts successfully.');
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
/
BEGIN
    TransferFunds(1, 1, 100); 
END;
/
