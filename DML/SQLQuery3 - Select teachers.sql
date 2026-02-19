-- SQLQuery3 - Select teachers
USE PV_521_Import;

SELECT
	[Преподаватель] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name)
, 	[Дата рождения] = birth_date
,	[Возраст] 		= CAST( (DATEDIFF(DAY, birth_date, GETDATE()) / 365.25) AS TINYINT) 
FROM Teachers
ORDER BY [Возраст] 

