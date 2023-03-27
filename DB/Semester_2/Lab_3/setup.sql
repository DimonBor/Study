DROP TABLE "Clients";
DROP TABLE "Cars";
DROP TABLE "Rents"


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