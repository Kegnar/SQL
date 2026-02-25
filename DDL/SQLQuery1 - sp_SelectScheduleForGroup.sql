USE PV_521_Import
GO
CREATE PROCEDURE sp_SelectScheduleFor
	@group	AS NCHAR(10)
AS
BEGIN
	DECLARE @group_id AS INT = (SELECT group_id
	FROM Groups
	WHERE group_name LIKE @group)
	SELECT
		[Группа] = group_name
		,[Дисциплина] = discipline_name
		,[Дата] = [date]
		,[Время] = [time]
		,[День] = DATENAME(WEEKDAY, [date]) 
		,[Преподаватель] = FORMATMESSAGE(N'%s %s %s', last_name, first_name, middle_name)
		,[Статус] = IIF(spent = 1, N'Проведено',N'Запланировано')

	FROM Schedule ,Groups ,Teachers ,Disciplines 
	WHERE [group] = @group AND discipline = discipline_id AND teacher = teacher_id
END;
