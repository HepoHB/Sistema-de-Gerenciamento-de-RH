-- Inserts for Venti_Position (adjusted for Genshin characters)
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Arconte Anemo", "Deus dos ventos, gosta de tocar músicas e beber"); -- Venti
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Cavaleiro Honorário", "A viajante misteriosa que ajuda Mondstadt"); -- Aether
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Cavaleira do Tufão", "Defensora dedicada de Mondstadt"); -- Jean
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Bibliotecária", "Conhece todos os segredos dos livros"); -- Lisa
INSERT INTO Venti_Position (position_name, position_description) VALUES ("General de Watatsumi", "Estratégico e leal a Sangonomiya"); -- Kokomi
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Protetor de Liyue", "Guarda a cidade e cuida de seus rituais ancestrais"); -- Zhongli
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Capitão da Companhia de Reconhecimento", "Lidera missões de exploração para Mondstadt"); -- Kaeya
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Chefe de Alquimia", "Responsável pelas pesquisas alquímicas"); -- Albedo
INSERT INTO Venti_Position (position_name, position_description) VALUES ("Capitão da Fatui", "Responsável pelas operações da Fatui"); -- Tartaglia

-- Inserts for Venti_Department (adjusted for Genshin characters)
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Administração de Mondstadt", "Gerencia as operações dos Cavaleiros de Favonius"); -- Jean, Kaeya, Lisa
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Religioso", "Responsável pelos assuntos espirituais e administrativos de Mondstadt"); -- Venti
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Exército de Watatsumi", "Coordena a defesa e estratégias da ilha de Watatsumi"); -- Kokomi
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Rituais de Liyue", "Coordena as cerimônias tradicionais e defesa de Liyue"); -- Zhongli
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Pesquisa Alquímica", "Laboratório dedicado à pesquisa alquímica avançada"); -- Albedo
INSERT INTO Venti_Department (department_name, department_description) VALUES ("Fatui", "Coordena operações secretas em nome da Tsaritsa"); -- Tartaglia

-- Inserts for Venti_Employee (aligned with Positions and Departments)
INSERT INTO Venti_Employee VALUES (null, "Venti", "111.222.333-44", "1993-06-16", "Taverna do Anjo", "71999999999", "vento@anemo.com", 15000.00, CURRENT_DATE(), 50, 1, 2, 1); -- Arconte Anemo
INSERT INTO Venti_Employee VALUES (null, "Jean", "142.589.621-77", "1994-04-30", "Sede dos Cavaleiros de Favonius", "71998097711", "jean@favonius.com", 15000.00, CURRENT_DATE(), 10, 3, 1, 1); -- Cavaleira do Tufão
INSERT INTO Venti_Employee VALUES (null, "Kaeya", "254.896.752-20", "1996-06-20", "Cavaleiros de Favonius", "71996046682", "kaeya@favonius.com", 12000.00, CURRENT_DATE(), 5, 1, 1, 1); -- Capitão da Companhia de Reconhecimento
INSERT INTO Venti_Employee VALUES (null, "Lisa", "785.478.123-98", "1995-06-09", "Biblioteca de Mondstadt", "71993048890", "lisa@favonius.com", 7000.00, CURRENT_DATE(), 0, 4, 1, 1); -- Bibliotecária
INSERT INTO Venti_Employee VALUES (null, "Albedo", "789.654.321-88", "1998-09-13", "Laboratório dos Cavaleiros", "71996048812", "albedo@favonius.com", 10000.00, CURRENT_DATE(), 3, 1, 5, 1); -- Chefe de Alquimia
INSERT INTO Venti_Employee VALUES (null, "Zhongli", "987.654.321-12", "1994-12-31", "Funerária de Liyue", "71991087744", "zhongli@liyue.com", 11000.00, CURRENT_DATE(), 0, 3, 4, 3); -- Protetor de Liyue
INSERT INTO Venti_Employee VALUES (null, "Sangonomiya Kokomi", "369.258.147-00", "1998-02-22", "Watatsumi Island", "71991234567", "kokomi@watatsumi.com", 20000.00, CURRENT_DATE(), 15, 2, 6, 4); -- General de Watatsumi
INSERT INTO Venti_Employee VALUES (null, "Tartaglia", "852.369.741-23", "1999-07-20", "Fábrica da Fatui", "71994567890", "tartaglia@fatui.com", 18000.00, CURRENT_DATE(), 10, 1, 6, 3); -- Capitão da Fatui

INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Kaeya, seu comportamento misterioso está impactando a confiança da equipe.", 3);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Lisa, precisamos de mais foco nas tarefas diárias, a biblioteca depende de você.", 4);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Albedo, seu trabalho com alquimia é brilhante, parabéns!", 5);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Zhongli, sua sabedoria é inigualável, continue liderando com excelência.", 6);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Jean, você trabalha muito. Vá tirar umas férias, pelo amor", 2);
INSERT INTO Venti_Performance_Review VALUES (null, CURRENT_DATE(), "Venti, você é um vagabundo. Pare de beber e vá trabalhar!!!", 1);

-- Inserts for Venti_TimeSheet
INSERT INTO Venti_TimeSheet VALUES (null, "2024-10-08", "08:00:00", "18:00:00", 2, 1);
INSERT INTO Venti_TimeSheet VALUES (null, "2024-10-08", "09:00:00", "17:00:00", null, 2);
INSERT INTO Venti_TimeSheet VALUES (null, "2024-10-08", "07:30:00", "19:00:00", 3, 3);
INSERT INTO Venti_TimeSheet VALUES (null, "2024-10-09", "08:00:00", "18:00:00", 2, 4);
INSERT INTO Venti_TimeSheet VALUES (null, "2024-10-09", "09:00:00", "17:30:00", 1, 5);
INSERT INTO Venti_TimeSheet VALUES (null, "2024-10-09", "08:30:00", "17:30:00", null, 6);

-- Inserts for Venti_Payroll
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 1, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 2, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 3, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 4, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 5, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 6, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 7, 1);
INSERT INTO Venti_Payroll VALUES (null, CURRENT_DATE(), 8, 1);

-- Inserts for Venti_Discount (added more entries)
INSERT INTO Venti_Discount VALUES (null, "Vale Transporte", 150.00, "FIXO", 1);
INSERT INTO Venti_Discount VALUES (null, "Plano de Saúde", 200.00, "FIXO", 2);
INSERT INTO Venti_Discount VALUES (null, "Imposto de Renda", 12.5, "PERCENTUAL", 3);
INSERT INTO Venti_Discount VALUES (null, "Previdência Privada", 500.00, "FIXO", 4);
INSERT INTO Venti_Discount VALUES (null, "Seguro de Vida", 50.00, "FIXO", 5);
INSERT INTO Venti_Discount VALUES (null, "IRRF", 27.5, "PERCENTUAL", 6);
INSERT INTO Venti_Discount VALUES (null, "Contribuição Sindical", 150.00, "FIXO", 7);
INSERT INTO Venti_Discount VALUES (null, "FGTS", 8.0, "PERCENTUAL", 8);

-- Inserts for Venti_Bonus (added more entries)
INSERT INTO Venti_Bonus VALUES (null, "Bônus de Desempenho", 1000.00, "FIXO", 1);
INSERT INTO Venti_Bonus VALUES (null, "Gratificação", 10.0, "PERCENTUAL", 2);
INSERT INTO Venti_Bonus VALUES (null, "Prêmio de Assiduidade", 500.00, "FIXO", 3);
INSERT INTO Venti_Bonus VALUES (null, "13º Salário", 10000.00, "FIXO", 4);
INSERT INTO Venti_Bonus VALUES (null, "PLR", 5000.00, "FIXO", 5);
INSERT INTO Venti_Bonus VALUES (null, "Hora Extra", 20.0, "PERCENTUAL", 6);
INSERT INTO Venti_Bonus VALUES (null, "Adicional Noturno", 25.0, "PERCENTUAL", 7);
INSERT INTO Venti_Bonus VALUES (null, "Bônus de Férias", 2000.00, "FIXO", 8);
