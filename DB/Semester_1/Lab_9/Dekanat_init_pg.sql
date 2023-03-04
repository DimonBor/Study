DROP TABLE IF EXISTS StudInCourse;
DROP TABLE IF EXISTS Authors;
DROP TABLE IF EXISTS Grades;
DROP TABLE IF EXISTS Reports;
DROP TABLE IF EXISTS Tasks;
DROP TABLE IF EXISTS Material;
DROP TABLE IF EXISTS Disciplines;
DROP TABLE IF EXISTS People_d;

CREATE TABLE People_d (
  id SERIAL PRIMARY KEY,
  name varchar(150) NOT NULL,
  status varchar(50) NOT NULL
);

CREATE TABLE Disciplines (
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  teacher integer NOT NULL,
  assistant integer
);

CREATE TABLE StudInCourse (
  studID SERIAL NOT NULL,
  disciplineID integer NOT NULL,
  CONSTRAINT stud_key_pair PRIMARY KEY (studID, disciplineID)
);

CREATE TABLE Tasks (
  id SERIAL PRIMARY KEY,
  name varchar(100) NOT NULL,
  discipline integer NOT NULL,
  author integer NOT NULL,
  max_grade integer,
  material integer
);

CREATE TABLE Material (
  id SERIAL PRIMARY KEY,
  discipline integer NOT NULL,
  material varchar(255) NOT NULL
);

CREATE TABLE Authors (
  authID SERIAL NOT NULL,
  materialID integer NOT NULL,
  CONSTRAINT authors_key_pair PRIMARY KEY (authID, materialID)
);

CREATE TABLE Reports (
  id SERIAL PRIMARY KEY,
  discipline integer NOT NULL,
  task integer NOT NULL,
  report_date date NOT NULL,
  student integer NOT NULL,
  material varchar(255) NOT NULL
);

CREATE TABLE Grades (
  id SERIAL PRIMARY KEY,
  student integer NOT NULL,
  teacher integer NOT NULL,
  discipline integer NOT NULL,
  report integer NOT NULL,
  grade integer NOT NULL
);

ALTER TABLE Reports ADD FOREIGN KEY (student) REFERENCES People_d (id);
ALTER TABLE Reports ADD FOREIGN KEY (task) REFERENCES Tasks (id);
ALTER TABLE Disciplines ADD FOREIGN KEY (teacher) REFERENCES People_d (id);
ALTER TABLE Disciplines ADD FOREIGN KEY (assistant) REFERENCES People (id);
ALTER TABLE Grades ADD FOREIGN KEY (student) REFERENCES People_d (id);
ALTER TABLE Grades ADD FOREIGN KEY (teacher) REFERENCES People_d (id);
ALTER TABLE Material ADD FOREIGN KEY (discipline) REFERENCES Disciplines (id);
ALTER TABLE Reports ADD FOREIGN KEY (discipline) REFERENCES Disciplines (id);
ALTER TABLE Grades ADD FOREIGN KEY (discipline) REFERENCES Disciplines (id);
ALTER TABLE Grades ADD FOREIGN KEY (report) REFERENCES Reports (id);
ALTER TABLE StudInCourse ADD FOREIGN KEY (studID) REFERENCES People_d (id);
ALTER TABLE StudInCourse ADD FOREIGN KEY (disciplineID) REFERENCES Disciplines (id);
ALTER TABLE Authors ADD FOREIGN KEY (authID) REFERENCES People_d (id);
ALTER TABLE Authors ADD FOREIGN KEY (materialID) REFERENCES Material (id);
ALTER TABLE Tasks ADD FOREIGN KEY (material) REFERENCES Material (id);

INSERT INTO People_d (name, status) VALUES ('Borys', 'teacher');
INSERT INTO People_d (name, status) VALUES ('Dmytro', 'student');
INSERT INTO People_d (name, status) VALUES ('Petro', 'student');
INSERT INTO People_d (name, status) VALUES ('Danil', 'student');

INSERT INTO Disciplines (name, teacher) VALUES ('Data Bases', 1);

INSERT INTO StudInCourse (studID, disciplineID) VALUES (2, 1);
INSERT INTO StudInCourse (studID, disciplineID) VALUES (3, 1);
INSERT INTO StudInCourse (studID, disciplineID) VALUES (4, 1);

INSERT INTO Material (discipline, material) VALUES (1, 'material_url');
INSERT INTO Material (discipline, material) VALUES (1, 'material_url');

INSERT INTO Authors (authID, materialID) VALUES(1, 1); 
INSERT INTO Authors (authID, materialID) VALUES(1, 2);

INSERT INTO Tasks (name, discipline, author, max_grade, material) VALUES ('First task', 1, 1, 100, 1);
INSERT INTO Tasks (name, discipline, author, max_grade, material) VALUES ('Second task', 1, 1, 100, 2); 
INSERT INTO Tasks (name, discipline, author, max_grade) VALUES ('Third task', 1, 1, 100); 

INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 1, to_date('10-OCT-2022 17:04', 'DD-MON-YYYY HH24:MI'), 2, 'report_url1');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 2, to_date('11-OCT-2022 04:20', 'DD-MON-YYYY HH24:MI'), 2, 'report_url2');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 1, to_date('13-OCT-2022 20:20', 'DD-MON-YYYY HH24:MI'), 3, 'report_url3');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 1, to_date('10-OCT-2022 07:45', 'DD-MON-YYYY HH24:MI'), 4, 'report_url4');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 2, to_date('11-OCT-2022 15:01', 'DD-MON-YYYY HH24:MI'), 4, 'report_url5');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 2, to_date('15-OCT-2022 15:01', 'DD-MON-YYYY HH24:MI'), 4, 'report_url6');
INSERT INTO Reports (discipline, task, report_date, student, material) VALUES (1, 2, to_date('15-OCT-2022 16:05', 'DD-MON-YYYY HH24:MI'), 4, 'report_url7');
 
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (2, 1, 1, 1, 90);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (2, 1, 1, 2, 82);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (3, 1, 1, 3, 55);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (4, 1, 1, 4, 65);
INSERT INTO Grades (student, teacher, discipline, report, grade) VALUES (4, 1, 1, 5, 85);

