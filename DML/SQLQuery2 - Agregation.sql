--SQLQuery2 - Agregations
USE PV_521_Import;

-- SELECT
-- 	direction_name AS N'Направление обучения'
-- 	, COUNT(group_id) AS N'Количество групп'
-- FROM Directions, Groups
-- WHERE direction = direction_id
-- GROUP BY direction_name
SELECT
		direction_name AS N'Направление'
	, 	COUNT(stud_id) AS N'Количество'

FROM Students, Groups, Directions
WHERE [group] = group_id
	AND direction = direction_id
GROUP BY direction_name