USE PV_521_Import
set datefirst 1

EXEC [dbo].[sp_InsertScheduleStacionar] N'PV_521', N'%ADO.NET%', N'Олег', N'2026-01-21';

EXEC [dbo].[sp_SelectScheduleFor] N'PV_521'

