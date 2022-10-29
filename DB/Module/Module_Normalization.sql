CREATE TABLE Employee (
  id number(10) PRIMARY KEY,
  name varchar2(255),
  status varchar2(255),
  experience varchar2(255),
  date_of_birth date
);

CREATE SEQUENCE Employee_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Employee_seq_tr
 BEFORE INSERT ON Employee FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Employee_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE CrewMember (
  id number(10) PRIMARY KEY,
  emp_id number(10),
  flight_id number(10)
);

CREATE SEQUENCE CrewMember_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER CrewMember_seq_tr
 BEFORE INSERT ON CrewMember FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT CrewMember_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Route (
  id number(10) PRIMARY KEY,
  start_airport number(10),
  end_airport number(10),
  airplane_id number(10),
  company_id number(10)
);

CREATE SEQUENCE Route_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Route_seq_tr
 BEFORE INSERT ON Route FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Route_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Flight (
  id number(10),
  start_date date,
  route_id number(10),
  PRIMARY KEY (id, start_date)
);

CREATE SEQUENCE Flight_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Flight_seq_tr
 BEFORE INSERT ON Flight FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Flight_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Airport (
  id number(10) PRIMARY KEY,
  City varchar2(255)
);

CREATE SEQUENCE Airport_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Airport_seq_tr
 BEFORE INSERT ON Airport FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Airport_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Company (
  id number(10) PRIMARY KEY,
  name varchar2(255)
);

CREATE SEQUENCE Company_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Company_seq_tr
 BEFORE INSERT ON Company FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Company_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

CREATE TABLE Airplane (
  id number(10) PRIMARY KEY,
  bort_no number(10),
  type varchar2(255),
  number_of_seats varchar2(255)
);

CREATE SEQUENCE Airplane_seq START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER Airplane_seq_tr
 BEFORE INSERT ON Airplane FOR EACH ROW
 WHEN (NEW.id IS NULL)
BEGIN
 SELECT Airplane_seq.NEXTVAL INTO :NEW.id FROM DUAL;
END;
/

ALTER TABLE CrewMember ADD FOREIGN KEY (flight_id) REFERENCES Flight (id);
ALTER TABLE Flight ADD FOREIGN KEY (route_id) REFERENCES Route (id);
ALTER TABLE CrewMember ADD FOREIGN KEY (emp_id) REFERENCES Employee (id);
ALTER TABLE Route ADD FOREIGN KEY (start_airport) REFERENCES Airport (id);
ALTER TABLE Route ADD FOREIGN KEY (end_airport) REFERENCES Airport (id);
ALTER TABLE Route ADD FOREIGN KEY (company_id) REFERENCES Company (id);
ALTER TABLE Route ADD FOREIGN KEY (airplane_id) REFERENCES Airplane (id);
