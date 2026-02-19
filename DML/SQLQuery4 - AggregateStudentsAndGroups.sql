USE PV_521_Import
GO

SELECT
	direction_name   AS [Направление обучения]
	 
	 ,(SELECT COUNT(DISTINCT group_id)
	FROM Groups
	WHERE direction = direction_id)  AS [Количество групп]
	 
	 ,(SELECT
		COUNT(DISTINCT stud_id)
	FROM
		Students
		 ,Groups
	WHERE [group] = group_id
		AND direction = direction_id) AS [Количество студентов]
FROM
	Directions
;

