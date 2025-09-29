-- Q1-1. The names of owners and their pet's name for all pets who are female.
SELECT name, owner FROM pet WHERE sex = 'f';

-- Q1-2. The names and birth dates of pets which are dogs.
SELECT name, birth FROM pet WHERE species = 'dog';

-- Q1-3. The names of the owners of birds.
SELECT owner FROM pet WHERE species = 'bird';

-- Q1-4. The species of pets who are female.
SELECT species FROM pet WHERE sex = 'f';

-- Q1-5. The names and birth dates of pets which are cats or birds.
SELECT name, birth FROM pet WHERE species IN ('cat', 'bird');

-- Q1-6. The names and species of pets which are cats or birds and which are female.
SELECT name, species FROM pet WHERE species IN ('cat', 'bird') AND sex = 'f';


-- Q2-1. The names of owners and their pets where the pet's name ends with “er” or “all”
SELECT name, owner FROM pet WHERE name LIKE '%er' OR name LIKE '%all'; 

-- Q2-2. The names of any pets whose owner's name contains an "e"
SELECT name FROM pet WHERE owner LIKE '%e%';

-- Q2-3. The names of all pets whose name does not end with "fy"
SELECT name FROM pet WHERE name NOT LIKE '%fy';

-- Q2-4. All pet names whose owners name is only four characters long
SELECT name FROM pet WHERE LENGTH(owner) = 4;

select '2.5';
select owner from pet;
-- Q2-5. Case-insensitive: names starting and ending with A–E
SELECT owner
FROM pet
WHERE owner GLOB '[A-Fa-f]*[A-Fa-f]';

--alterative using Like and NOCASE
SELECT owner
FROM pet
WHERE (
    owner LIKE 'A%' COLLATE NOCASE OR
    owner LIKE 'B%' COLLATE NOCASE OR
    owner LIKE 'C%' COLLATE NOCASE OR
    owner LIKE 'D%' COLLATE NOCASE OR
    owner LIKE 'E%' COLLATE NOCASE
)
AND (
    owner LIKE '%A' COLLATE NOCASE OR
    owner LIKE '%B' COLLATE NOCASE OR
    owner LIKE '%C' COLLATE NOCASE OR
    owner LIKE '%D' COLLATE NOCASE OR
    owner LIKE '%E' COLLATE NOCASE
);


-- Q2-6. Case-sensitive: same query but without NOCASE
SELECT owner
FROM pet
WHERE owner GLOB '[A-E]*[A-E]';
--alterative using Like without NOCASE
SELECT owner
FROM pet
WHERE (
    owner LIKE 'A%' OR
    owner LIKE 'B%' OR
    owner LIKE 'C%' OR
    owner LIKE 'D%' OR
    owner LIKE 'E%'
)
AND (
    owner LIKE '%A' OR
    owner LIKE '%B' OR
    owner LIKE '%C' OR
    owner LIKE '%D' OR
    owner LIKE '%E'
);
-- Q3-1. The average number of check-ups that each owner has made with their pets
SELECT owner, AVG(checkups) AS "average checkups" FROM pet GROUP BY owner;

-- Q3-2. The number of pets of each species in ascending order
SELECT species, COUNT(*) AS count FROM pet GROUP BY species ORDER BY count ASC;

-- Q3-3. The number of pets of each species that each owner has
SELECT species, owner, COUNT(*) AS count FROM pet GROUP BY species, owner;

-- Q3-4. The number of distinct species of pet each owner has
SELECT owner, COUNT(DISTINCT species) AS count FROM pet GROUP BY owner;

-- Q3-5. The number of pets of each gender there are in the database, where the gender is known
SELECT sex, COUNT(*) AS count FROM pet WHERE sex IN ('m', 'f') GROUP BY sex;

-- Q3-6. The number of birds each owner has
SELECT owner, COUNT(*) AS count FROM pet WHERE species = 'bird' GROUP BY owner;

-- Q3-7. The total number of check-ups each owner has made with all their pets
SELECT owner, SUM(checkups) AS "total checkups" FROM pet GROUP BY owner;