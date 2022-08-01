CREATE DATABASE "roupas-ecommerce";

CREATE TABLE "users" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(60) NOT NULL,
    "email" VARCHAR(60) NOT NULL UNIQUE,
    "password" VARCHAR(255) NOT NULL
);

CREATE TABLE "categories" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(60) NOT NULL
);

CREATE TABLE "sizes" (
    "id" SERIAL PRIMARY KEY,
    "name" CHAR(1) NOT NULL
);

CREATE TABLE "products" (
    "id" SERIAL PRIMARY KEY,
    "categoryId" INTEGER NOT NULL REFERENCES "categories"("id"),
    "sizeId" INTEGER NOT NULL REFERENCES "sizes"("id"),
    "name" VARCHAR(60) NOT NULL UNIQUE,
    "mainPicture" TEXT NOT NULL,
    "price" INTEGER NOT NULL
);

CREATE TABLE "pictures" (
    "id" SERIAL PRIMARY KEY,
    "productId" INTEGER NOT NULL REFERENCES "products"("id"),
    "url" TEXT NOT NULL
);

CREATE TABLE "orders" (
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "users"("id"),
    "productId" INTEGER NOT NULL REFERENCES "products"("id"),
    "quantity" INTEGER NOT NULL,
    "datePlaced" DATE DEFAULT CURDATE(),
    "status" ENUM("on cart", "placed", "preparing to ship", "shipped", "delivered", "cancelled"),
    "lastUpdate" TIMESTAMP DEFAULT NOW()
);

CREATE TABLE "states" (
    "id" SERIAL PRIMARY KEY,
    "name" VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE "cities" (
    "id" SERIAL PRIMARY KEY,
    "stateId" INTEGER NOT NULL REFERENCES "states"("id"),
    "name" VARCHAR(60) NOT NULL
);

CREATE TABLE "addresses" (
    "id" SERIAL PRIMARY KEY,
    "cityId" INTEGER NOT NULL REFERENCES "cities"("id"),
    "street" TEXT NOT NULL,
    "number" INTEGER NOT NULL,
    "postalCode" INTEGER NOT NULL,
    "complement" TEXT DEFAULT NULL
);