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

ALTER TABLE `workers` ADD FOREIGN KEY (`firstname`) REFERENCES `clients` (`firstname`);

ALTER TABLE `workers` ADD FOREIGN KEY (`secondname`) REFERENCES `clients` (`secondname`);

ALTER TABLE `accounts` ADD FOREIGN KEY (`clientID`) REFERENCES `clients` (`clientID`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`from`) REFERENCES `accounts` (`accountID`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`to`) REFERENCES `accounts` (`accountID`);

ALTER TABLE `transactions` ADD FOREIGN KEY (`confirmedBy`) REFERENCES `workers` (`clientID`);
