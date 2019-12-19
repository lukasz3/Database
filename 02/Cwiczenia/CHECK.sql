USE TrainingDb;

CREATE TABLE CheckTest
(
Id INT PRIMARY KEY,
EmployeeId INT NOT NULL,
CONSTRAINT CheckTest_check_employee_id CHECK (EmployeeId > 10)
);



INSERT INTO CheckTest VALUES (1, 20);
INSERT INTO CheckTest VALUES (2, 3);

