CREATE TABLE positions (
  positionID SERIAL PRIMARY KEY,
  name varchar(50),
  authority bigint
);
CREATE TABLE workers (
  workerID SERIAL PRIMARY KEY,
  pID bigint,
  position bigint
);
CREATE TABLE people (
  ID SERIAL PRIMARY KEY,
  firstname varchar(50),
  secondname varchar(50)
);
CREATE TABLE accounts (
  accountID SERIAL PRIMARY KEY,
  clientID bigint,
  balance bigint
);
CREATE TABLE transactions (
  transactionID SERIAL PRIMARY KEY,
  fromID bigint,
  toID bigint,
  amount bigint,
  confirmed boolean,
  confirmedBy bigint,
  transactionDate timestamp(0)
);
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
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (1, 2, 500, false, NULL, '11-DEC-2010');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (2, 4, 1500, false, NULL, '11-DEC-2011');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (5, 2, 300, false, NULL, '11-MAY-2022');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (3, 1, 10, false, NULL, '11-APR-2022');
INSERT INTO transactions (fromID, toID, amount, confirmed, confirmedBy, transactionDate) VALUES (4, 1, 100, false, NULL, '11-DEC-2011');