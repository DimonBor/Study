DROP TABLE "Rents";
DROP TABLE "Clients";
DROP TABLE "Cars";


CREATE TABLE "Clients" (
  "client_id" int PRIMARY KEY,
  "firstname" varchar(255),
  "lastname" varchar(255),
  "phone_number" int,
  "banned" int
);

CREATE TABLE "Cars" (
  "car_id" int PRIMARY KEY,
  "name" varchar(255),
  "number_plate" varchar(255),
  "color" varchar(255),
  "rent_rate" int
);

CREATE TABLE "Rents" (
  "rent_id" int PRIMARY KEY,
  "car_id" int,
  "client_id" int,
  "date_start" date,
  "date_end" date,
  "rate" int
);


ALTER TABLE "Rents" ADD FOREIGN KEY ("car_id") REFERENCES "Cars" ("car_id");
ALTER TABLE "Rents" ADD FOREIGN KEY ("client_id") REFERENCES "Clients" ("client_id");


INSERT INTO "Cars" VALUES (1, 'Lanos', 'AA 7777 AA', 'black', 75);
INSERT INTO "Cars" VALUES (2, 'VW Passat', 'AA 7778 AA', 'red', 275);
INSERT INTO "Cars" VALUES (3, 'ZAZ', 'AA 7779 AA', 'green', 45);
INSERT INTO "Cars" VALUES (4, 'Skoda Octavia', 'AA 7780 AA', 'blue', 23);
INSERT INTO "Cars" VALUES (5, 'Ford Transit', 'AA 7781 AA', 'black', 67);
INSERT INTO "Cars" VALUES (6, 'Renault Logan', 'AA 7782 AA', 'purple', 94);
INSERT INTO "Cars" VALUES (7, 'BMW M3', 'AA 7783 AA', 'yellow', 234);
INSERT INTO "Cars" VALUES (8, 'Chevrolet Aveo', 'AA 7784 AA', 'green', 47);
INSERT INTO "Cars" VALUES (9, 'GMC', 'AA 7785 AA', 'green', 32);
INSERT INTO "Cars" VALUES (10, 'Nissan Skyline GT R32', 'AA 7786 AA', 'black', 19);
INSERT INTO "Cars" VALUES (11, 'Honda Civic', 'AA 7787 AA', 'red', 93);

INSERT INTO "Clients" VALUES (1, 'Bob', 'Peters', 15534567, 0);
INSERT INTO "Clients" VALUES (2, 'John', 'Smith', 44201678, 0);
INSERT INTO "Clients" VALUES (3, 'Emily', 'Johnson', 3316789, 0);
INSERT INTO "Clients" VALUES (4, 'Michael', 'Brown', 2345678, 0);
INSERT INTO "Clients" VALUES (5, 'Olivia', 'Davis', 6125678, 0);
INSERT INTO "Clients" VALUES (6, 'William', 'Wilson', 8135678, 0);
INSERT INTO "Clients" VALUES (7, 'Sophia', 'Thompson', 39345678, 0);
INSERT INTO "Clients" VALUES (8, 'Benjamin', 'Davis', 5345678, 0);
INSERT INTO "Clients" VALUES (9, 'Ava', 'Robinson', 7495567, 0);
INSERT INTO "Clients" VALUES (10, 'James', 'Anderson', 86145678, 0);
INSERT INTO "Clients" VALUES (11, 'Isabella', 'Martinez', 9714567, 0);