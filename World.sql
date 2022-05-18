USE world;

-- 1.	Using COUNT, get the number of cities in the USA.

SELECT COUNT(ID) FROM city WHERE countrycode='USA';

-- 2.	Find out the population and life expectancy for people in Argentina.

SELECT population, lifeexpectancy FROM country WHERE `name`='Argentina';

-- 3.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the highest life expectancy?

SELECT * FROM country WHERE lifeexpectancy IS NOT NULL ORDER BY lifeexpectancy DESC LIMIT 1;

-- 4.	Using JOIN ... ON, find the capital city of Spain.

SELECT city.`name` AS City, country.`name` AS Country FROM country 
JOIN city ON country.capital = city.id WHERE country.`name` = 'spain';

-- 5.	Using JOIN ... ON, list all the languages spoken in the Southeast Asia region.

SELECT countrylanguage.`language`, country.`name` FROM country JOIN countrylanguage ON country.`code` = countrylanguage.countrycode WHERE country.region = 'southeast asia';

-- 6.	Using a single query, list 25 cities around the world that start with the letter F.

SELECT city.`name` AS City_Name FROM city WHERE name LIKE 'F%';

-- 7.	Using COUNT and JOIN ... ON, get the number of cities in China.

SELECT COUNT(`name`) FROM city WHERE countrycode='chn';

-- 8.	Using IS NOT NULL, ORDER BY, and LIMIT, which country has the lowest population? Discard non-zero populations.

SELECT `name` AS country, population FROM country WHERE population >1 ORDER BY population ASC LIMIT 1;

-- 9.	Using aggregate functions, return the number of countries the database contains.

SELECT COUNT(code) FROM country;

-- 10.	What are the top ten largest countries by area?

SELECT `name`, surfacearea FROM country ORDER BY surfacearea DESC LIMIT 10;

-- 11.	List the five largest cities by population in Japan.

SELECT `name`, population FROM city WHERE countrycode = 'JPN' ORDER BY population DESC LIMIT 5;

-- 12.	List the names and country codes of every country with Elizabeth II as its Head of State. You will need to fix the mistake first!

SET SQL_SAFE_UPDATES = 0;
UPDATE country SET HEADOFSTATE='Elizabeth II' Where headofstate='Elisabeth II';
SELECT `name`, `code` FROM country WHERE headofstate='Elizabeth II';

-- 13.	List the top ten countries with the smallest population-to-area ratio. Discard any countries with a ratio of 0.

SELECT `name`, population/surfacearea AS ratio FROM country WHERE population/surfacearea >0 ORDER BY ratio LIMIT 10;

-- 14.	List every unique world language.

SELECT DISTINCT `language` FROM countrylanguage; 

-- 15.	List the names and GNP of the world's top 10 richest countries.

SELECT `name`, gnp FROM country ORDER BY gnp DESC LIMIT 10; 

-- 16.	List the names of, and number of languages spoken by, the top ten most multilingual countries.

SELECT `name` AS Country, COUNT(countrylanguage.`language`) FROM country 
JOIN countrylanguage ON country.`code` = countrylanguage.countrycode
GROUP BY country.`name`
ORDER BY COUNT(countrylanguage.`language`) DESC LIMIT 10;

-- 17.	List every country where over 50% of its population can speak German.

SELECT country.`name`,countrylanguage.`Language`, countrylanguage.percentage FROM country
JOIN countrylanguage ON countrylanguage.CountryCode=country.`code`
WHERE percentage >50 AND `language`='German';

-- 18.	Which country has the worst life expectancy? Discard zero or null values.
SELECT `name` AS Country, lifeexpectancy FROM country 
WHERE lifeexpectancy IS NOT NULL AND lifeexpectancy >0
ORDER BY lifeexpectancy ASC LIMIT 1;

-- 19.	List the top three most common government forms.

SELECT COUNT(governmentform), governmentform FROM country
GROUP BY governmentform 
ORDER BY COUNT(governmentform) DESC LIMIT 3;

-- 20.	How many countries have gained independence since records began?
SELECT COUNT(indepyear) FROM country 
WHERE indepyear IS NOT NULL






