CREATE DATABASE cinemas_ex2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE cinemas_ex2;
CREATE TABLE cinemas (id INT UNSIGNED AUTO_INCREMENT, name VARCHAR(255) NOT NULL, address VARCHAR(255), PRIMARY KEY (id));
CREATE TABLE movies (id INT UNSIGNED AUTO_INCREMENT, title VARCHAR(255) NOT NULL, description TEXT, rating FLOAT(5,2), PRIMARY KEY (id));
CREATE TABLE tickets (id INT UNSIGNED AUTO_INCREMENT, quantity INT, price FLOAT(10,2), status TINYINT DEFAULT (0), PRIMARY KEY (id));
CREATE TABLE payments (id INT UNSIGNED AUTO_INCREMENT, type VARCHAR(10), payment_date DATE, PRIMARY KEY (id));

ALTER TABLE tickets ADD priceUSD DECIMAL(10,2);
ALTER TABLE movies ADD director CHAR(80);
ALTER TABLE movies MODIFY COLUMN director VARCHAR(80);
ALTER TABLE tickets DROP COLUMN priceUSD;

ALTER TABLE movies ADD watchCount INT;
ALTER TABLE movies ADD isTop TINYINT DEFAULT (0);
ALTER TABLE cinemas ADD openTime TIME;
ALTER TABLE cinemas ADD closeTime TIME;

DESCRIBE movies;

INSERT INTO cinemas VALUES (null, 'amok', 'Warszawa, ul. Nowy Swiat', '6:00', '18:00');
INSERT INTO cinemas VALUES (null, 'Bajka', 'kraków', '16:00', '24:00');
INSERT INTO cinemas VALUES (null, 'X', 'Toruń, ul. Nowy Swiat', '10:00', '19:00');
INSERT INTO cinemas VALUES (null, 'Titanic', 'Gliwice, ul. Nowy Swiat', '7:00', '18:00');
INSERT INTO cinemas VALUES (null, 'Coders', 'Katowice, ul. Nowy Swiat', '9:00', '15:00');
INSERT INTO movies VALUES (null, 'Die hard', 'sensacja', 5.4, 'Jan Kamin', 789, 0);
INSERT INTO movies VALUES (null, 'Czerowny', 'komedia', 9.4, 'Jan Keiselberg', 123568, 1);
INSERT INTO movies VALUES (null, 'Die hard 2', 'komedia', 5.9, 'Jan Foks', 983, 1);
INSERT INTO movies VALUES (null, 'Braveheart', 'historyczny', 10.4, 'Mel Gibson', 16, 1);
INSERT INTO movies VALUES (null, 'Robin i Batman', 'sci-fi', 3.4, 'Iwo Wion', 12345, 1);
INSERT INTO movies VALUES (null, 'Wielka woda', 'sci-fi', 3.4, 'Iwan Wion', 12347, 0);
INSERT INTO payments VALUES (null, 'cash', '2019:12:30');
INSERT INTO payments VALUES (null, 'transfer', '2019:11:30');
INSERT INTO payments VALUES (null, 'card', '2020:02:03');
INSERT INTO payments VALUES (null, 'cash', '2020:04:30');
INSERT INTO payments VALUES (null, 'transfer', '2018:02:27');
INSERT INTO payments VALUES (null, 'card', '2020:04:23');

DELETE FROM movies WHERE id = 3;

SELECT title FROM movies WHERE title LIKE 'w%';
SELECT * FROM tickets WHERE price > 15.3;
SELECT * FROM tickets WHERE quantity > 3;
SELECT * FROM movies WHERE rating > 6.5;
SELECT * FROM movies ORDER BY rating DESC LIMIT 1;

SELECT SUM(quantity) FROM tickets;
SELECT type, COUNT(type) AS 'payments quantity' FROM payments GROUP BY type;
SELECT AVG(price) FROM tickets;

# kasacja stworzonej bazy
DROP DATABASE cinemas_ex2;
DROP DATABASE cinemas_ex;
CREATE DATABASE cinemas_ex;

DESCRIBE tickets;
ALTER TABLE payments MODIFY COLUMN id INT AUTO_INCREMENT, ADD FOREIGN KEY (id) REFERENCES tickets(id);
DESCRIBE payments;
INSERT INTO payments VALUES (null, 'cash', '2018-09-30');
INSERT INTO payments VALUES (null, 'card', '2019:01:30');
INSERT INTO payments VALUES (null, 'transfer', '2020-02-23');

CREATE TABLE cinemas_movies (id INT AUTO_INCREMENT, id_cin INT NOT NULL, id_mov INT NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_cin) REFERENCES cinemas(id), FOREIGN KEY (id_mov) REFERENCES movies(id));
INSERT INTO cinemas_movies(id_cin, id_mov) VALUES (1,2), (1,4), (2,3), (2,4), (3,5), (3, 2), (2, 7), (4,7);
DESCRIBE payments;
SELECT * FROM tickets JOIN payments ON tickets.id = payments.id WHERE type = 'cash';
SELECT * FROM tickets LEFT JOIN payments ON tickets.id = payments.id WHERE payments.id IS NULL;

SELECT * FROM cinemas c JOIN cinemas_movies c_m ON c.id = c_m.id_cin JOIN movies m ON m.id = c_m.id_mov WHERE m.id = 2;
# wersja z mniejszą liczbą informacji:
SELECT name, address FROM cinemas c JOIN cinemas_movies c_m ON c.id = c_m.id_cin WHERE c_m.id_mov = 2;



