-- ================================================================
-- Project: Exploring Trends in the Automotive Industry
-- Data Source: Exploring Trends in the Automotive Industry.csv
-- Visualization Platform: Tableau Online
-- Database Tool: MySQL / PostgreSQL / SQLite
-- ================================================================

-- 1️⃣ CREATE TABLE ------------------------------------------------
CREATE TABLE automotive_data (
    Name TEXT,
    year INT,
    selling_price INT,
    km_driven INT,
    fuel TEXT,
    seller_type TEXT,
    transmission TEXT,
    owner TEXT,
    mileage TEXT,
    engine TEXT,
    max_power TEXT,
    torque TEXT,
    seats FLOAT
);

-- 2️⃣ (OPTIONAL) LOAD DATA ----------------------------------------
-- In MySQL, you can load your CSV like this (update file path):
-- LOAD DATA INFILE 'C:/path/to/Exploring Trends in the Automotive Industry.csv'
-- INTO TABLE automotive_data
-- FIELDS TERMINATED BY ',' ENCLOSED BY '"'
-- LINES TERMINATED BY '\n'
-- IGNORE 1 ROWS
-- (Name, year, selling_price, km_driven, fuel, seller_type, transmission, owner, mileage, engine, max_power, torque, seats);

-- ================================================================
-- 💹 DASHBOARD QUERIES FOR TABLEAU ONLINE
-- ================================================================

-- Query 1: Selling Price of Dealer by Year
SELECT 
    year,
    seller_type,
    SUM(selling_price) AS total_selling_price
FROM automotive_data
WHERE seller_type = 'Dealer'
GROUP BY year, seller_type
ORDER BY year;

-- Query 2: Average Selling Price by Car Fuel Type
SELECT 
    fuel,
    AVG(selling_price) AS avg_selling_price
FROM automotive_data
GROUP BY fuel
ORDER BY avg_selling_price DESC;

-- Query 3: Count of Cars per Type of Dealer
SELECT 
    seller_type,
    COUNT(*) AS car_count
FROM automotive_data
GROUP BY seller_type
ORDER BY car_count DESC;

-- Query 4: Count of Cars by Owner Type
SELECT 
    owner,
    COUNT(*) AS total_cars
FROM automotive_data
GROUP BY owner
ORDER BY total_cars DESC;

-- Query 5: Average Kilometers Driven by Fuel and Transmission
SELECT 
    transmission,
    fuel,
    ROUND(AVG(km_driven), 0) AS avg_km_driven
FROM automotive_data
GROUP BY transmission, fuel
ORDER BY transmission, fuel;

-- Query 6: Count of Cars by Fuel Type
SELECT 
    fuel,
    COUNT(*) AS car_count
FROM automotive_data
GROUP BY fuel
ORDER BY car_count DESC;

-- Query 7: Average Selling Price of Automatic & Manual Cars
SELECT 
    transmission,
    ROUND(AVG(selling_price), 0) AS avg_selling_price
FROM automotive_data
GROUP BY transmission
ORDER BY avg_selling_price DESC;

-- Query 8: Count of Automatic & Manual Cars by Owner
SELECT 
    owner,
    transmission,
    COUNT(*) AS total_cars
FROM automotive_data
GROUP BY owner, transmission
ORDER BY owner, transmission;

-- Query 9: Minimum and Maximum Seats by Fuel Type (optional filter)
SELECT 
    fuel,
    MIN(seats) AS min_seats,
    MAX(seats) AS max_seats
FROM automotive_data
GROUP BY fuel
ORDER BY fuel;

-- ================================================================
-- 🧠 END OF SCRIPT
-- ================================================================
