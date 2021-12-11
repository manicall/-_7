--12.11
USE Hotel;
 GRANT CREATE TABLE, CREATE PROCEDURE
 TO peter, mary;

--12.12
 USE Hotel;
 GRANT CREATE FUNCTION
 TO mary; 

--12.13
USE Hotel;
 GRANT SELECT ON Статистика
 TO peter, mary;

--12.14
USE Hotel;
 GRANT UPDATE ON Статистика (ДлительностьПроживания, СуммаЗаПроживание)
 TO peter;

--12.15
USE Hotel;
 GRANT VIEW DEFINITION ON OBJECT::Статистика TO peter;
 GRANT VIEW DEFINITION ON SCHEMA::dbo TO peter;

--12.16
USE Hotel;
 GRANT CONTROL ON DATABASE::Hotel TO peter;

--12.17
USE Hotel;
 GRANT SELECT ON Статистика TO mary
 WITH GRANT OPTION;

--12.18
USE Hotel;
 DENY CREATE TABLE, CREATE PROCEDURE
 TO peter;

--12.19
USE Hotel;
 GRANT SELECT ON Статистика
 TO PUBLIC;
 DENY SELECT ON Статистика
 TO peter, mary;

--12.20
USE Hotel;
 REVOKE SELECT ON Статистика FROM public;


--=================================================
--=================================================


-- права первого модератора (директора)
-- Разрешаем просматривать данные из таблицы Сотрудники
USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Сотрудники
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Дополнительные_услуги
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Номер
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Размещение
TO FirstModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Комфортность
TO FirstModerator;


USE Hotel;
GRANT SELECT ON Бронирование
TO FirstModerator;

USE Hotel;
GRANT SELECT ON Заезд
TO FirstModerator;

USE Hotel;
GRANT SELECT ON Клиент
TO FirstModerator;

USE Hotel;
GRANT SELECT ON Пользование_дополнительными_услугами
TO FirstModerator;

USE Hotel;
GRANT SELECT ON Ребенок_клиента
TO FirstModerator;



-- права второго модератора (регистратор)
USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Бронирование
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Заезд
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Клиент
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Пользование_дополнительными_услугами
TO SecondModerator;

USE Hotel;
GRANT UPDATE, SELECT, INSERT, DELETE ON Ребенок_клиента
TO SecondModerator;


USE Hotel;
GRANT SELECT ON Дополнительные_услуги
TO SecondModerator;

USE Hotel;
GRANT SELECT ON Номер
TO SecondModerator;

USE Hotel;
GRANT SELECT ON Размещение
TO SecondModerator;

USE Hotel;
GRANT SELECT ON Комфортность
TO SecondModerator;

USE Hotel;
GRANT SELECT ON Сотрудники
TO SecondModerator;

--=================================================
--=================================================


-- права клиента
USE Hotel;
GRANT SELECT ON dbo.Номер TO Client;
GRANT SELECT ON dbo.Дополнительные_услуги TO Client;


-- Представления для первого модератора
USE Hotel;
GRANT SELECT ON dbo.View_Arrival TO FirstModerator;
GRANT SELECT ON dbo.View_ClientChild TO FirstModerator;
GRANT SELECT ON dbo.View_Reservation TO FirstModerator;
GRANT SELECT ON dbo.View_Room TO FirstModerator;
GRANT SELECT ON dbo.View_UsageService TO FirstModerator;

 -- Представления для второго модератора
USE Hotel;
GRANT SELECT ON dbo.View_Arrival TO SecondModerator;
GRANT SELECT ON dbo.View_ClientChild TO SecondModerator;
GRANT SELECT ON dbo.View_Reservation TO SecondModerator;
GRANT SELECT ON dbo.View_Room TO SecondModerator;
GRANT SELECT ON dbo.View_UsageService TO SecondModerator;

-- Представления для клиента
USE Hotel;
GRANT SELECT ON dbo.View_Room TO Client;
