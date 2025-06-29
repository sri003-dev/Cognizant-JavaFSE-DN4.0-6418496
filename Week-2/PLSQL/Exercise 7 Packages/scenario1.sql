CREATE OR REPLACE PACKAGE CustomerManagement AS
    PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER);
    PROCEDURE UpdateCustomer(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER);
    FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER;
END CustomerManagement;
/

CREATE OR REPLACE PACKAGE BODY CustomerManagement AS

    PROCEDURE AddCustomer(p_id NUMBER, p_name VARCHAR2, p_dob DATE, p_balance NUMBER) IS
    BEGIN
        INSERT INTO Customers(CustomerID, Name, DOB, Balance, LastModified)
        VALUES (p_id, p_name, p_dob, p_balance, SYSDATE);
        COMMIT;
    END;

    PROCEDURE UpdateCustomer(p_id NUMBER, p_name VARCHAR2, p_balance NUMBER) IS
    BEGIN
        UPDATE Customers SET Name = p_name, Balance = p_balance, LastModified = SYSDATE
        WHERE CustomerID = p_id;
        COMMIT;
    END;

    FUNCTION GetCustomerBalance(p_id NUMBER) RETURN NUMBER IS
        v_balance NUMBER;
    BEGIN
        SELECT Balance INTO v_balance FROM Customers WHERE CustomerID = p_id;
        RETURN v_balance;
    END;

END CustomerManagement;
/

BEGIN
    CustomerManagement.AddCustomer(4, 'Test User', TO_DATE('1992-08-12', 'YYYY-MM-DD'), 2500);
    CustomerManagement.UpdateCustomer(4, 'Test User Updated', 3000);
    DBMS_OUTPUT.PUT_LINE(CustomerManagement.GetCustomerBalance(4));
END;
/
