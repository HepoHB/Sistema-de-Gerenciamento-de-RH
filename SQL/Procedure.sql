DELIMITER $$
DROP PROCEDURE if exists GetEmployeesByPosition$$
CREATE PROCEDURE GetEmployeesByPosition(IN positionName VARCHAR(45))
BEGIN
    SELECT 
        e.employee_name,
        e.employee_cpf,
        e.employee_address,
        e.employee_telephone,
        e.employee_email,
        e.employee_salary,
        p.position_name,
        d.department_name,
        s.status_name
    FROM 
        Venti_Employee e
    INNER JOIN 
        Venti_Position p ON e.position_id = p.position_id
    INNER JOIN 
        Venti_Department d ON e.department_id = d.department_id
    INNER JOIN 
        Venti_Status s ON e.status_id = s.status_id
    WHERE 
        p.position_name LIKE CONCAT('%', positionName, '%');
        
END $$

DROP PROCEDURE if exists CreateUser$$
CREATE PROCEDURE CreateUser(
    IN p_employee_name VARCHAR(50),
    IN p_employee_cpf VARCHAR(14),
    IN p_employee_birthday DATE,
    IN p_employee_address VARCHAR(50),
    IN p_employee_telephone VARCHAR(11),
    IN p_employee_email VARCHAR(50),
    IN p_employee_salary DECIMAL,
    IN p_employee_hiring_date DATE,
    IN p_employee_total_overtime INT,
    IN p_status_id INT,
    IN p_position_id INT,
    IN p_department_id INT
)
BEGIN
    SET p_employee_birthday = IFNULL(p_employee_birthday, NULL);
    SET p_employee_address = IFNULL(p_employee_address, NULL);
    SET p_employee_telephone = IFNULL(p_employee_telephone, NULL);
    SET p_employee_email = IFNULL(p_employee_email, NULL);
    SET p_employee_salary = IFNULL(p_employee_salary, 0.0);
    SET p_employee_hiring_date = IFNULL(p_employee_hiring_date, CURRENT_DATE());
    SET p_employee_total_overtime = IFNULL(p_employee_total_overtime, 0);
    SET p_department_id = IFNULL(p_department_id, NULL);

    INSERT INTO Venti_Employee (
        employee_name,
        employee_cpf,
        employee_birthday,
        employee_address,
        employee_telephone,
        employee_email,
        employee_salary,
        employee_hiring_date,
        employee_total_overtime,
        status_id,
        position_id,
        department_id
    ) 
    VALUES (
        p_employee_name,
        p_employee_cpf,
        p_employee_birthday,
        p_employee_address,
        p_employee_telephone,
        p_employee_email,
        p_employee_salary,
        p_employee_hiring_date,
        p_employee_total_overtime,
        p_status_id,
        p_position_id,
        p_department_id
    );
END $$

DELIMITER ;
