--TODO:1. Вынести вставку урока в отдельную процедуру 'sp_InsertLesson ???', и применить эту процедуру в 'sp_InsertScheduleStacionar'
USE PV_521_Import;
GO

CREATE OR ALTER PROCEDURE sp_InsertLesson
	@group AS INT
	,@discipline AS SMALLINT
	,@teacher AS SMALLINT
	,@date AS DATE
	,@time AS TIME
	,@in_lesson_counter AS INT 			--захватываем счетчик уроков снаружи
	,@out_lesson_counter AS INT OUTPUT 	--возвращаем счетчик
AS
BEGIN
	PRINT(FORMATMESSAGE(N'%i   %s   %s   %s',@in_lesson_counter, CAST(@date AS VARCHAR(24)), DATENAME(WEEKDAY,@date), CAST(@time AS VARCHAR(24))));
	IF NOT EXISTS (SELECT lesson_id
	FROM Schedule
	WHERE [date]=@date AND [time]=@time AND [group]=@group)
	BEGIN
		INSERT	Schedule
		VALUES
			(@group ,@discipline ,@teacher ,@date ,@time ,IIF(@date<GETDATE(),1,0));
		SET @out_lesson_counter = @in_lesson_counter + 1;
	--увеличиваем счетчик уроков снаружи только когда сработал IF
	END;
END;
GO
