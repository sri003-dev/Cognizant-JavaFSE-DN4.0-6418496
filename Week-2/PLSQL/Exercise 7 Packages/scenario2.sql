CREATE OR REPLACE PACKAGE EmployeeManagement AS
    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hire DATE);
    PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER);
    FUNCTION GetAnnualSalary(p_id NUMBER) RETURN NUMBER;
END EmployeeManagement;
/

CREATE OR REPLACE PACKAGE BODY EmployeeManagement AS

    PROCEDURE HireEmployee(p_id NUMBER, p_name VARCHAR2, p_position VARCHAR2, p_salary NUMBER, p_dept VARCHAR2, p_hire DATE) IS
    BEGIN
        INSERT INTO Employees(EmployeeID, Name, Position, Salary, Department, HireDate)
        VALUES (p_id, p_name, p_position, p_salary, p_dept, p_hire);
        COMMIT;
    END;

    PROCEDURE UpdateEmployee(p_id NUMBER, p_salary NUMBER) IS
    BEGIN
        UPDATE Employees SET Salary = p_salary WHERE EmployeeID = p_id;
        COMMIT;
    END;

    FUNCTION GetAnnualSalary(p_id NUMBER) RETURN NUMBER IS
        v_salary NUMBER;
    BEGIN
        SELECT Salary * 12 INTO v_salary FROM Employees WHERE EmployeeID = p_id;
        RETURN v_salary;
    END;

END EmployeeManagement;
/

BEGIN
    EmployeeManagement.HireEmployee(3, 'Test Emp', 'Clerk', 3000, 'Ops', SYSDATE);
    EmployeeManagement.UpdateEmployee(3, 3500);
    DBMS_OUTPUT.PUT_LINE(EmployeeManagement.GetAnnualSalary(3));
END;
/
