-- Создание БД в mysql workbecnh
DROP DATABASE IF EXISTS ProjectManagement;
CREATE DATABASE ProjectManagement;
USE ProjectManagement;
DROP TABLE IF EXISTS officeDepartment, workPositions, project, employeePrograms, employee;


    CREATE TABLE `officeDepartment` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `officeName` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `employee` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `employeeName` VARCHAR(200) NOT NULL,
        `officeDepartmentId` INT NOT NULL,
        `positionId` INT NOT NULL,
        `age` smallint NOT NULL,
        `male` bool NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `workPositions` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `positionName` VARCHAR(100) NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `project` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `projectTitle` VARCHAR(100) NOT NULL DEFAULT 'unknownProject',
        `projectDescription` TEXT NOT NULL,
        `projectDate` DATE NOT NULL,
        `employeeId` INT NOT NULL,
        `officeDepartmentId` INT NOT NULL,
        PRIMARY KEY (`id`)
    );

    CREATE TABLE `employeePrograms` (
        `id` INT NOT NULL AUTO_INCREMENT,
        `employeeId` INT NOT NULL,
        `programName` VARCHAR(200) NOT NULL,
        `login` VARCHAR(100) NOT NULL DEFAULT 'LOGIN NOT SET',
        `password` VARCHAR(100) NOT NULL DEFAULT 'PASSWORD NOT SET',
        `access` bool NOT NULL DEFAULT false,
        PRIMARY KEY (`id`)
    );


    ALTER TABLE `employee` ADD CONSTRAINT `employeeFk0` FOREIGN KEY (`officeDepartmentId`) REFERENCES `officeDepartment`(`id`);

    ALTER TABLE `employee` ADD CONSTRAINT `employeeFk1` FOREIGN KEY (`positionId`) REFERENCES `workPositions`(`id`);

    ALTER TABLE `project` ADD CONSTRAINT `projectFk0` FOREIGN KEY (`employeeId`) REFERENCES `employee`(`id`);

    ALTER TABLE `project` ADD CONSTRAINT `projectFk1` FOREIGN KEY (`officeDepartmentId`) REFERENCES `employee`(`officeDepartmentId`);

    ALTER TABLE `employeePrograms` ADD CONSTRAINT `employeeProgramsFk0` FOREIGN KEY (`employeeId`) REFERENCES `employee`(`id`);


-- внесение данных
INSERT INTO officeDepartment(officeName) 
VALUES	("Производственный департамент"),                   
        ("Финансовый департамент"), 
        ("Юридический департамент"),                   
        ("Коммерческий департамент"), 
        ("Бухгатерский департамент"),   
        ("Департамент рекламы"), 
        ("Департамент планирования"),                           
        ("Департамент денежного регулирования"), 
        ("Внешнеэкономический департамент"),              
        ("Департамент логистики");

INSERT INTO workPositions(positionName) 
VALUES	("Менеджер отдела продаж"),                     
        ("Менеджер по работе с клиентами"), 
        ("Директор производственного лепартамента"), 
        ("Специалист логистики"), 
        ("Коммерческий директор"),        
        ("Специалист поддержки"), 
        ("Инжинер"),                                    
        ("HR-менеджер"), 
        ("Юрист"),              
        ("Бухгалтер");

INSERT INTO employee(officeDepartmentId, positionId, employeeName, male, age)
VALUES 	(6, 1, "Попова Виктория Фёдоровна", True, 34),
        (9, 2, "Филатова Ольга Матвеевна", True, 22),
        (2, 3, "Александров Матвей Васильевич", True, 28),
        (3, 4, "Семенова Марина Савельевна", True, 53),
        (8, 5, "Савельева Виктория Игоревна", True, 34),
        (9, 6, "Долгов Тихон Константинович", False, 43),
        (7, 7, "Фирсова Екатерина Артёмовна", False, 18),
        (6, 8, "Власова Ева Павловна", False, 54),
        (9, 9, "Агапов Матвей Ярославович", False, 33),
        (4, 10, "Захаров Павел Владимирович", False, 56);


INSERT INTO project(employeeId, officeDepartmentId, projectDate, projectTitle, projectDescription)
VALUES  (1, 2, "2023-12-19", "Акция 2 + 1", "При покупки нашего антивирусного ПО, предлагаем клеиенту систему по защите его платежей."),
        (1, 2, "2022-01-01", "Реклама в интернете", "Создать несколько вариантов для контекстной рекламы в интернете."),
        (1, 2, "2022-05-06", "Демо-версия ПО", "В целях привлечений новой аудитории рекомендуется создать демо-версию нашего антивируса."),
        (8, 6, "2023-04-22", "Бесплатный курс интернет-безопасности", "Совместно с депортаментом сетевой безопасности создать бесплатный курс для наших клиентов по сетевой безопасности."),
        (3, 2, "2023-12-01", "Унификация антивируса", "Реализовать утилитную версию нашего антивируса для unix-подобных систем. Так же создать более тяжелую с GUI для тех же unix-систем."),
        (3, 2, "2021-11-15", "Анализатор спама", "Импортирование антивируса к почте, для устранения спама содержащего вирусные ссылки."),
        (3, 2, "2016-06-4", "Песочница в интеренете", "При переходе пользователя по фишинг или вредоносной ссылке, запускать браузер в виртуальном адресном пространстве, для обеспечения безопасности."),
        (8, 6, "2018-12-23", "Разветвление рекламной политики", "Создания направления рекламы иностранных клиентов. Реклама  на зарубежных сайтах."),
        (8, 6, "2023-07-22", "Подарки постоянным клиентам", "Клиенты, покупающие подписку на наш антивирус более 2-ух лет подряд получают месяц бесплатной подиски в подарок."),
        (8, 6, "2023-09-09", "Убрать рекламу из внутреннего приложения", "В антивирусном приложении нужно убрать рекламу в целях повышения его привлекательности. Оставить рекламу только на демо-версии.");

