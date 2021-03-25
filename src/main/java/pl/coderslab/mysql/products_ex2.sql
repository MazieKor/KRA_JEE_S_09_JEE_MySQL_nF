CREATE DATABASE products_ex2 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE products (id INT, name VARCHAR(255), descr BLOB, price DOUBLE(15,2));
CREATE TABLE orders (id INT UNSIGNED, descr TEXT, PRIMARY KEY (id));
CREATE TABLE clients (id INT UNSIGNED, name VARCHAR(255), surname VARCHAR(255), PRIMARY KEY (id));

ALTER TABLE orders MODIFY COLUMN id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE clients MODIFY COLUMN id INT UNSIGNED AUTO_INCREMENT;
ALTER TABLE products MODIFY COLUMN id INT UNSIGNED AUTO_INCREMENT, ADD PRIMARY KEY (id);
ALTER TABLE products MODIFY COLUMN price DECIMAL(10,2) UNSIGNED DEFAULT (99999);
DESCRIBE products;

INSERT INTO products VALUES (null, 'krzesło', 'drewniane, z oparciem', 159.99);
INSERT INTO products VALUES (null, 'biurko', 'trwałe, z gwarancją', 359.9);
INSERT INTO clients VALUES (null, 'Tomasz', 'Nowak');
INSERT INTO clients VALUES (null, 'Wojtek', 'Kowalski');
INSERT INTO clients VALUES (null, 'Wojtek', 'Juriweicz');
INSERT INTO clients VALUES (null, 'Wojtek', 'Joński');
INSERT INTO orders VALUES (null, 'proszę o dobre pakowanie');
INSERT INTO orders VALUES (null, 'moge odebrać tylko przed 9');
INSERT INTO orders VALUES (null, null);
INSERT INTO products VALUES (null, 'stół', 'bez nóg', 89.9);
INSERT INTO products VALUES (null, 'zastawa', 'nie samochód', 29.9);
INSERT INTO products VALUES (null, 'piórnik', 'tylko dla dorosłych', 19.9);
INSERT INTO products VALUES (null, 'szafa', 'malutka', 1);
INSERT INTO products VALUES (null, 'posciel', 'w misie', 13.23);
INSERT INTO products VALUES (null, 'piwo 10,5', 'bezalkoholowe', 10);
SELECT * From products WHERE price >= 50 ORDER BY price ASC LIMIT 2;
SELECT * FROM clients WHERE surname LIKE 'J%';
SELECT * FROM orders WHERE descr IS NOT NULL;
SELECT COUNT(price) AS 'price=10' FROM products WHERE price = 10;

CREATE TABLE client_address (id INT UNSIGNED AUTO_INCREMENT, city VARCHAR(255), street VARCHAR(255), house_nr INT, PRIMARY KEY (id), FOREIGN KEY (id) REFERENCES clients(id));
INSERT INTO client_address VALUES (null, 'Warszawa', 'ul. Kazimierza', 14);
INSERT INTO client_address VALUES (3, 'Kraków', 'ul. JPII', 14);
INSERT INTO client_address VALUES (null, 'Wrocław', 'ul. Prusa', 14);
INSERT INTO client_address VALUES (2, 'Kraków', 'ul. Druga', 16);
DROP TABLE client_address;

CREATE TABLE opinions (id INT UNSIGNED AUTO_INCREMENT, products_id INT UNSIGNED NOT NULL, description TEXT, PRIMARY KEY (id), FOREIGN KEY (products_id) REFERENCES products(id) );
INSERT INTO opinions VALUES (null, 2, 'bardzo ładna');
INSERT INTO opinions VALUES (null, 4, 'miał być samochód');
INSERT INTO opinions VALUES (null, 2, 'strsznie ciepła');
INSERT INTO opinions VALUES (null, 3, 'co się stało  nogami');
INSERT INTO opinions VALUES (null, 4, 'wygąda jak ze złota');

DELETE FROM opinions WHERE id = 3;
DELETE FROM products WHERE id = 5;
DELETE FROM products WHERE id = 2;
DELETE FROM opinions WHERE id = 1;
DELETE FROM products WHERE id = 2;
CREATE TABLE test (id INT AUTO_INCREMENT, name TEXT, PRIMARY KEY (id));
INSERT INTO test(name) VALUES ('jeden'), ('dwa'), ('trzy');

DROP TABLE test;

CREATE TABLE products_order (id INT AUTO_INCREMENT, id_prod INT UNSIGNED NOT NULL, id_order INT UNSIGNED NOT NULL, PRIMARY KEY (id), FOREIGN KEY (id_prod) REFERENCES products(id), FOREIGN KEY (id_order) REFERENCES orders(id));
INSERT INTO orders (descr) VALUES ('proszę o dodatkowe pakowanie'), ('wysyłka do paczkoamtu'), ('odbiorę osobiście'), ('proszę o telefon w celu omówienia dostawy');
INSERT INTO products_order(id_prod, id_order) VALUES (1, 3), (4,1), (7,3), (4,6), (1, 3), (8, 7);

SELECT * FROM products p JOIN products_order p_o ON p.id = p_o.id_prod JOIN orders o ON o.id=p_o.id_order WHERE p.id = 1;
SELECT p.* FROM products p JOIN products_order p_o ON p.id = p_o.id_prod JOIN orders o ON o.id=p_o.id_order WHERE o.id = 1;

INSERT INTO opinions VALUES (null, 7, 'bardzo ładna');
INSERT INTO opinions VALUES (null, 7, 'strsznie ciepła');
INSERT INTO opinions VALUES (null, 1, null);

SELECT * FROM products JOIN opinions ON products.id = opinions.products_id WHERE opinions.description IS NOT NULL;
SELECT name, descr, price, description FROM products JOIN opinions ON products.id = opinions.products_id;
SELECT * FROM opinions JOIN products ON opinions.products_id = products.id WHERE opinions.products_id = 1;

