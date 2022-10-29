DROP TABLE Grades;
DROP TABLE Reports;
DROP TABLE Tasks;
DROP TABLE Material;
DROP TABLE Disciplines;
DROP TABLE People;

DROP SEQUENCE People_seq;
DROP SEQUENCE Disciplines_seq;
DROP SEQUENCE Material_seq;
DROP SEQUENCE Reports_seq;
DROP SEQUENCE Grades_seq;
DROP SEQUENCE Tasks_seq;

CREATE OR REPLACE TYPE people_array IS VARRAY (30) OF NUMBER;
/

CREATE TABLE People (
  id number(10) PRIMARY KEY,
  name varchar(150) NOT NULL,
  status varchar(50) NOT NULL
);

CREATE SEQUENCE People_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER People_seq_tr
 BEFORE INSERT ON People FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT People_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Disciplines (
  id number(10) PRIMARY KEY,
  name varchar(100) NOT NULL,
  teacher number(10) NOT NULL,
  assistant number(10),
  students people_array NOT NULL
);

CREATE SEQUENCE Disciplines_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Disciplines_seq_tr
 BEFORE INSERT ON Disciplines FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Disciplines_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Tasks (
  id number(10) PRIMARY KEY,
  name varchar(100) NOT NULL,
  discipline number(10) NOT NULL,
  author number(10) NOT NULL,
  max_grade number(10),
  material varchar(255) NOT NULL
);

CREATE SEQUENCE Tasks_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Tasks_seq_tr
 BEFORE INSERT ON Tasks FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Tasks_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Material (
  id number(10) PRIMARY KEY,
  authors people_array NOT NULL,
  discipline number(10) NOT NULL,
  material varchar(255) NOT NULL
);

CREATE SEQUENCE Material_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Material_seq_tr
 BEFORE INSERT ON Material FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Material_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Reports (
  id number(10) PRIMARY KEY,
  discipline number(10) NOT NULL,
  task number(10) NOT NULL,
  report_date date NOT NULL,
  student number(10) NOT NULL,
  material varchar(255) NOT NULL
);

CREATE SEQUENCE Reports_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Reports_seq_tr
 BEFORE INSERT ON Reports FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Reports_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/


CREATE TABLE Grades (
  id number(10) PRIMARY KEY,
  student number(10) NOT NULL,
  teacher number(10) NOT NULL,
  discipline number(10) NOT NULL,
  report number(10) NOT NULL,
  grade number(10) NOT NULL
);


CREATE SEQUENCE Grades_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Grades_seq_tr
 BEFORE INSERT ON Grades FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Grades_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

ALTER TABLE Reports ADD FOREIGN KEY (student) REFERENCES People (id);
ALTER TABLE Reports ADD FOREIGN KEY (task) REFERENCES Tasks (id);
ALTER TABLE Disciplines ADD FOREIGN KEY (teacher) REFERENCES People (id);
ALTER TABLE Disciplines ADD FOREIGN KEY (assistant) REFERENCES People (id);
ALTER TABLE Grades ADD FOREIGN KEY (student) REFERENCES People (id);
ALTER TABLE Grades ADD FOREIGN KEY (teacher) REFERENCES People (id);
ALTER TABLE Material ADD FOREIGN KEY (discipline) REFERENCES Disciplines (id);
ALTER TABLE Reports ADD FOREIGN KEY (discipline) REFERENCES Disciplines (id);
ALTER TABLE Grades ADD FOREIGN KEY (discipline) REFERENCES Disciplines (id);
ALTER TABLE Grades ADD FOREIGN KEY (report) REFERENCES Reports (id);

INSERT INTO People (name, status) VALUES ('Borys', 'teacher');
INSERT INTO People (name, status) VALUES ('Dmytro', 'student');
INSERT INTO People (name, status) VALUES ('Petro', 'student');
INSERT INTO People (name, status) VALUES ('Danil', 'student');

INSERT INTO Disciplines (name, teacher, students) VALUES ('Data Bases', 1, people_array(2, 3, 4));

INSERT INTO Material (authors, discipline, material) VALUES (people_array(1), 1, 'material_url');
INSERT INTO Material (authors, discipline, material) VALUES (people_array(1), 1, 'material_url');

INSERT INTO Tasks (name, discipline, author, max_grade, material) VALUES ('First task', 1, 1, 100, 'material_url1');
INSERT INTO Tasks (name, discipline, author, max_grade, material) VALUES ('Second task', 1, 1, 100, 'material_url2'); 

INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 1, to_date('10-OCT-2022 17:04', 'DD-MON-YYYY HH24:MI'), 2, 'report_url1');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 2, to_date('11-OCT-2022 04:20', 'DD-MON-YYYY HH24:MI'), 2, 'report_url2');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 1, to_date('13-OCT-2022 20:20', 'DD-MON-YYYY HH24:MI'), 3, 'report_url3');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 1, to_date('10-OCT-2022 07:45', 'DD-MON-YYYY HH24:MI'), 4, 'report_url4');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 2, to_date('11-OCT-2022 15:01', 'DD-MON-YYYY HH24:MI'), 4, 'report_url5');

INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (2, 1, 1, 1, 90);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (2, 1, 1, 2, 82);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (3, 1, 1, 3, 55);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (4, 1, 1, 4, 65);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (4, 1, 1, 5, 85);

COLUMN NAME FORMAT A50;
COLUMN MATERIAL FORMAT A50;
COLUMN STATUS FORMAT A50;
COLUMN STUDENTS FORMAT A50;
