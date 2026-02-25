-- TODO: 1. Выставить расписание на базовый семестр по схеме 12-21;

USE PV_521_Import;
-- Дергаем ID группы
DECLARE @group  AS INT = (SELECT group_id
FROM Groups
WHERE group_name = N'PV_521');

-- ID основ C++
DECLARE @cpp_lesson AS SMALLINT = 
(
SELECT discipline_id
FROM Disciplines
WHERE discipline_name  = N'Процедурное программирование на языке C++'
);

DECLARE @hardware_lesson AS SMALLINT = 
(
SELECT discipline_id
FROM Disciplines
WHERE discipline_name  = N'Hardware-PC'
);
DECLARE @start_date AS	DATE	=	N'2025-12-24';
DECLARE @start_time	AS	TIME	=	(SELECT start_time
FROM Groups
WHERE group_id=@group);

PRINT (@group);
PRINT (@cpp_lesson);
PRINT (@hardware_lesson);