INSERT INTO employeePrograms(employeeId, programName, login, password, access)
VALUES  (1, "ERWIN data modeler", "Malwla-s", "mk123ijA@*1_", True),
        (1, "Microsoft Office Word", "-", "-", True),
        (1, "Figma Corp Edition", "Malwla-s", "mk123ijA@*1_", True),
        (3, "Django-admin", "adm_21lka@kl", "Y(*HDUAINd8o2ui1)ad2", False),
        (3, "Project-creator", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "SQL-admin", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "Skype Corp Edition", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (3, "FredOn Analys", "a84rmkrzjoi", "Y(*HDUAINd8o2ui1)ad2", True),
        (8, "employee Base", "Keyajzmw23", "fsj73yhUdj12h:!@:L", True),
        (8, "VCK Company Account Editor", "Keyajzmw23", "fsj73yhUdj12h:!@:L", True);

-- ниже описаны триггеры для всех имеющихся связей
-- INSERT триггеры
DROP TRIGGER IF EXISTS projectInsert;
DELIMITER //
CREATE TRIGGER projectInsert BEFORE INSERT ON project
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employee_id) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет возможности установить employee_id. Такого сотрудника не существует.';
END IF;
IF (NEW.officeDepartmentId != (SELECT employee.officeDepartmentId FROM employee WHERE employee.id = NEW.employeeId)) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Этот сотрудник не принадлежит к office_department.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employeeInsert;
DELIMITER //
CREATE TRIGGER employeeInsert BEFORE INSERT ON employee
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(officeDepartment.id) FROM officeDepartment WHERE officeDepartment.id = NEW.officeDepartmentId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого office_department_id.';
END IF;
IF ((SELECT COUNT(workPositions.id) FROM workPositions WHERE workPositions.id = NEW.positionId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого position_id.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employeeProgramsInsert;
DELIMITER //
CREATE TRIGGER employeeProgramsInsert BEFORE INSERT ON employeePrograms
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employeeId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Не такого employee_id.';
END IF;
END //
DELIMITER ;

-- UPDATE триггеры
DROP TRIGGER IF EXISTS projectUpdate;
DELIMITER //
CREATE TRIGGER projectUpdate BEFORE UPDATE ON project
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employeeId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет возможности обновить employeeId. Такого сотрудника не существует.';
END IF;

IF (NEW.officeDepartmentId != (SELECT employee.officeDepartmentId FROM employee WHERE employee.id = NEW.employeeId)) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Этот сотрудник не принадлежит к officeDepartment.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employeeUpdate;
DELIMITER //
CREATE TRIGGER employeeUpdate BEFORE UPDATE ON employee
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(officeDepartment.id) FROM officeDepartment WHERE officeDepartment.id = NEW.officeDepartmentId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого officeDepartmentId.';
END IF;
IF ((SELECT COUNT(workPositions.id) FROM workPositions WHERE workPositions.id = NEW.positionId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого positionId.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS employeeProgramsUpdate;
DELIMITER //
CREATE TRIGGER employeeProgramsUpdate BEFORE UPDATE ON employeePrograms
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.id) FROM employee WHERE employee.id = NEW.employeeId) = 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Нет такого employeeId.';
END IF;
END //
DELIMITER ;

-- DELETE триггеры
DROP TRIGGER IF EXISTS employeeProgramsUpdate;
DELIMITER //
CREATE TRIGGER employeeDelete BEFORE DELETE ON employee
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employeePrograms.employeeId) FROM employeePrograms WHERE employeePrograms.employeeId = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить этого сотрудника. Потому что он находится в таблице employeePrograms. Удалите его из таблицы employeePrograms сначала.';
END IF;
IF ((SELECT COUNT(project.employeeId) FROM project WHERE project.employeeId = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить этого сотрудника. Потому что он находится в таблице project. Удалите его из таблицы project сначала.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS officeDepartmentDelete;
DELIMITER //
CREATE TRIGGER officeDepartmentDelete BEFORE DELETE ON officeDepartment
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.officeDepartmentId) FROM employee WHERE employee.officeDepartment_id = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить этот officeDepartment. Потому что в нем находя некоторые сотрудники.';
END IF;
END //
DELIMITER ;

DROP TRIGGER IF EXISTS workPositionsDelete;
DELIMITER //
CREATE TRIGGER workPositionsDelete BEFORE DELETE ON workPositions
FOR EACH ROW 
BEGIN
IF ((SELECT COUNT(employee.positionId) FROM employee WHERE employee.positionId = OLD.id) != 0) THEN 
        SIGNAL SQLSTATE  '45000' SET MESSAGE_TEXT = 'Вы не можете удалить эту должность. Потому что некторые сотрудники находятся в ней';
END IF;
END //
DELIMITER ;
