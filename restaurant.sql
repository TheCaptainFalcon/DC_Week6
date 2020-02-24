CREATE TABLE restaurant (
    id serial PRIMARY KEY,
    Name text,
    Distance int,
    Stars int,
    Category text,
    Favorite_Dish text,
    Takeout boolean,
    Recent TIMESTAMP
)

--There are a total of 10 entries
INSERT INTO restaurant (Name, Distance, Stars, Category, Favorite_Dish, Takeout, Recent)  
VALUES ('Moon Tower','5','3','American','Burger','TRUE','2020-01-23 03:14:03'),

('Rooster', '12', '5', 'Southern', 'Chicken_and_Waffles', 'TRUE', '2019-11-01 11:30:54'),

('Big_Baby', '3', '2', 'BBQ', 'Pulled_Pork', 'TRUE','2019-08-15 02:13:17'),

('Freshen', '10', '5', 'Japanese', 'Karaage', 'FALSE', '2020-02-05 05:15:22'),

('Mix_em_up', '20', '5', 'BBQ', 'Garbage_Plate', 'TRUE', '2019-06-12 03:11:44'),

('Smash', '1', '2', 'American', 'Cheeseburger', 'TRUE', '2019-03-20 11:11:10'),

('The_Zone', '6', '4', 'Mediterranean', 'Gyro', 'FALSE', '2018-07-07 02:02:02'),

('Smokers', '15', '1', 'BBQ', 'Smoked_Chicken', 'TRUE', '2019-01-06 03:56:51'),

('Wing_City', '4', '3', 'American', 'Buffalo_Wings', 'TRUE', '2020-02-10 01:01:02'),

('Gyro_Joint', '11', '3', 'Mediterranean', 'Gyro', 'FALSE', '2019-03-16 12:15:39')

-- Query Practice 
-- Writing Queries

-- 1. The names of the restaurants that you gave a 5 star to
SELECT Name
FROM restaurant
WHERE Stars = 5;

-- 2. The favorite dishes with 5-Star reviews
SELECT Favorite_Dish
FROM restaurant
WHERE Stars = 5;

-- 3. The ID of a restaurant by a specific restaurant name, say 'Moon Tower'
SELECT id
FROM restaurant
WHERE Name = 'Moon Tower';

-- 4. Names in the category of 'BBQ'
SELECT Name
FROM restaurant
WHERE Category = 'BBQ';

-- 5. Restaurants that do Takeout
SELECT Name
FROM restaurant
WHERE Takeout = 'TRUE';

-- 6. Restaurants that do Takeout and are in the category of 'BBQ'
SELECT Name
FROM restaurant
WHERE Takeout = 'TRUE' 
AND
Category = 'BBQ';

-- 7. Restaurants within 2 miles
SELECT name
FROM restaurant
WHERE distance <= 2;

-- 8. Restaurants you haven't eaten at in the last week
SELECT name
FROM restaurant
WHERE recent >= '2020-02-17 00:00:00';

-- 9. Restaurants you haven't eaten at in the last week and has 5 stars
SELECT name
FROM restaurant
WHERE recent >= '2020-02-17 00:00:00'
AND
Stars = 5;

-- Aggregation and Sorting Queries

-- 1. List restaurants by the closest distance
SELECT name, distance
FROM restaurant
ORDER BY distance ASC;

-- 2. List the top 2 restaurants by distance
SELECT name, distance
FROM restaurant
ORDER BY distance ASC
LIMIT 2;

-- 3. List the top 2 restaurants by stars
SELECT name, stars
FROM restaurant
ORDER BY stars DESC
LIMIT 2;

-- 4. List the top 2 restaurants by stars where the distance is less than 2 miles
SELECT name, stars, distance
FROM restaurant
WHERE distance < 2
ORDER BY stars DESC

-- 5. Count the number of restaurants in the db
SELECT COUNT(name)
FROM restaurant;

-- 6. Count the number of restaurants by category
SELECT COUNT(DISTINCT category)
FROM restaurant;

-- 7. Get the average stars per restaurant by category
SELECT AVG(stars), names
FROM restaurant
GROUP BY category;

-- 8. Get the max stars of a restaurant by category
SELECT MAX(stars)
FROM restaurant
GROUP BY category;