
-- 
-- 		 	1. По каждому направлению обучения вывести количество групп и количество студентов
-- 			2. Для каждого преподавателя вывести количество дисциплин, котороые он может вести
-- 			3. Для каждой дисциплины вывести количество преподавателей, которые могут вести эту дисциплину
--			4. Заполнить таблицу с расписанием для своей группы от начала обучения по сей день

USE PV_521_Import;
--1
SELECT
	d.direction_name AS [Направление]
	,COUNT(DISTINCT g.group_id) AS [Количество групп]
	,COUNT(s.stud_id) AS [Количество студентов]
FROM Directions d
	LEFT JOIN Groups g ON d.direction_id = g.direction
	LEFT JOIN Students s ON g.group_id = s.[group]
GROUP BY 
    d.direction_id, 
    d.direction_name;

--2
SELECT
	t.last_name
	,t.first_name
	,t.middle_name
	,COUNT(tdr.discipline) AS [Количество дисциплин]
FROM Teachers t
	LEFT JOIN TeachersDisciplinesRelation tdr ON t.teacher_id = tdr.teacher
GROUP BY 
    t.teacher_id, 
    t.last_name, 
    t.first_name, 
    t.middle_name;

--3
SELECT
	d.discipline_name AS [Дисциплина]
	,COUNT(tdr.teacher) AS [Количество преподавателей]
FROM Disciplines d
	LEFT JOIN TeachersDisciplinesRelation tdr ON d.discipline_id = tdr.discipline
GROUP BY 
    d.discipline_id, 
    d.discipline_name;

--4 