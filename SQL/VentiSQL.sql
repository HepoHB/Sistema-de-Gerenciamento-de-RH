DROP SCHEMA if exists Venti;
CREATE SCHEMA Venti;
use Venti;

CREATE TABLE Venti_Status (
	status_id INT AUTO_INCREMENT,
	status_name VARCHAR(30) NOT NULL,
  
	CONSTRAINT pk_venti_status PRIMARY KEY (status_id)
  
);
INSERT INTO Venti_Status (status_name) VALUES ("Ativo");
INSERT INTO Venti_Status (status_name) VALUES ("Afastado");
INSERT INTO Venti_Status (status_name) VALUES ("Aposentado");
INSERT INTO Venti_Status (status_name) VALUES ("De Férias");

INSERT INTO Venti_Status (status_name) VALUES ("Pendentes");
INSERT INTO Venti_Status (status_name) VALUES ("Em Curso");
INSERT INTO Venti_Status (status_name) VALUES ("Finalizadas");

CREATE TABLE Venti_Position (
	position_id INT AUTO_INCREMENT,
	position_name VARCHAR(45) NOT NULL,
	position_description LONGTEXT,
  
	CONSTRAINT pk_venti_position PRIMARY KEY (position_id)
  
);

CREATE TABLE Venti_Department (
	department_id INT AUTO_INCREMENT,
	department_name VARCHAR(45) NOT NULL,
	department_description LONGTEXT,
  
	CONSTRAINT pk_venti_department PRIMARY KEY (department_id)
  
);

CREATE TABLE Venti_Employee (
	employee_id INT AUTO_INCREMENT,
	employee_name VARCHAR(50) NOT NULL,
	employee_cpf VARCHAR(14) UNIQUE NOT NULL,
	employee_birthday DATE,
	employee_address VARCHAR(50),
	employee_telephone VARCHAR(11) UNIQUE,
	employee_email VARCHAR(50) UNIQUE,
	employee_salary DECIMAL(10,2),
	employee_hiring_date DATE NOT NULL,
	employee_total_overtime INT,
	status_id INT NOT NULL,
	position_id INT NOT NULL, 
	department_id INT,
    
	CONSTRAINT pk_venti_employee PRIMARY KEY (employee_id),
	CONSTRAINT fk_venti_employee_status FOREIGN KEY (status_id) REFERENCES Venti_Status (status_id),
	CONSTRAINT fk_venti_employee_position FOREIGN KEY (position_id) REFERENCES Venti_Position (position_id),
	CONSTRAINT fk_venti_employee_department FOREIGN KEY (department_id) REFERENCES Venti_Department (department_id)
  
);

CREATE TABLE Venti_TimeSheet(
	timesheet_id INT AUTO_INCREMENT,
	timesheet_date DATE NOT NULL,
	timesheet_checkin_time TIME,
	timesheet_checkout_time TIME,
	timesheet_overtime INT,
	employee_id INT,
    
	CONSTRAINT pk_venti_timesheet PRIMARY KEY (timesheet_id),
	CONSTRAINT fk_venti_timesheet_employee FOREIGN KEY (employee_id) REFERENCES Venti_Employee (employee_id)
    
);
    
CREATE TABLE Venti_Company(
	company_id INT AUTO_INCREMENT,
	company_name VARCHAR(50) NOT NULL,
	company_cnpj VARCHAR(18) NOT NULL UNIQUE,
	company_branch INT,
    
	CONSTRAINT pk_venti_company PRIMARY KEY (company_id)
    
);
INSERT INTO Venti_Company VALUES (null, "Tevyat", "95.634.269/0001-36", 0);
    
CREATE TABLE Venti_Payroll(
	payroll_id INT AUTO_INCREMENT,
	payroll_date DATE,
	employee_id INT,
	company_id INT,
    
	CONSTRAINT pk_venti_payroll PRIMARY KEY (payroll_id),
	CONSTRAINT fk_venti_payroll_employee FOREIGN KEY (employee_id) REFERENCES Venti_Employee (employee_id),
	CONSTRAINT fk_venti_payroll_company FOREIGN KEY (company_id) REFERENCES Venti_Company (company_id)
    
    );

CREATE TABLE Venti_Discount(
	discount_id INT AUTO_INCREMENT,
	discount_name VARCHAR(50) NOT NULL,
	discount_value DECIMAL(10,2) NOT NULL,
	discount_type ENUM("FIXO", "PERCENTUAL") NOT NULL,
	payroll_id INT,
    
	CONSTRAINT pk_venti_discount PRIMARY KEY (discount_id),
	CONSTRAINT fk_venti_discount_payroll FOREIGN KEY (payroll_id) REFERENCES Venti_Payroll(payroll_id)
    
);

CREATE TABLE Venti_Bonus(
	bonus_id INT AUTO_INCREMENT,
	bonus_name VARCHAR(50) NOT NULL,
	bonus_value DECIMAL(10,2) NOT NULL,
	bonus_type ENUM("FIXO", "PERCENTUAL") NOT NULL,
	payroll_id INT,
    
	CONSTRAINT pk_venti_bonus PRIMARY KEY (bonus_id),
	CONSTRAINT fk_venti_bonus_payroll FOREIGN KEY (payroll_id) REFERENCES Venti_Payroll (payroll_id)

);

CREATE TABLE Venti_Performance_Review(
	performance_review_id INT AUTO_INCREMENT,
	performance_review_date DATE,
	performance_review_commentary LONGTEXT,
	employee_id INT,
    
	CONSTRAINT pk_venti_performance_review PRIMARY KEY (performance_review_id),
	CONSTRAINT fk_venti_performance_review_employee FOREIGN KEY (employee_id) REFERENCES Venti_Employee (employee_id)

);

CREATE TABLE Venti_Vacation(
	vacation_id INT AUTO_INCREMENT,
	vacation_start DATE,
	vacation_end DATE,
	employee_id INT,
	status_id INT,

	CONSTRAINT pk_venti_vacation PRIMARY KEY (vacation_id),
	CONSTRAINT fk_venti_vacation_employee FOREIGN KEY (employee_id) REFERENCES Venti_Employee (employee_id),
	CONSTRAINT fk_venti_vacation_status FOREIGN KEY (status_id) REFERENCES Venti_Status (status_id)
    
);