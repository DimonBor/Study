DROP TABLE "Rents";
DROP TABLE "Clients";
DROP TABLE "Cars";


CREATE TABLE "Clients" (
  client_id int PRIMARY KEY,
  firstname varchar(255) not null,
  lastname varchar(255) not null,
  phone_number int not null,
  banned int
);

CREATE TABLE "Cars" (
  car_id int PRIMARY KEY,
  name varchar(255) not null,
  number_plate varchar(255) not null,
  color varchar(255),
  rent_rate int not null
);

CREATE TABLE "Rents" (
  rent_id int PRIMARY KEY,
  car_id int not null,
  client_id int  not null,
  date_start date not null,
  date_end date,
  rate int not null
);


ALTER TABLE "Rents" ADD FOREIGN KEY (car_id) REFERENCES "Cars" (car_id);
ALTER TABLE "Rents" ADD FOREIGN KEY (client_id) REFERENCES "Clients" (client_id);

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';


INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (1, 'Ford', '123AB', 'Red', 50);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (2, 'Toyota', '234CD', 'Blue', 60);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (3, 'Honda', '345EF', 'Green', 70);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (4, 'Nissan', '456GH', 'White', 80);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (5, 'Audi', '567IJ', 'Black', 90);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (6, 'Mazda', '678KL', 'Red', 100);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (7, 'Mercedes', '781MN', 'Blue', 110);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (8, 'Volkswagen', '892OP', 'Green', 120);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (9, 'Peugeot', '901QR', 'White', 130);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (10, 'Chevrolet', '012ST', 'Black', 140);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (11, 'Ford', '123AB', 'Red', 50);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (12, 'Toyota', '234CD', 'Blue', 60);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (13, 'Honda', '345EF', 'Green', 70);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (14, 'Nissan', '456GH', 'White', 80);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (15, 'Audi', '567IJ', 'Black', 90);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (16, 'Mazda', '678KL', 'Red', 100);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (17, 'Mercedes', '781MN', 'Blue', 110);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (18, 'Volkswagen', '892OP', 'Green', 120);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (19, 'Peugeot', '901QR', 'White', 130);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (20, 'Chevrolet', '012ST', 'Black', 140);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (21, 'Ford', '123AB', 'Red', 50);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (22, 'Toyota', '234CD', 'Blue', 60);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (23, 'Honda', '345EF', 'Green', 70);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (24, 'Nissan', '456GH', 'White', 80);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (25, 'Audi', '567IJ', 'Black', 90);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (26, 'Mazda', '678KL', 'Red', 100);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (27, 'Mercedes', '781MN', 'Blue', 110);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (28, 'Volkswagen', '892OP', 'Green', 120);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (29, 'Peugeot', '901QR', 'White', 130);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (30, 'Chevrolet', '012ST', 'Black', 140);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (31, 'Ford', '123AB', 'Red', 50);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (32, 'Toyota', '234CD', 'Blue', 60);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (33, 'Honda', '345EF', 'Green', 70);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (34, 'Nissan', '456GH', 'White', 80);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (35, 'Audi', '567IJ', 'Black', 90);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (36, 'Mazda', '678KL', 'Red', 100);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (37, 'Mercedes', '781MN', 'Blue', 110);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (38, 'Volkswagen', '892OP', 'Green', 120);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (39, 'Peugeot', '901QR', 'White', 130);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (40, 'Chevrolet', '012ST', 'Black', 140);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (41, 'Ford', '123AB', 'Red', 50);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (42, 'Toyota', '234CD', 'Blue', 60);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (43, 'Honda', '345EF', 'Green', 70);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (44, 'Nissan', '456GH', 'White', 80);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (45, 'Audi', '567IJ', 'Black', 90);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (46, 'Mazda', '678KL', 'Red', 100);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (47, 'Mercedes', '781MN', 'Blue', 110);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (48, 'Volkswagen', '892OP', 'Green', 120);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (49, 'Peugeot', '901QR', 'White', 130);
INSERT INTO "Cars" (car_id, name, number_plate, color, rent_rate) VALUES (50, 'Chevrolet', '012ST', 'Black', 140);


INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (1, 'John', 'Doe', 4555555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (2, 'Jane', 'Doe', 4445555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (3, 'Hilary', 'Marsh', 2333888, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (4, 'Fiona', 'Larson', 1235555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (5, 'James', 'Baker', 6654444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (6, 'David', 'Hogman', 4555434, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (7, 'Isabella', 'Jacob', 6588777, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (8, 'George', 'Carr', 7788444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (9, 'Peter', 'Isle', 5557777, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (10, 'Sarah', 'Brown', 8885555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (11, 'Diana', 'Richardson', 1112233, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (12, 'William', 'Miller', 3334444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (13, 'Mike', 'Thompson', 7774444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (14, 'Sean', 'Moore', 6654444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (15, 'Rebecca', 'Young', 1112233, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (16, 'Richard', 'Taylor', 7778888, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (17, 'Paul', 'Hall', 2221111, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (18, 'Katherine', 'Morgan', 5555444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (19, 'Colin', 'Adams', 8888555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (20, 'Anne', 'Gray', 6888555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (21, 'Rose', 'Parker', 3337777, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (22, 'Emily', 'Berry', 5555555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (23, 'Steven', 'West', 4444555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (24, 'Anna', 'Gardner', 3332222, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (25, 'Adam', 'King', 8883344, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (26, 'Antony', 'Rogers', 5554545, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (27, 'Lily', 'Cook', 3333444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (28, 'John', 'Stone', 4444222, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (29, 'Samantha', 'Price', 5533333, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (30, 'Bella', 'Phillips', 6665555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (31, 'Thomas', 'Murray', 4444333, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (32, 'Matthew', 'Scott', 7778888, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (33, 'Margaret', 'Marshall', 3334444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (34, 'Emma', 'Stewart', 5552222, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (35, 'Brandon', 'Rogers', 2333888, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (36, 'Nicholas', 'Powell', 8889999, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (37, 'Daniel', 'Alexander', 4444555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (38, 'Elizabeth', 'Williams', 5444666, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (39, 'Olivia', 'Jenkins', 3332444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (40, 'Mark', 'Campbell', 1112233, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (41, 'Jenna', 'Foster', 8888777, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (42, 'Andrew', 'Hunter', 4444555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (43, 'Blake', 'Bennett', 4445555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (44, 'Laura', 'Edwards', 7774444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (45, 'Luke', 'Hart', 3338888, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (46, 'Lucy', 'Reed', 6654444, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (47, 'Isaac', 'Morris', 8882222, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (48, 'Landon', 'Pearson', 5556666, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (49, 'Victoria', 'Armstrong', 4445555, 0);
INSERT INTO "Clients" (client_id, firstname, lastname, phone_number, banned) VALUES (50, 'Grace', 'Bailey', 1112233, 0);

INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (1, 1, 1, '2022-09-01', '2022-09-10', 50);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (2, 2, 2, '2022-09-10', '2022-09-30', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (3, 3, 3, '2022-09-30', '2022-10-05', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (4, 4, 4, '2022-10-05', '2022-10-15', 100);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (5, 5, 5, '2022-10-15', '2022-11-20', 225);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (6, 6, 6, '2022-11-20', '2022-11-30', 150);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (7, 7, 7, '2022-11-30', '2022-12-05', 175);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (8, 8, 8, '2022-12-05', '2022-12-25', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (9, 9, 9, '2022-12-25', '2023-01-04', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (10, 10, 10, '2023-04-24', '2023-05-23', 375);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (11, 1, 11, '2022-09-01', '2022-09-10', 50);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (12, 2, 12, '2022-09-10', '2022-09-30', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (13, 3, 13, '2022-09-30', '2022-10-05', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (14, 4, 14, '2022-10-05', '2022-10-15', 100);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (15, 5, 15, '2022-10-15', '2022-11-20', 225);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (16, 6, 16, '2022-11-20', '2022-11-30', 150);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (17, 7, 17, '2022-11-30', '2022-12-05', 175);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (18, 8, 18, '2022-12-05', '2022-12-25', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (19, 9, 19, '2022-12-25', '2023-01-04', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (20, 10, 20, '2023-04-30', '2023-05-18', 375);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (21, 1, 21, '2022-09-01', '2022-09-10', 50);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (22, 2, 22, '2022-09-10', '2022-09-30', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (23, 23, 23, '2022-09-30', '2022-10-05', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (24, 34, 24, '2022-10-05', '2022-10-15', 100);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (25, 45, 25, '2022-10-15', '2022-11-20', 225);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (26, 16, 26, '2022-11-20', '2022-11-30', 150);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (27, 47, 27, '2022-11-30', '2022-12-05', 175);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (28, 33, 28, '2022-12-05', '2022-12-25', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (29, 2, 29, '2022-12-25', '2023-01-04', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (30, 10, 30, '2023-05-09', NULL, 375);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (31, 10, 31, '2022-09-01', '2022-09-10', 50);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (32, 20, 32, '2022-09-10', '2022-09-30', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (33, 30, 33, '2022-09-30', '2022-10-05', 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (34, 40, 34, '2022-10-05', '2022-10-15', 100);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (35, 45, 35, '2022-10-15', '2022-11-25', 225);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (36, 46, 35, '2022-11-20', '2022-11-30', 150);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (37, 47, 37, '2022-11-30', '2022-12-05', 175);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (38, 48, 38, '2022-12-05', '2022-12-25', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (39, 49, 39, '2022-12-25', '2023-01-04', 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (40, 33, 40, '2023-04-04', '2023-05-14', 375);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (41, 1, 41, '2023-05-01', NULL, 50);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (42, 2, 41, '2023-05-10', NULL, 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (43, 3, 43, '2023-05-13', NULL, 120);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (44, 4, 44, '2023-05-05', NULL, 100);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (45, 5, 45, '2023-05-15', NULL, 225);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (46, 6, 46, '2023-05-20', NULL, 150);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (47, 7, 47, '2023-05-22', NULL, 175);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (48, 8, 48, '2023-05-05', NULL, 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (49, 9, 49, '2023-05-25', NULL, 250);
INSERT INTO "Rents" (rent_id, car_id, client_id, date_start, date_end, rate) VALUES (50, 10, 50, '2023-05-04', NULL, 375);

COMMIT;