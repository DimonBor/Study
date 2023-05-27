DROP TABLE "Rents";
DROP TABLE "Clients";
DROP TABLE "Cars";


CREATE TABLE "Clients" (
  "client_id" int PRIMARY KEY,
  "firstname" varchar(255) not null,
  "lastname" varchar(255) not null,
  "phone_number" int not null,
  "banned" int
);

CREATE TABLE "Cars" (
  "car_id" int PRIMARY KEY,
  "name" varchar(255) not null,
  "number_plate" varchar(255) not null,
  "color" varchar(255),
  "rent_rate" int not null
);

CREATE TABLE "Rents" (
  "rent_id" int PRIMARY KEY,
  "car_id" int not null,
  "client_id" int  not null,
  "date_start" date not null,
  "date_end" date,
  "rate" int not null
);


ALTER TABLE "Rents" ADD FOREIGN KEY ("car_id") REFERENCES "Cars" ("car_id");
ALTER TABLE "Rents" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");


INSERT INTO Cars (car_id, name, number_plate, color, rent_rate) VALUES 
(1, 'Ford', '123AB', 'Red', 50),
(2, 'Toyota', '234CD', 'Blue', 60),
(3, 'Honda', '345EF', 'Green', 70),
(4, 'Nissan', '456GH', 'White', 80),
(5, 'Audi', '567IJ', 'Black', 90),
(6, 'Mazda', '678KL', 'Red', 100),
(7, 'Mercedes', '781MN', 'Blue', 110),
(8, 'Volkswagen', '892OP', 'Green', 120),
(9, 'Peugeot', '901QR', 'White', 130),
(10, 'Chevrolet', '012ST', 'Black', 140),
(11, 'Ford', '123AB', 'Red', 50),
(12, 'Toyota', '234CD', 'Blue', 60),
(13, 'Honda', '345EF', 'Green', 70),
(14, 'Nissan', '456GH', 'White', 80),
(15, 'Audi', '567IJ', 'Black', 90),
(16, 'Mazda', '678KL', 'Red', 100),
(17, 'Mercedes', '781MN', 'Blue', 110),
(18, 'Volkswagen', '892OP', 'Green', 120),
(19, 'Peugeot', '901QR', 'White', 130),
(20, 'Chevrolet', '012ST', 'Black', 140),
(21, 'Ford', '123AB', 'Red', 50),
(22, 'Toyota', '234CD', 'Blue', 60),
(23, 'Honda', '345EF', 'Green', 70),
(24, 'Nissan', '456GH', 'White', 80),
(25, 'Audi', '567IJ', 'Black', 90),
(26, 'Mazda', '678KL', 'Red', 100),
(27, 'Mercedes', '781MN', 'Blue', 110),
(28, 'Volkswagen', '892OP', 'Green', 120),
(29, 'Peugeot', '901QR', 'White', 130),
(30, 'Chevrolet', '012ST', 'Black', 140),
(31, 'Ford', '123AB', 'Red', 50),
(32, 'Toyota', '234CD', 'Blue', 60),
(33, 'Honda', '345EF', 'Green', 70),
(34, 'Nissan', '456GH', 'White', 80),
(35, 'Audi', '567IJ', 'Black', 90),
(36, 'Mazda', '678KL', 'Red', 100),
(37, 'Mercedes', '781MN', 'Blue', 110),
(38, 'Volkswagen', '892OP', 'Green', 120),
(39, 'Peugeot', '901QR', 'White', 130),
(40, 'Chevrolet', '012ST', 'Black', 140),
(41, 'Ford', '123AB', 'Red', 50),
(42, 'Toyota', '234CD', 'Blue', 60),
(43, 'Honda', '345EF', 'Green', 70),
(44, 'Nissan', '456GH', 'White', 80),
(45, 'Audi', '567IJ', 'Black', 90),
(46, 'Mazda', '678KL', 'Red', 100),
(47, 'Mercedes', '781MN', 'Blue', 110),
(48, 'Volkswagen', '892OP', 'Green', 120),
(49, 'Peugeot', '901QR', 'White', 130),
(50, 'Chevrolet', '012ST', 'Black', 140);

INSERT INTO Clients (client_id, firstname, lastname, phone_number, banned) VALUES
(1, 'John', 'Doe', 4555555, 0),
(2, 'Jane', 'Doe', 4445555, 0),
(3, 'Hilary', 'Marsh', 2333888, 0),
(4, 'Fiona', 'Larson', 1235555, 0),
(5, 'James', 'Baker', 6654444, 0),
(6, 'David', 'Hogman', 4555434, 0),
(7, 'Isabella', 'Jacob', 6588777, 0),
(8, 'George', 'Carr', 7788444, 0),
(9, 'Peter', 'Isle', 5557777, 0),
(10, 'Sarah', 'Brown', 8885555, 0),
(11, 'Diana', 'Richardson', 1112233, 0),
(12, 'William', 'Miller', 3334444, 0),
(13, 'Mike', 'Thompson', 7774444, 0),
(14, 'Sean', 'Moore', 6654444, 0),
(15, 'Rebecca', 'Young', 1112233, 0),
(16, 'Richard', 'Taylor', 7778888, 0),
(17, 'Paul', 'Hall', 2221111, 0),
(18, 'Katherine', 'Morgan', 5555444, 0),
(19, 'Colin', 'Adams', 8888555, 0),
(20, 'Anne', 'Gray', 6888555, 0),
(21, 'Rose', 'Parker', 3337777, 0),
(22, 'Emily', 'Berry', 5555555, 0),
(23, 'Steven', 'West', 4444555, 0),
(24, 'Anna', 'Gardner', 3332222, 0),
(25, 'Adam', 'King', 8883344, 0),
(26, 'Antony', 'Rogers', 5554545, 0),
(27, 'Lily', 'Cook', 3333444, 0),
(28, 'John', 'Stone', 4444222, 0),
(29, 'Samantha', 'Price', 5533333, 0),
(30, 'Bella', 'Phillips', 6665555, 0),
(31, 'Thomas', 'Murray', 4444333, 0),
(32, 'Matthew', 'Scott', 7778888, 0),
(33, 'Margaret', 'Marshall', 3334444, 0),
(34, 'Emma', 'Stewart', 5552222, 0),
(35, 'Brandon', 'Rogers', 2333888, 0),
(36, 'Nicholas', 'Powell', 8889999, 0),
(37, 'Daniel', 'Alexander', 4444555, 0),
(38, 'Elizabeth', 'Williams', 5444666, 0),
(39, 'Olivia', 'Jenkins', 3332444, 0),
(40, 'Mark', 'Campbell', 1112233, 0),
(41, 'Jenna', 'Foster', 8888777, 0),
(42, 'Andrew', 'Hunter', 4444555, 0),
(43, 'Blake', 'Bennett', 4445555, 0),
(44, 'Laura', 'Edwards', 7774444, 0),
(45, 'Luke', 'Hart', 3338888, 0),
(46, 'Lucy', 'Reed', 6654444, 0),
(47, 'Isaac', 'Morris', 8882222, 0),
(48, 'Landon', 'Pearson', 5556666, 0),
(49, 'Victoria', 'Armstrong', 4445555, 0),
(50, 'Grace', 'Bailey', 1112233, 0);