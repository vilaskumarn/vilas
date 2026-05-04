-- Drop tables if they already exist
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE flights CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE airlines CASCADE CONSTRAINTS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create airlines table
CREATE TABLE airlines (
    airline_id NUMBER PRIMARY KEY,
    airline_name VARCHAR2(100),
    country VARCHAR2(50)
);

-- Create flights table
CREATE TABLE flights (
    flight_id NUMBER PRIMARY KEY,
    airline_id NUMBER,
    source VARCHAR2(50),
    destination VARCHAR2(50),
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    price NUMBER(10,2),
    CONSTRAINT fk_airline
        FOREIGN KEY (airline_id)
        REFERENCES airlines(airline_id)
);

-- Insert data into airlines
INSERT INTO airlines (airline_id, airline_name, country) VALUES (1, 'Air India', 'India');
INSERT INTO airlines (airline_id, airline_name, country) VALUES (2, 'IndiGo', 'India');
INSERT INTO airlines (airline_id, airline_name, country) VALUES (3, 'Emirates', 'UAE');
INSERT INTO airlines (airline_id, airline_name, country) VALUES (4, 'Qatar Airways', 'Qatar');

-- Insert data into flights
INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (101, 1, 'Delhi', 'Mumbai', TIMESTAMP '2026-04-01 08:00:00', TIMESTAMP '2026-04-01 10:00:00', 600.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (102, 1, 'Mumbai', 'Bangalore', TIMESTAMP '2026-04-02 09:00:00', TIMESTAMP '2026-04-02 11:30:00', 750.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (103, 2, 'Delhi', 'Bangalore', TIMESTAMP '2026-04-01 07:00:00', TIMESTAMP '2026-04-01 10:00:00', 500.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (104, 2, 'Bangalore', 'Chennai', TIMESTAMP '2026-04-03 06:00:00', TIMESTAMP '2026-04-03 07:00:00', 300.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (105, 3, 'Dubai', 'Delhi', TIMESTAMP '2026-04-01 02:00:00', TIMESTAMP '2026-04-01 07:00:00', 1200.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (106, 3, 'Delhi', 'Dubai', TIMESTAMP '2026-04-02 03:00:00', TIMESTAMP '2026-04-02 08:00:00', 1100.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (107, 4, 'Doha', 'Mumbai', TIMESTAMP '2026-04-01 04:00:00', TIMESTAMP '2026-04-01 09:00:00', 1300.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (108, 4, 'Mumbai', 'Doha', TIMESTAMP '2026-04-02 05:00:00', TIMESTAMP '2026-04-02 10:00:00', 1250.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (109, 1, 'Delhi', 'Mumbai', TIMESTAMP '2026-04-01 08:00:00', TIMESTAMP '2026-04-01 10:00:00', 600.00);

INSERT INTO flights (flight_id, airline_id, source, destination, departure_time, arrival_time, price)
VALUES (110, 2, 'Delhi', 'Bangalore', TIMESTAMP '2026-04-04 07:00:00', TIMESTAMP '2026-04-04 10:00:00', 550.00);

COMMIT;

-- 1. Flights with price greater than 500
WITH expensive_flights AS (
    SELECT *
    FROM flights
    WHERE price > 500
)
SELECT * FROM expensive_flights;

-- 2. Airline name, source, destination and price
WITH flight_details AS (
    SELECT a.airline_name, f.source, f.destination, f.price
    FROM flights f
    JOIN airlines a ON f.airline_id = a.airline_id
)
SELECT * FROM flight_details;

-- 3. Average flight price for each airline
WITH avg_price AS (
    SELECT airline_id, AVG(price) AS avg_flight_price
    FROM flights
    GROUP BY airline_id
)
SELECT a.airline_name, ap.avg_flight_price
FROM avg_price ap
JOIN airlines a ON ap.airline_id = a.airline_id;

-- 4. Airlines with average price greater than 700
WITH avg_price AS (
    SELECT airline_id, AVG(price) AS avg_flight_price
    FROM flights
    GROUP BY airline_id
)
SELECT a.airline_name, ap.avg_flight_price
FROM avg_price ap
JOIN airlines a ON ap.airline_id = a.airline_id
WHERE ap.avg_flight_price > 700;

-- 5. Rank flights by price within each airline
WITH ranked_flights AS (
    SELECT
        f.flight_id,
        f.airline_id,
        a.airline_name,
        f.source,
        f.destination,
        f.price,
        RANK() OVER (PARTITION BY f.airline_id ORDER BY f.price DESC) AS price_rank
    FROM flights f
    JOIN airlines a ON f.airline_id = a.airline_id
)
SELECT * FROM ranked_flights;

-- 6. Most expensive flight for each airline
WITH ranked_flights AS (
    SELECT
        f.flight_id,
        f.airline_id,
        a.airline_name,
        f.source,
        f.destination,
        f.price,
        RANK() OVER (PARTITION BY f.airline_id ORDER BY f.price DESC) AS rank_no
    FROM flights f
    JOIN airlines a ON f.airline_id = a.airline_id
)
SELECT *
FROM ranked_flights
WHERE rank_no = 1;

-- 7. Show possible flight paths starting from Delhi
WITH flight_paths (flight_id, source, destination, path, level_no) AS (
    SELECT
        flight_id,
        source,
        destination,
        source || ' -> ' || destination AS path,
        1 AS level_no
    FROM flights
    WHERE source = 'Delhi'

    UNION ALL

    SELECT
        f.flight_id,
        fp.source,
        f.destination,
        fp.path || ' -> ' || f.destination,
        fp.level_no + 1
    FROM flight_paths fp
    JOIN flights f ON fp.destination = f.source
    WHERE fp.level_no < 3
)
SELECT * FROM flight_paths;

-- 8. Find duplicate flights based on source, destination and departure time
WITH duplicate_flights AS (
    SELECT
        source,
        destination,
        departure_time,
        COUNT(*) AS total_duplicates
    FROM flights
    GROUP BY source, destination, departure_time
    HAVING COUNT(*) > 1
)
SELECT f.*
FROM flights f
JOIN duplicate_flights d
    ON f.source = d.source
   AND f.destination = d.destination
   AND f.departure_time = d.departure_time;

-- 9. Running total of flight prices for each airline
WITH price_running_total AS (
    SELECT
        f.flight_id,
        f.airline_id,
        a.airline_name,
        f.departure_time,
        f.price,
        SUM(f.price) OVER (
            PARTITION BY f.airline_id
            ORDER BY f.departure_time
            ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
        ) AS running_total
    FROM flights f
    JOIN airlines a ON f.airline_id = a.airline_id
)
SELECT * FROM price_running_total;

-- 10. Total flights and average price for each airline
WITH total_flights AS (
    SELECT airline_id, COUNT(*) AS total_flights
    FROM flights
    GROUP BY airline_id
),
average_prices AS (
    SELECT airline_id, AVG(price) AS avg_price
    FROM flights
    GROUP BY airline_id
)
SELECT
    a.airline_name,
    tf.total_flights,
    ap.avg_price
FROM airlines a
JOIN total_flights tf ON a.airline_id = tf.airline_id
JOIN average_prices ap ON a.airline_id = ap.airline_id;

-- 11. Flights with price greater than 500 using subquery
SELECT *
FROM (
    SELECT *
    FROM flights
    WHERE price > 500
) expensive_flights;

-- 12. Show airline name, source, destination and price using subquery
SELECT a.airline_name, f.source, f.destination, f.price
FROM flights f
JOIN (
    SELECT airline_id, airline_name
    FROM airlines
) a ON f.airline_id = a.airline_id;

-- 13. Average flight price for each airline using subquery
SELECT a.airline_name, x.avg_flight_price
FROM airlines a
JOIN (
    SELECT airline_id, AVG(price) AS avg_flight_price
    FROM flights
    GROUP BY airline_id
) x ON a.airline_id = x.airline_id;

-- 14. Airlines whose average flight price is greater than 700 using subquery
SELECT airline_name
FROM airlines
WHERE airline_id IN (
    SELECT airline_id
    FROM flights
    GROUP BY airline_id
    HAVING AVG(price) > 700
);

-- 15. Rank flights by price within each airline using subquery
SELECT
    flight_id,
    airline_id,
    source,
    destination,
    price,
    RANK() OVER (PARTITION BY airline_id ORDER BY price DESC) AS price_rank
FROM (
    SELECT flight_id, airline_id, source, destination, price
    FROM flights
) x;

-- 16. Most expensive flight for each airline using subquery
SELECT *
FROM flights f
WHERE price = (
    SELECT MAX(f2.price)
    FROM flights f2
    WHERE f2.airline_id = f.airline_id
);

-- 17. Simulate flight paths from Delhi using subquery
SELECT
    f1.source AS start_city,
    f1.destination AS stop_1,
    f2.destination AS stop_2
FROM flights f1
JOIN flights f2
    ON f1.destination = f2.source
WHERE f1.source = 'Delhi';

-- 18. Find duplicate flights using subquery
SELECT *
FROM flights
WHERE (source, destination, departure_time) IN (
    SELECT source, destination, departure_time
    FROM flights
    GROUP BY source, destination, departure_time
    HAVING COUNT(*) > 1
);

-- 19. Running total of prices using subquery
SELECT
    f1.flight_id,
    f1.airline_id,
    f1.departure_time,
    f1.price,
    (
        SELECT SUM(f2.price)
        FROM flights f2
        WHERE f2.airline_id = f1.airline_id
          AND f2.departure_time <= f1.departure_time
    ) AS running_total
FROM flights f1
ORDER BY f1.airline_id, f1.departure_time;

-- 20. Total flights and average price using nested subqueries
SELECT
    a.airline_name,
    (
        SELECT COUNT(*)
        FROM flights f
        WHERE f.airline_id = a.airline_id
    ) AS total_flights,
    (
        SELECT AVG(price)
        FROM flights f
        WHERE f.airline_id = a.airline_id
    ) AS avg_price
FROM airlines a;
