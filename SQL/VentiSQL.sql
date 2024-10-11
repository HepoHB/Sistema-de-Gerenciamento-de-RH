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
	employee_salary DECIMAL,
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