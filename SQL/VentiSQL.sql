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

CREATE TABLE Venti_Position (
	position_id INT AUTO_INCREMENT,
	position_name VARCHAR(45) NOT NULL,
	position_description LONGTEXT,
  
	CONSTRAINT pk_venti_position PRIMARY KEY (position_id)
  
);
INSERT INTO Venti_Position (position_name, position_description) VALUES ("CEO", "O Manda-Chuva da Empresa");
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Estagiário", "O carinha que será escravizado");
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Coordenador", "O cara que irá escravizar o Estagiário");
INSERT INTO Venti_Position (position_name, position_description) VALUES ("CTO", "Parecido com o Manda-Chuva da Empresa, mas pra tecnologia");

CREATE TABLE Venti_Department (
	department_id INT AUTO_INCREMENT,
	department_name VARCHAR(45) NOT NULL,
	department_description LONGTEXT,
  
	CONSTRAINT pk_venti_department PRIMARY KEY (department_id)
  
);
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Recursos Humanos", "Essa gente contrata e paga salário");
INSERT INTO Venti_Department (department_name, department_description) VALUES ("TI", "Os nerds de óculos ficam aqui");
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Marketing", "A galera mais de boa da empresa");
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Setor Estratégico", "Onde Maquiavel e Sun Tzu trabalham.");

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
  
INSERT INTO Venti_Employee VALUES (null, "Venti", "589.063.795-95", "1500-06-16", "Ruas de Mondstadt", "71996047669", "BardoBebum@gmail.com", 0.0, CURRENT_DATE(), 0, 1, 1, 4);
INSERT INTO Venti_Employee VALUES (null, "Jean", "274.853.755-63", "2002-03-14", "Base dos Cavaleiros de Favonius", "71932046668", "Workaholic@VouDesmaiar.com", 20000.0, CURRENT_DATE(), 40, 1, 4, 4);
INSERT INTO Venti_Employee VALUES (null, "Lumine", "000.000.000-00", "1516-01-23", "Viajante", null, "CadeMeuBro@outlook.com", 500.0, CURRENT_DATE(), 5, 1, 2, 1);
INSERT INTO Venti_Employee VALUES (null, "Amber", "684.480.185-83", "2006-08-10", "Base dos Cavaleiros de Favonius", 71991120816, "BaraoCoelho@gmail.com", 3000.0, CURRENT_DATE(), 0, 4, 3, 1);

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
INSERT INTO Venti_TimeSheet VALUES(null, "2024-10-08", "08:02:00", "20:00:00", 2, 2);
INSERT INTO Venti_TimeSheet VALUES(null, "2024-10-08", "08:02:00", "16:00:00", null, 3);
INSERT INTO Venti_TimeSheet VALUES(null, "2024-10-09", "08:02:00", null, null, 2);
    
CREATE TABLE Venti_Company(
	company_id INT AUTO_INCREMENT,
	company_name VARCHAR(50) NOT NULL,
	company_cnpj VARCHAR(18) NOT NULL UNIQUE,
	company_branch INT,
    
	CONSTRAINT pk_venti_company PRIMARY KEY (company_id)
    
);
INSERT INTO Venti_Company VALUES (null, "Cavaleiros de Favonius","82.706.395/0001-07",0);
    
CREATE TABLE Venti_Payroll(
	payroll_id INT AUTO_INCREMENT,
	payroll_date DATE,
	employee_id INT,
	company_id INT,
    
	CONSTRAINT pk_venti_payroll PRIMARY KEY (payroll_id),
	CONSTRAINT fk_venti_payroll_employee FOREIGN KEY (employee_id) REFERENCES Venti_Employee (employee_id),
	CONSTRAINT fk_venti_payroll_company FOREIGN KEY (company_id) REFERENCES Venti_Company (company_id)
    
    );
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 2, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 3, 1);

CREATE TABLE Venti_Discount(
	discount_id INT AUTO_INCREMENT,
    discount_name VARCHAR(50) NOT NULL,
    discount_value DECIMAL(10,2) NOT NULL,
    discount_type ENUM("FIXO", "PERCENTUAL") NOT NULL,
	payroll_id INT,
    
    CONSTRAINT pk_venti_discount PRIMARY KEY (discount_id),
    CONSTRAINT fk_venti_discount_payroll FOREIGN KEY (payroll_id) REFERENCES Venti_Payroll(payroll_id)
    
);
INSERT INTO Venti_Discount VALUES (null, "IRRF", 27.5, "PERCENTUAL", 1);
INSERT INTO Venti_Discount VALUES (null, "INSS", 7.0, "PERCENTUAL", 1);

CREATE TABLE Venti_Bonus(
	bonus_id INT AUTO_INCREMENT,
	bonus_name VARCHAR(50) NOT NULL,
	bonus_value DECIMAL(10,2) NOT NULL,
	bonus_type ENUM("FIXO", "PERCENTUAL") NOT NULL,
	payroll_id INT,
    
	CONSTRAINT pk_venti_bonus PRIMARY KEY (bonus_id),
	CONSTRAINT fk_venti_bonus_payroll FOREIGN KEY (payroll_id) REFERENCES Venti_Payroll (payroll_id)

);
INSERT INTO Venti_Bonus VALUES (null, "Funcionário do Mês", 500, "FIXO", 1);
INSERT INTO Venti_Bonus VALUES (null, "Comissões", 5.0, "PERCENTUAL", 1);

CREATE TABLE Venti_Performance_Review(
	performance_review_id INT AUTO_INCREMENT,
    performance_review_date DATE,
    performance_review_commentary LONGTEXT,
    employee_id INT,
    
    CONSTRAINT pk_venti_performance_review PRIMARY KEY (performance_review_id),
    CONSTRAINT fk_venti_performance_review_employee FOREIGN KEY (employee_id) REFERENCES Venti_Employee (employee_id)

);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Jean, você trabalha muito. Vá tirar umas férias, pelo amor", 2);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Venti, você é um vagabundo. Pare de beber e vá trabalhar!!!", 1);

CREATE TABLE Venti_Vacation(
	vacation_id INT AUTO_INCREMENT,

	CONSTRAINT pk_venti_vacation PRIMARY KEY (vacation_id)
    
);