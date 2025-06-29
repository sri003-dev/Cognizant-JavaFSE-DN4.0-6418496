CREATE OR REPLACE PROCEDURE AddNewCustomer(
    p_cust_id IN NUMBER,
    p_name IN VARCHAR2,
    p_dob IN DATE,
    p_balance IN NUMBER
) IS
BEGIN
    INSERT INTO Customers(CustomerID, Name, DOB, Balance, LastModified)
    VALUES (p_cust_id, p_name, p_dob, p_balance, SYSDATE);

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Customer added successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Error: Customer ID already exists.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('General Error: ' || SQLERRM);
END;
/
BEGIN
    AddNewCustomer(3, 'Sam Singh', TO_DATE('1995-09-12', 'YYYY-MM-DD'), 5000); -- Success
    AddNewCustomer(1, 'Duplicate Test', TO_DATE('1990-01-01', 'YYYY-MM-DD'), 1000); -- Duplicate
END;
/
