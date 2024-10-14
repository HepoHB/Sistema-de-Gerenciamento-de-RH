DROP SCHEMA if exists venti;
CREATE SCHEMA venti;
use venti;

CREATE TABLE venti_status (
	status_id BIGINT AUTO_INCREMENT,
	status_name VARCHAR(30) NOT NULL,
  
	CONSTRAINT pk_venti_status PRIMARY KEY (status_id)
  
);
INSERT INTO venti_status (status_name) VALUES ("Ativo");
INSERT INTO venti_status (status_name) VALUES ("Afastado");
INSERT INTO venti_status (status_name) VALUES ("Aposentado");
INSERT INTO venti_status (status_name) VALUES ("De Férias");

INSERT INTO venti_status (status_name) VALUES ("Pendentes");
INSERT INTO venti_status (status_name) VALUES ("Em Curso");
INSERT INTO venti_status (status_name) VALUES ("Finalizadas");

CREATE TABLE venti_position (
	position_id BIGINT AUTO_INCREMENT,
	position_name VARCHAR(45) NOT NULL,
	position_description LONGTEXT,
  
	CONSTRAINT pk_venti_position PRIMARY KEY (position_id)
  
);
INSERT INTO venti_position VALUES (null, "CEO", "O manda-chuva da empresa");
INSERT INTO venti_position VALUES (null, "CTO", "O manda-chuva da empresa, mas pra tecnologia");
INSERT INTO venti_position VALUES (null, "Estagiário", "O escravo da empresa");

CREATE TABLE venti_department (
	department_id BIGINT AUTO_INCREMENT,
	department_name VARCHAR(45) NOT NULL,
	department_description LONGTEXT,
  
	CONSTRAINT pk_venti_department PRIMARY KEY (department_id)
  
);

CREATE TABLE venti_employee (
	employee_id BIGINT AUTO_INCREMENT,
	employee_name VARCHAR(50) NOT NULL,
	employee_cpf VARCHAR(14) UNIQUE NOT NULL,
	employee_birthday DATE,
	employee_address VARCHAR(50),
	employee_telephone VARCHAR(11) UNIQUE,
	employee_email VARCHAR(50) UNIQUE,
	employee_salary DECIMAL(10,2),
	employee_hiring_date DATE NOT NULL,
	employee_total_overtime INT,
	status_id BIGINT NOT NULL,
	position_id BIGINT NOT NULL, 
	department_id BIGINT,
    
	CONSTRAINT pk_venti_employee PRIMARY KEY (employee_id),
	CONSTRAINT fk_venti_employee_status FOREIGN KEY (status_id) REFERENCES venti_status (status_id),
	CONSTRAINT fk_venti_employee_position FOREIGN KEY (position_id) REFERENCES venti_position (position_id),
	CONSTRAINT fk_venti_employee_department FOREIGN KEY (department_id) REFERENCES venti_department (department_id)
  
);

CREATE TABLE venti_timesheet(
	timesheet_id BIGINT AUTO_INCREMENT,
	timesheet_date DATE NOT NULL,
	timesheet_checkin_time TIME,
	timesheet_checkout_time TIME,
	timesheet_overtime INT,
	employee_id BIGINT,
    
	CONSTRAINT pk_venti_timesheet PRIMARY KEY (timesheet_id),
	CONSTRAINT fk_venti_timesheet_employee FOREIGN KEY (employee_id) REFERENCES venti_employee (employee_id)
    
);

CREATE TABLE venti_payroll(
	payroll_id BIGINT AUTO_INCREMENT,
	payroll_date DATE,
	employee_id BIGINT,
    
	CONSTRAINT pk_venti_payroll PRIMARY KEY (payroll_id),
	CONSTRAINT fk_venti_payroll_employee FOREIGN KEY (employee_id) REFERENCES venti_employee (employee_id)
    
    );

CREATE TABLE venti_discount(
	discount_id BIGINT AUTO_INCREMENT,
	discount_name VARCHAR(50) NOT NULL,
	discount_value DECIMAL(10,2) NOT NULL,
	discount_type ENUM("FIXO", "PERCENTUAL") NOT NULL,
	payroll_id BIGINT,
    
	CONSTRAINT pk_venti_discount PRIMARY KEY (discount_id),
	CONSTRAINT fk_venti_discount_payroll FOREIGN KEY (payroll_id) REFERENCES venti_payroll(payroll_id)
    
);

CREATE TABLE venti_bonus(
	bonus_id BIGINT AUTO_INCREMENT,
	bonus_name VARCHAR(50) NOT NULL,
	bonus_value DECIMAL(10,2) NOT NULL,
	bonus_type ENUM("FIXO", "PERCENTUAL") NOT NULL,
	payroll_id BIGINT,
    
	CONSTRAINT pk_venti_bonus PRIMARY KEY (bonus_id),
	CONSTRAINT fk_venti_bonus_payroll FOREIGN KEY (payroll_id) REFERENCES venti_payroll (payroll_id)

);

CREATE TABLE venti_performance_review(
	performance_review_id BIGINT AUTO_INCREMENT,
	performance_review_date DATE,
	performance_review_commentary LONGTEXT,
	employee_id BIGINT,
    
	CONSTRAINT pk_venti_performance_review PRIMARY KEY (performance_review_id),
	CONSTRAINT fk_venti_performance_review_employee FOREIGN KEY (employee_id) REFERENCES venti_employee (employee_id)

);

CREATE TABLE venti_vacation(
	vacation_id BIGINT AUTO_INCREMENT,
	vacation_start DATE,
	vacation_end DATE,
	employee_id BIGINT,
	status_id BIGINT,

	CONSTRAINT pk_venti_vacation PRIMARY KEY (vacation_id),
	CONSTRAINT fk_venti_vacation_employee FOREIGN KEY (employee_id) REFERENCES venti_employee (employee_id),
	CONSTRAINT fk_venti_vacation_status FOREIGN KEY (status_id) REFERENCES venti_status (status_id)
    
);

CREATE TABLE venti_user(
    user_id BIGINT AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_login VARCHAR(50) NOT NULL UNIQUE,
    user_password VARCHAR(32) NOT NULL,
    #user_access_level ENUM('ADMIN', 'USER') NOT NULL,
    
    CONSTRAINT pk_venti_user PRIMARY KEY (user_id)
    
);
