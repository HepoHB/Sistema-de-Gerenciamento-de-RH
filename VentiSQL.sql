DROP SCHEMA if exists Venti;
CREATE SCHEMA Venti;
use Venti;

CREATE TABLE Venti_Status (
	status_id INT AUTO_INCREMENT,
	status_name VARCHAR(30) NOT NULL,
  
	CONSTRAINT pk_venti_status PRIMARY KEY (status_id)
  
);
Insert into Venti_Status (status_name) values ("Ativo");
Insert into Venti_Status (status_name) values ("Afastado");
Insert into Venti_Status (status_name) values ("Aposentado");
Insert into Venti_Status (status_name) values ("De Férias");

CREATE TABLE Venti_Position (
	position_id INT AUTO_INCREMENT,
	position_name VARCHAR(45) NOT NULL,
	position_description LONGTEXT,
  
	CONSTRAINT pk_venti_position PRIMARY KEY (position_id)
  
);
Insert into Venti_Position (position_name, position_description) values ("CEO", "O Manda-Chuva da Empresa");
Insert into Venti_Position (position_name, position_description) values ("Estagiário", "O carinha que será escravizado");
Insert into Venti_Position (position_name, position_description) values ("Coordenador", "O cara que irá escravizar o Estagiário");
Insert into Venti_Position (position_name, position_description) values ("CTO", "Parecido com o Manda-Chuva da Empresa, mas pra tecnologia");

CREATE TABLE Venti_Department (
	department_id INT AUTO_INCREMENT,
	department_name VARCHAR(45) NOT NULL,
	department_description LONGTEXT,
  
	CONSTRAINT pk_venti_department PRIMARY KEY (department_id)
  
);
Insert into Venti_Department (department_name, department_description) values ("Recursos Humanos", "Essa gente contrata e paga salário");
Insert into Venti_Department (department_name, department_description) values ("TI", "Os nerds de óculos ficam aqui");
Insert into Venti_Department (department_name, department_description) values ("Marketing", "A galera mais de boa da empresa");
Insert into Venti_Department (department_name, department_description) values ("Setor Estratégico", "Onde Maquiavel e Sun Tzu trabalham.");

CREATE TABLE Venti_User (
	user_id INT AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    user_cpf VARCHAR(14) UNIQUE NOT NULL,
    user_birthday DATE,
    user_address VARCHAR(50),
    user_telephone VARCHAR(11) UNIQUE,
    user_email VARCHAR(50) UNIQUE NOT NULL,
    user_salary DECIMAL,
    user_hiring_date DATE NOT NULL,
    user_total_overtime INT,
    status_id INT NOT NULL,
    position_id INT NOT NULL, 
    department_id INT,
    
    CONSTRAINT pk_venti_user PRIMARY KEY (user_id),
	CONSTRAINT fk_venti_user_status FOREIGN KEY (status_id) REFERENCES Venti_Status (status_id),
	CONSTRAINT fk_venti_user_position FOREIGN KEY (position_id) REFERENCES Venti_Position (position_id),
    CONSTRAINT fk_venti_user_department FOREIGN KEY (department_id) REFERENCES Venti_Department (department_id)
  
  );
  
Insert into Venti_User values (null, "Venti", "589.063.795-95", "1500-06-16", "Ruas de Mondstadt", "71996047669", "BardoBebum@gmail.com", 0.0, CURRENT_DATE(), 0, 1, 1, 4);
Insert into Venti_User values (null, "Jean", "274.853.755-63", "2002-03-14", "Base dos Cavaleiros de Favonius", "71932046668", "Workaholic@VouDesmaiar.com", 20000.0, CURRENT_DATE(), 40, 1, 4, 4);
Insert into Venti_User values (null, "Lumine", "000.000.000-00", "1516-01-23", "Viajante", null, "CadeMeuBro@outlook.com", 500.0, CURRENT_DATE(), 5, 1, 2, 1);
Insert into Venti_User values (null, "Amber", "684.480.185-83", "2006-08-10", "Base dos Cavaleiros de Favonius", 71991120816, "BaraoCoelho@gmail.com", 3000.0, CURRENT_DATE(), 0, 4, 3, 1);