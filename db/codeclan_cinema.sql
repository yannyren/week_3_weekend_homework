DROP TABLE tickets;
DROP TABLE screenings;
DROP TABLE films;
DROP TABLE customers;



CREATE TABLE films (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR(255),
  price INT4
);

CREATE TABLE customers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  funds INT4
);

CREATE TABLE tickets (
  id SERIAL4 PRIMARY KEY,
  customer_id INT4 REFERENCES customers(id) ON DELETE CASCADE,
  film_id INT4 REFERENCES films(id) ON DELETE CASCADE
);

CREATE TABLE screenings (
id SERIAL4 PRIMARY KEY,
film_id INT4 REFERENCES films(id) ON DELETE CASCADE,
time TIME
-- ('1400')
);

-- INSERT INTO films (title, price) VALUES ('One Day', 10);
-- INSERT INTO films (title, price) VALUES ('Two Days', 20);
-- INSERT INTO films (title, price) VALUES ('Three Days', 30);

-- INSERT INTO customers (name, funds) VALUES ('John', 40);
-- INSERT INTO customers (name, funds) VALUES ('Chris', 50);
-- INSERT INTO customers (name, funds) VALUES ('Zoe', 20);

-- INSERT INTO tickets (customer_id, film_id) VALUES (1, 1);
-- INSERT INTO tickets (customer_id, film_id) VALUES (2, 1);
-- INSERT INTO tickets (customer_id, film_id) VALUES (3, 2);


