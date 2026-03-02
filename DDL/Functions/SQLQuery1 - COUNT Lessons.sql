--SQLQuery1 - COUNT Lessons
USE PV_521_Import
;

GO
CREATE OR ALTER FUNCTION CountLessons (@group AS INT, @discipline AS SMALLINT) RETURNS TINYINT AS BEGIN RETURN (
	SELECT
		COUNT(lesson_id)
	FROM
		Schedule
	WHERE
		[group] = @group
		AND discipline = @discipline
) END
;