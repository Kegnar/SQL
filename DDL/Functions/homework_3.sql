/* TODO:
1. Написать функцию GetNextLearningDay, которая определяет в какой день недели будет следующее занятие у группы;
2. Написать функцию GetNextLearningDate, которая определяет дату следующего занятия у группы;
3. При выставлении расписания нужно предусмотреть каникулы и праздничные дни;
4. Посчитать зариплату преподавателям;
*/
CREATE OR ALTER FUNCTION GetNextLearningDay (@group AS INT, @discipline AS SMALLINT) RETURNS DATE AS BEGIN
SELECT
    *
FROM
    @group END
;
