-- **********************************************************************
-- 1 -- CREATE THE TABLES
CREATE TABLE "Restaurant" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "name" TEXT NOT NULL,
  "phone" TEXT NULL,
  "address" TEXT,
  "zip" INTEGER,
  "city" TEXT NOT NULL
);

CREATE TABLE "Dish" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "title" TEXT NOT NULL,
  "description" TEXT,
  "price" REAL,
  "restaurant" INTEGER NOT NULL REFERENCES "Restaurant" ("id") ON DELETE CASCADE
);

CREATE INDEX "idx_dish__restaurant" ON "Dish" ("restaurant");

CREATE TABLE "User" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "first_name" TEXT NOT NULL,
  "last_name" TEXT NOT NULL,
  "mail" TEXT NOT NULL,
  "phone" TEXT,
  "address" TEXT,
  "zip" INTEGER,
  "city" TEXT,
  "status" TEXT NOT NULL
);

CREATE TABLE "Order" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "date" DATETIME NOT NULL,
  "status" BOOLEAN NOT NULL,
  "promotion" REAL,
  "user" INTEGER NOT NULL REFERENCES "User" ("id") ON DELETE CASCADE,
  "restaurant" INTEGER NOT NULL REFERENCES "Restaurant" ("id") ON DELETE CASCADE
);

CREATE INDEX "idx_order__restaurant" ON "Order" ("restaurant");

CREATE INDEX "idx_order__user" ON "Order" ("user");

CREATE TABLE "Order_detail" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "order" INTEGER NOT NULL REFERENCES "Order" ("id") ON DELETE CASCADE,
  "dish" INTEGER NOT NULL REFERENCES "Dish" ("id") ON DELETE CASCADE,
  "quantity" INTEGER NOT NULL
);

CREATE INDEX "idx_order_detail__dish" ON "Order_detail" ("dish");

CREATE INDEX "idx_order_detail__order" ON "Order_detail" ("order");

-- **********************************************************************
-- 2 -- CREATE AND INSERT THESE DATA

INSERT INTO User (id, first_name, last_name, mail, phone, address, zip, city, status)
VALUES
    (100, 'John', 'Anton', 'j@ana.tole', '+41 536 436', "Heinrichstrasse", 8005, "Zürich", 1),
    (101, 'Marie', 'Medicis', 'marie@medi.cis', NULL, "Sihlquai", 8005, "Zürich", 1),
    (180, 'Anna', 'Veritas', 'anna@veritas.com', NULL, NULL, NULL, NULL, 1),
    (201, 'Franz', 'Ouali', 'franz@ouali.fr', NULL, "Schützengasse", 8001, "Zürich", 1),
    (213, 'Sarah', 'Magni', 's.magni@gmail.com', '+41 325 678', "Haimstrasse", 8001, "Zürich", 1),
    (215, 'Alan', 'Dupuis', 'a.dupuis@gmail.com', '+41 325 413', "Regensbergstrasse", 8050, "Zürich", 1),
    (221, 'Cedric', 'Bouteille', 'bouteille@hotmail.ch', NULL, "Püntackerweg", 8152, "Opfikon", 1),
    (225, 'Gill', 'Baccide', 'gill@baccide.com', '+41 432 987', "Neugutstrasse", 8600, "Dübendorf", 1),
    (301, 'Joe', 'Qi', 'fake@mail.com', NULL, NULL, NULL, NULL, 0)
;

INSERT INTO Restaurant (id, name, phone, address, zip, city)
VALUES
    (11, "Libanese flavor", NULL, "Kanzleistrasse", 8004, "Zürich"),
    (23, "Tanaka Sushi", "+41 786 432", "Talacker", 8001, "Zürich"),
    (38, "Le Bistrot", "+33 789 542", "Tödistrasse", 8002, "Zürich"),
    (42, "Mama Cucina", NULL, "Bramenring", 8302, "Kloten"),
    (51, "Sawatdee", NULL, "Kreuzbühlstrasse", 8008, "Zürich")
;

INSERT INTO Dish (id, title, description, price, restaurant)
VALUES
    (15, "Chicken Shawarma", "Chicken in a grilled galette", 20.50, 11),
    (18, "Gyoza", "Japanese ravioli", 15.00, 23),
    (19, "Taboulé", "Parsley taboulé", 21.20, 11),
    (22, "Salmon sushi", "per piece", 2.00, 23),
    (24, "Cucumber maki", "6 pieces", 4.50, 23),
    (25, "Tuna maki", "6 pieces", 9.40, 23),
    (27, "California maki", "8 pieces", 12.00, 23),
    (31, "Ramen", "Japanese soup with pork and noodles", 21.00, 23),
    (32, "Kebbe boulette", "Delicious meat balls", 10.70, 11),
    (34, "Tartiflette", "Potatoes, reblochon cheese and cream", 21.00, 38),
    (35, "Blanquette", "Veal meat and cream", 25.50, 38),
    (37, "Croque-Monsieur", "Grilled bread with ham and cheese", 12.00, 38),
    (40, "Quattro formaggi pizza", "Pizza with 4 type of cheese", 18.00, 42),
    (41, "Il Maestro", "Pizza with surpise", 21.50, 42),
    (43, "Rustica pizza", "Pizza with bacon and onions", 17.80, 42),
    (44, "Pasta Carbonara", NULL, 16.80, 42),
    (48, "Pad Thai", "Noodles with vegetables and oyster sauce", 25.00, 51),
    (51, "Laab", "Spicy salad", 17.00, 51),
    (52, "Pad See Eiw", "Large noodles with vegetables", 25.50, 51)
;

INSERT INTO `Order` (id, date, status, promotion, user, restaurant)
VALUES
    (10, "2020-12-01 20:03:45", 1, NULL, 100, 11),
    (11, "2020-12-01 20:04:01", 1, NULL, 101, 42),
    (12, "2020-12-01 20:04:01", 1, 10, 180, 51),
    (13, "2020-12-01 20:04:02", 1, NULL, 201, 38),
    (14, "2020-12-01 20:06:02", 1, 5, 221, 51),
    (15, "2020-12-01 20:06:02", 1, 5, 221, 23),
    (16, "2020-12-01 20:10:04", 1, NULL, 215, 42),
    (431, "2021-01-10 20:01:05", 1, 15, 101, 11),
    (432, "2021-01-10 20:01:05", 0, NULL, 213, 23),
    (433, "2021-01-10 20:01:05", 1, NULL, 201, 42),
    (434, "2021-01-10 20:01:08", 0, 15, 101, 38),
    (435, "2021-01-10 20:01:08", 0, NULL, 221, 23),
    (436, "2021-01-10 20:01:08", 1, NULL, 221, 51)
;

INSERT INTO Order_detail (`order`, dish, quantity)
VALUES
    (10, 15, 2),
    (10, 32, 4),
    (10, 19, 2),
    (11, 40, 1),
    (11, 41, 1),
    (12, 52, 1),
    (12, 51, 1),
    (13, 34, 8),
    (14, 48, 3),
    (15, 22, 6),
    (15, 31, 1),
    (15, 25, 2),
    (16, 44, 1),
    (16, 43, 2),
    (431, 15, 3),
    (431, 32, 3),
    (432, 27, 2),
    (432, 25, 2),
    (432, 24, 2),
    (432, 22, 2),
    (433, 44, 1),
    (433, 40, 1),
    (434, 37, 2),
    (434, 35, 1),
    (435, 27, 4),
    (435, 22, 2),
    (435, 31, 1),
    (436, 51, 1),
    (435, 52, 2)
;
