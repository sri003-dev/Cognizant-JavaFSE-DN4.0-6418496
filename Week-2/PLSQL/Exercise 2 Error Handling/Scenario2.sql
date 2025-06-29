CREATE OR REPLACE PROCEDURE UpdateSalary(
    p_emp_id IN NUMBER,
    p_percent IN NUMBER
) IS
    v_salary NUMBER;
BEGIN
    -- Get current salary
    SELECT Salary INTO v_salary FROM Employees WHERE EmployeeID = p_emp_id;

    -- Update salary
    UPDATE Employees
    SET Salary = v_salary + (v_salary * p_percent / 100)
    WHERE EmployeeID = p_emp_id;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Employee ID not found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('General Error: ' || SQLERRM);
END;
/
BEGIN
    UpdateSalary(1, 10); -- Valid
    UpdateSalary(999, 5); -- Non-existent
END;
/

