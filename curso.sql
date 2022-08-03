CREATE DATABASE "course";

CREATE TABLE "groups" (
    "id" SERIAL PRIMARY KEY,
    "code" VARCHAR(2) NOT NULL UNIQUE,
    "name" VARCHAR(60) NOT NULL
);

CREATE TABLE "students" (
    "id" SERIAL PRIMARY KEY,
    "groupId" INTEGER NOT NULL REFERENCES "groups"("id"),
    "name" VARCHAR(120) NOT NULL,
    "cpf" VARCHAR(11) NOT NULL UNIQUE,
    "email" VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE "groupChanges" (
    "id" SERIAL PRIMARY KEY,
    "studentId" INTEGER NOT NULL REFERENCES "students"("id"),
    "groupLeftId" INTEGER REFERENCES "groups"("id") DEFAULT NULL,
    "groupEnterId" INTEGER NOT NULL REFERENCES "groups"("id"),
    "lastGroupEnterDate" DATE NOT NULL,
    "nextGroupEnterDate" DATE DEFAULT GETDATE(),
    "reason" TEXT
);

CREATE TABLE "modules" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(120) NOT NULL
);

CREATE TABLE "projects" (
    "id" SERIAL PRIMARY KEY,
    "moduleId" INTEGER NOT NULL REFERENCES "modules"("id"),
    "name" VARCHAR(120) NOT NULL,
    "dueDate" DATE NOT NULL
)

CREATE TABLE "grades" (
    "id" SERIAL PRIMARY KEY,
    "studentId" INTEGER NOT NULL REFERENCES "students"("id"),
    "projectId" INTEGER NOT NULL REFERENCES "projects"("id"),
    "grade" ENUM("Abaixo das expectativas", "Dentro das expectativas", "Acima das expectativas"),
    "dateDelivered" DATE DEFAULT GETDATE(),
)