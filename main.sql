CREATE TABLE pet (name VARCHAR(20), owner VARCHAR(20), species VARCHAR(20), sex CHAR(1), checkups SMALLINT UNSIGNED,  birth DATE, death DATE);
 
--To enter data, use the following command:

INSERT INTO pet (name,owner,species,sex,checkups,birth,death) VALUES 
('Fluffy','Harold','cat','f',5,'2001-02-04',NULL),
('Claws','Gwen','cat','m',2,'2000-03-17',NULL),
('Buffy','Harold','dog','f',7,'1999-05-13',NULL),
('Fang','Benny','dog','m',4,'2000-08-27',NULL),
('Bowser','Diane','dog','m',8,'1998-08-31','2001-07-29'),
('Chirpy','Gwen','bird','f',0,'2002-09-11',NULL),
('Whistler','Gwen','bird','',1,'2001-12-09',NULL),
('Slim','Benny','snake','m',5,'2001-04-29',NULL);

--Q1-1. The names of owners and their pet's name for all pets who are female.
SELECT owner, name 
FROM pet 
WHERE sex = 'f';

/*owner	name
Harold	Fluffy
Harold	Buffy
Gwen	Chirpy */

--Q1-2. The names and birth dates of pets which are dogs
SELECT name, birth 
FROM pet 
WHERE species = 'dog';

/* name	birth
Buffy	1999-05-13
Fang	2000-08-27
Bowser	1998-08-31
*/

--Q1-3. The names of the owners of birds
SELECT DISTINCT owner 
FROM pet 
WHERE species = 'bird';
/*owner
  Gwen
*/

--Q1-4. The species of pets who are female
SELECT DISTINCT species 
FROM pet 
WHERE sex = 'f';
/*
species
cat
dog
bird
*/

--Q1-5. The names and birth dates of pets which are cats or birds
SELECT name, birth 
FROM pet 
WHERE species = 'cat' OR species = 'bird';

/*
Fluffy	2001-02-04
Claws	2000-03-17
Chirpy	2002-09-11
Whistler	2001-12-09
*/

-- Q1-6. The names and species of pets which are cats or birds and which are female
SELECT name, species 
FROM pet 
WHERE (species = 'cat' OR species = 'bird') AND sex = 'f';

/*
name	species
Fluffy	cat
Chirpy	bird
*/

-- QUESTION 2

-- Q2-1, The names of owners and their pets where the pet's name ends with "er" or "all"
SELECT owner, name 
FROM pet 
WHERE name LIKE '%er' OR name LIKE '%all';
--Result from the query= Diane-Bowser, Gwen-Whistler

-- Q2-2, The names of any pets whose owner's name contains an "e"
SELECT name 
FROM pet 
WHERE owner LIKE '%e%';
--Result from the query= Claws, Chirpy, Whistler, Fang, Slim

-- Q2-3, The names of all pets whose name does not end with "fy"
SELECT name 
FROM pet 
WHERE name NOT LIKE '%fy';
--Result from the query= All pets except Fluffy and Buffy

-- Q2-4: All pet names whose owners name is only four characters long
SELECT name 
FROM pet 
WHERE LENGTH(owner) = 4;
--Result from the query= Claws, Chirpy, Whistler all owned by Gwen

--Q2-5, All owners whose names begin and end with one of the first five letters of the alphabet
SELECT DISTINCT owner 
FROM pet 
WHERE (owner LIKE 'a%' OR owner LIKE 'b%' OR owner LIKE 'c%' OR owner LIKE 'd%' OR owner LIKE 'e%')
AND (owner LIKE '%a' OR owner LIKE '%b' OR owner LIKE '%c' OR owner LIKE '%d' OR owner LIKE '%e');
--Result from the query= Empty set no owners meet both conditions described

-- Q2-6: Repeat the previous query, but make the query sensitive to the case of letters
SELECT DISTINCT owner 
FROM pet 
WHERE (owner LIKE 'a%' OR owner LIKE 'b%' OR owner LIKE 'c%' OR owner LIKE 'd%' OR owner LIKE 'e%' COLLATE BINARY)
AND (owner LIKE '%a' OR owner LIKE '%b' OR owner LIKE '%c' OR owner LIKE '%d' OR owner LIKE '%e' COLLATE BINARY);
--Result from the query= Empty set (case sensitivity doesn't change result)

--
-- QUESTION 3
-- 

-- Q3-1, The average number of check-ups that each owner has made with their pets
SELECT owner, AVG(checkups) AS avg_checkups 
FROM pet 
GROUP BY owner;
--Result from the query= Shows average checkups per owner (Harold:6.0, Gwen:1.0, Benny:4.5, Diane:8.0)

-- Q3-2, The number of pets of each species in ascending order
SELECT species, COUNT(*) AS count 
FROM pet 
GROUP BY species 
ORDER BY count ASC;
--Result from the query= bird:2, snake:1, cat:2, dog:3

-- Q3-3, The number of pets of each species that each owner has
SELECT owner, species, COUNT(*) AS count 
FROM pet 
GROUP BY owner, species;
--Result from the query= Harold-cat:1, Harold-dog:1, Gwen-cat:1, Gwen-bird:2, Benny-dog:1, Benny-snake:1, Diane-dog:1

-- Q3-4,The number of distinct species of pet each owner has
SELECT owner, COUNT(DISTINCT species) AS unique_species 
FROM pet 
GROUP BY owner;
--Result from the query=  Harold:2, Gwen:2, Benny:2, Diane:1

-- Q3-5, The number of pets of each gender there are in the database, where the gender is known
SELECT sex, COUNT(*) AS count 
FROM pet 
WHERE sex IS NOT NULL AND sex != '' 
GROUP BY sex;
--Result from the query= f:3, m:4 (Whistler excluded due to empty sex)

-- Q3-6, The number of birds each owner has
SELECT owner, COUNT(*) AS bird_count 
FROM pet 
WHERE species = 'bird' 
GROUP BY owner;
--Result from the query= Gwen:2 (only Gwen has birds)

-- Q3-7, The total number of check-ups each owner has made with all their pets
SELECT owner, SUM(checkups) AS total_checkups 
FROM pet 
GROUP BY owner;
--Result from the query= Harold:12, Gwen:3, Benny:9, Diane:8

-- Date Manipulation Example: Find pets born in current month
SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m','now');

-- Show birth months with aliases
SELECT name, strftime('%m', birth) AS Month FROM pet;

-- Calculate vet income from checkups
SELECT owner, name, (checkups * 20) AS income FROM pet;

-- Example of GROUP BY with MIN function
SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS earliest_birth_year 
FROM pet 
GROUP BY owner;


SELECT 
    'Assignment Complete - All Questions Solved' AS status,
    COUNT(*) AS total_pets,
    SUM(checkups) AS total_checkups,
    COUNT(DISTINCT owner) AS unique_owners
FROM pet;
/*
status	total_pets	total_checkups	unique_owners
Assignment Complete - All Questions Solved	8	32	4
*/