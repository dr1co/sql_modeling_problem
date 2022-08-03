CREATE DATABASE "agencia-viagens";

CREATE TABLE "companies" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(120) NOT NULL,
    "initials" VARCHAR(3) NOT NULL UNIQUE,
)

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id"),
    "name" VARCHAR(120) NOT NULL UNIQUE
);

CREATE TABLE "airports" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(120) NOT NULL,
    "initials" VARCHAR(3) NOT NULL UNIQUE,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id")
);

CREATE TABLE "flights" (
    "id" SERIAL PRIMARY KEY,
    "companyId" INTEGER NOT NULL REFERENCES "companies"("id"),
    "initials" VARCHAR(7) NOT NULL UNIQUE,
    "trajectoryId" INTEGER NOT NULL REFERENCES "trajectories"("id"),
    "departureDateTime" SMALLDATETIME NOT NULL,
    "arrivalDateTIme" SMALLDATETIME NOT NULL
);

CREATE TABLE "trajectories" (
    "id" SERIAL PRIMARY KEY,
    "departureAirportId" INTEGER NOT NULL REFERENCES "airports"("id"),
    "arrivalAirportId" INTEGER NOT NULL REFERENCES "airports"("id"),
    "connections" --?????????? COMOFAS--,
);