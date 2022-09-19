CREATE TABLE `positions` (
  `positionID` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(255),
  `authority` int
);

CREATE TABLE `workers` (
  `clientID` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `secondname` varchar(255),
  `position` varchar(255)
);

CREATE TABLE `clients` (
  `clientID` int PRIMARY KEY AUTO_INCREMENT,
  `firstname` varchar(255),
  `secondname` varchar(255)
);

CREATE TABLE `accounts` (
  `accountID` int PRIMARY KEY AUTO_INCREMENT,
  `clientID` int,
  `balance` int
);

CREATE TABLE `transactions` (
  `transactionID` int PRIMARY KEY AUTO_INCREMENT,
  `from` int,
  `to` int,
  `amount` int,
  `confirmed` boolean,
  `confirmedBy` int
);

ALTER TABLE `workers` ADD FOREIGN KEY (`position`) REFERENCES `positions` (`positionID`);

ALTER TABLE `workers` ADD FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`);

CREATE TABLE `clients_workers` (
  `clients_firstname` varchar NOT NULL,
  `workers_firstname` varchar NOT NULL,
  PRIMARY KEY (`clients_firstname`, `workers_firstname`)
);

ALTER TABLE `clients_workers` ADD FOREIGN KEY (`clients_firstname`) REFERENCES `clients` (`firstname`);

ALTER TABLE `clients_workers` ADD FOREIGN KEY (`workers_firstname`) REFERENCES `workers` (`firstname`);


CREATE TABLE `clients_workers(1)` (
  `clients_secondname` varchar NOT NULL,
  `workers_secondname` varchar NOT NULL,
  PRIMARY KEY (`clients_secondname`, `workers_secondname`)
);

ALTER TABLE `clients_workers(1)` ADD FOREIGN KEY (`clients_secondname`) REFERENCES `clients` (`secondname`);

ALTER TABLE `clients_workers(1)` ADD FOREIGN KEY (`workers_secondname`) REFERENCES `workers` (`secondname`);


ALTER TABLE `accounts` ADD FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`from`) REFERENCES `accounts` (`accountID`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`to`) REFERENCES `accounts` (`accountID`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`confirmedBy`) REFERENCES `workers` (`clientID`);
