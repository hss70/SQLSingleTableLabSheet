
-- Single Table Lab Sheet

SELECT * FROM pet;
SELECT * FROM pet WHERE sex = 'm';
SELECT DISTINCT owner FROM pet;
SELECT name,species,sex FROM pet WHERE species = 'snake' OR species = 'bird';

/*Q1-1 */

SELECT owner,name FROM pet WHERE sex='f';

/*Q1-2 */

SELECT name,birth FROM pet WHERE species = 'dog';

/*Q1-3 */

SELECT DISTINCT owner FROM pet WHERE species = 'bird';

/*Q1-4 */

SELECT species FROM pet WHERE sex='f';

/*Q1-5 */

SELECT name,birth FROM pet WHERE species = 'bird' OR species= 'cat';

/*Q1-6 */

SELECT name,species FROM pet WHERE sex='f' AND (species = 'bird' OR species= 'cat');



/*Comparison Operators and Ordering Output */

SELECT name FROM pet WHERE sex <'m';
SELECT name FROM pet WHERE name > 'F';
SELECT name FROM pet WHERE name > 'f';
SELECT name FROM pet WHERE name > 'F' AND owner > 'F';

/*Q2-1 */

SELECT owner, name FROM pet WHERE name LIKE '%er' OR name LIKE '%all';

/*Q2-2 */

SELECT name FROM pet WHERE owner LIKE '%e%';

/*Q2-3 */

SELECT name FROM pet WHERE name NOT LIKE '%fy';

/*Q2-4 */

SELECT name FROM pet WHERE LENGTH(name) = 4;

/*Q2-5 */

SELECT owner FROM pet WHERE owner <= 'E' AND (owner LIKE '%a' OR owner LIKE '%b'OR owner LIKE '%c' OR owner LIKE '%d' OR owner LIKE '%e');

/*Q2-6 */

SELECT owner FROM pet WHERE owner GLOB '[A-E]*[a-e]';

/*Task*/

SELECT name, birth FROM pet ORDER BY birth;
SELECT name,birth FROM pet ORDER BY birth DESC;
SELECT name, species, birth FROM pet ORDER BY species,birth DESC;

/*Date Manipulation*/


SELECT name FROM pet WHERE strftime('%m',birth) = strftime('%m','now');

SELECT name, strftime ('%m',birth) FROM pet;

SELECT name, strftime('%m',birth) AS Month FROM pet;

/* Counts and Value Manipulation*/

SELECT owner, name, (checkups * 20) AS income FROM pet;

/* Finds the oldest pet for each owner*/ 
SELECT owner, name, birth, MIN(strftime('%Y',birth)) AS birth FROM pet
GROUP BY owner;


/*Q3-1 */

SELECT owner, SUM(checkups)/COUNT(owner) AS Average FROM pet 
GROUP BY owner;

/*Q3-2 */

SELECT species, COUNT(name) AS Total FROM pet GROUP BY species ORDER BY species;

/*Q3-3 */

SELECT owner, species, COUNT(name) AS Total FROM pet GROUP BY owner, species;

/*Q3-4 */

SELECT owner, COUNT(DISTINCT species) AS Total FROM pet GROUP BY owner;

/*Q3-5 */

SELECT sex, COUNT(name) AS Total FROM pet WHERE sex = 'f' OR sex = 'm' GROUP BY sex;

/*Q3-6 */

SELECT owner, COUNT(name) AS total FROM pet WHERE species = 'bird';

/*Q3-7 */

SELECT owner, SUM(checkups) AS Total FROM pet GROUP BY owner;