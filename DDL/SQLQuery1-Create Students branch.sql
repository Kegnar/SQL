--SQLQuery1-Create Students branch use PV_521_DDL;
CREATE TABLE Directions
(
	direction_id tinyint PRIMARY KEY,
	direction_name NVARCHAR(150) NOT NULL,
);

CREATE TABLE Groups
(
	group_id INT PRIMARY KEY,
	group_name NVARCHAR(24) NOT NULL,
	direction tinyint NOT NULL CONSTRAINT FK_Groups_Direction FOREIGN KEY REFERENCES Directions (direction_id)
);

CREATE TABLE Students
(
	student_id INT PRIMARY KEY identity(1, 1),
	last_name NVARCHAR(50) NOT NULL,
	first_name NVARCHAR(50) NOT NULL,
	middle_name NVARCHAR(50),
	birth_date DATE NOT NULL,
	[group] INT NOT NULL --group - является зарезервированным словом в SQL, 
		-- названия полей, совпадающих с зарезервированными, нужно заключать в [] 
		CONSTRAINT FK_Students_Group FOREIGN KEY REFERENCES Groups (group_id),
)
--drop TABLE Students, Groups, Directions
