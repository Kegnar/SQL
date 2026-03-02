/*TODO: 1. Написать функцию GetNextLearningDay, которая определяет в какой день недели будет следующее занятие у группы;
2. Написать функцию GetNextLearningDate, которая определяет дату следующего занятия у группы;
3. При выставлении расписания нужно предусмотреть каникулы и праздничные дни;
4. Посчитать зарплату преподавателям;*/

USE PV_521_Import
GO
--1
CREATE OR ALTER FUNCTION GetNextLearningDay(@group AS INT) RETURNS DATE
AS
BEGIN
    RETURN DATENAME(WEEKDAY, (SELECT TOP 1 date
                                FROM Schedule
                               WHERE [group] = 521
                                 AND date >= CAST(GETDATE() AS DATE))) --вытаскиваем только день недели из datetime
END;

--2
CREATE OR ALTER FUNCTION GetNextLearningDate(@group AS INT) RETURNS DATE
AS
BEGIN
    RETURN (SELECT TOP 1 date
              FROM Schedule
             WHERE [group] = 521
               AND date >= CAST(GETDATE() AS DATE)) --вытаскиваем только день недели из datetime
END;

--3 TODO: надо допилить до конца
CREATE OR ALTER FUNCTION CheckIfHoliday(@date AS DATE) RETURNS BIT
AS
BEGIN
    DECLARE @day AS TINYINT = (SELECT day FROM Holidays)
    DECLARE @month AS TINYINT = (SELECT month FROM Holidays)
    DECLARE @year AS INT = (YEAR(@date))
    DECLARE @check_date AS DATE = DATEFROMPARTS(@year, @month, @day)
    RETURN IIF(@check_date = @date, 1, 0)
END
