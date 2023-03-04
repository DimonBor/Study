DROP TABLE transactions;
DROP TABLE workers;
DROP TABLE positions;
DROP TABLE accounts;
DROP TABLE people;
DROP SEQUENCE people_seq;
DROP SEQUENCE workers_seq;
DROP SEQUENCE positions_seq;
DROP SEQUENCE accounts_seq;
DROP SEQUENCE transactions_seq;
CREATE TABLE positions (
  positionID number(10) PRIMARY KEY,
  name varchar2(50),
  authority number(10)
);
CREATE SEQUENCE positions_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER positions_seq_tr
 BEFORE INSERT ON positions FOR EACH ROW
 WHEN (NEW.positionID IS NULL)
BEGIN
 SELECT positions_seq.NEXTVAL INTO :NEW.positionID FROM DUAL;
END;
/
CREATE TABLE workers (
  workerID number(10) PRIMARY KEY,
  pID number(10),
  position number(10)
);
CREATE SEQUENCE workers_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER workers_seq_tr
 BEFORE INSERT ON workers FOR EACH ROW
 WHEN (NEW.workerID IS NULL)
BEGIN
 SELECT workers_seq.NEXTVAL INTO :NEW.workerID FROM DUAL;
END;
/
CREATE TABLE people (
  ID number(10) PRIMARY KEY,
  firstname varchar2(50),
  secondname varchar2(50)
);
CREATE SEQUENCE people_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER people_seq_tr
 BEFORE INSERT ON people FOR EACH ROW
 WHEN (NEW.ID IS NULL)
BEGIN
 SELECT people_seq.NEXTVAL INTO :NEW.ID FROM DUAL;
END;
/
CREATE TABLE accounts (
  accountID number(10) PRIMARY KEY,
  clientID number(10),
  balance number(10)
);
CREATE SEQUENCE accounts_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER accounts_seq_tr
 BEFORE INSERT ON accounts FOR EACH ROW
 WHEN (NEW.accountID IS NULL)
BEGIN
 SELECT accounts_seq.NEXTVAL INTO :NEW.accountID FROM DUAL;
END;
/
CREATE TABLE transactions (
  transactionID number(10) PRIMARY KEY,
  fromID number(10),
  toID number(10),
  amount number(10),
  confirmed char(1),
  confirmedBy number(10),
  transactionDate date
);
CREATE SEQUENCE transactions_seq START WITH 1 INCREMENT BY 1;
CREATE OR REPLACE TRIGGER transactions_seq_tr
 BEFORE INSERT ON transactions FOR EACH ROW
 WHEN (NEW.transactionID IS NULL)
BEGIN
 SELECT transactions_seq.NEXTVAL INTO :NEW.transactionID FROM DUAL;
END;
/
ALTER TABLE workers ADD FOREIGN KEY (position) REFERENCES positions (positionID);
ALTER TABLE workers ADD FOREIGN KEY (pID) REFERENCES people (ID);
ALTER TABLE accounts ADD FOREIGN KEY (clientID) REFERENCES people (ID);
ALTER TABLE transactions ADD FOREIGN KEY (fromID) REFERENCES accounts (accountID);
ALTER TABLE transactions ADD FOREIGN KEY (toID) REFERENCES accounts (accountID);
ALTER TABLE transactions ADD FOREIGN KEY (confirmedBy) REFERENCES workers (workerID);
INSERT INTO positions (name, authority) VALUES ('admin', 2);
INSERT INTO positions (name, authority) VALUES ('cashier', 1);
INSERT INTO people (firstname, secondname) VALUES ('PETRO', 'IVANOV');
INSERT INTO people (firstname, secondname) VALUES ('VIKTOR', 'PETRENKO');
INSERT INTO people (firstname, secondname) VALUES ('DEMID', 'VASILEVSKIY');
INSERT INTO people (firstname, secondname) VALUES ('IVAN', 'BALACKIY');
INSERT INTO people (firstname, secondname) VALUES ('DMYTRO', 'BORSHCH');
INSERT INTO people (firstname, secondname) VALUES ('STEPAN', 'BANDERA');
INSERT INTO people (firstname, secondname) VALUES ('TARAS', 'SHEVCHENKO');
INSERT INTO people (firstname, secondname) VALUES ('DANIL', 'FOVSKIY');
INSERT INTO people (firstname, secondname) VALUES ('KOVBASA', 'SALO');
INSERT INTO people (firstname, secondname) VALUES ('BOGDAN', 'ANASHKIN');
INSERT INTO workers (pID, position) VALUES (1, 1);
INSERT INTO workers (pID, position) VALUES (3, 2);
INSERT INTO workers (pID, position) VALUES (5, 2);
INSERT INTO workers (pID, position) VALUES (6, 1);
INSERT INTO workers (pID, position) VALUES (8, 1);
INSERT INTO accounts (clientID, balance) VALUES (5, 1000);
INSERT INTO accounts (clientID, balance) VALUES (5, 1000);
INSERT INTO accounts (clientID, balance) VALUES (7, 5000);
INSERT INTO accounts (clientID, balance) VALUES (8, 111000);
INSERT INTO accounts (clientID, balance) VALUES (1, 500);
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (1, 2, 500, 0, NULL, '11-DEC-2010');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (2, 4, 1500, 0, NULL, '11-DEC-2011');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (5, 2, 300, 0, NULL, '11-MAY-2022');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (3, 1, 10, 0, NULL, '11-APR-2022');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (4, 1, 100, 0, NULL, '11-DEC-2011');
