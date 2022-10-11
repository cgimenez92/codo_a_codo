-- Ejercicios Guia practica DML --

SELECT 
    Code, Name, Continent, Population
FROM
    world.country;

SELECT DISTINCT
    Name
FROM
    world.country;

SELECT 
    Name AS Nombre, Population AS Poblacion
FROM
    world.city;

SELECT 
    Name,
    GNP AS 'Producto Bruto NAcional',
    GNPOld AS 'Producto Bruto NAcional Anterior',
    IF(GNPOld IS NULL, GNP, GNP - GNPOld) AS 'Diferencia'
FROM
    world.country;

SELECT 
    Name,
    Population,
    SurfaceArea,
    Population / SurfaceArea AS 'Densidad'
FROM
    world.country;

-- Límites. Ordenamiento --
SELECT 
    *
FROM
    world.country
ORDER BY Population ASC;

SELECT DISTINCT
    Language
FROM
    world.countrylanguage
ORDER BY Language;
 
SELECT 
    Name, Population
FROM
    world.city
ORDER BY Population ASC
LIMIT 20;

SELECT 
    Code, Name, IndepYear
FROM
    world.country
ORDER BY IndepYear DESC;


SELECT 
    Name, Continent
FROM
    world.country
ORDER BY LifeExpectancy , SurfaceArea ASC
LIMIT 100;
 
-- Filtrado de registros. Operadores relacionales y lógicos. Operadores IN y BETWEEN. --

SELECT 
    *
FROM
    world.country
WHERE
    Population = 0;

SELECT 
    *
FROM
    world.country
WHERE
    LifeExpectancy > 75
ORDER BY LifeExpectancy DESC;
  
SELECT 
    *
FROM
    world.country
WHERE
    IndepYear >= 1850
        AND GovernmentForm = 'Constitutional Monarchy';
 
SELECT 
    *
FROM
    world.country
WHERE
    Continent = 'Europe'
ORDER BY GNP DESC
LIMIT 10;

SELECT 
    *
FROM
    world.country
WHERE
    name = LocalName;
  
SELECT 
    *
FROM
    world.country
WHERE
    IndepYear >= 1950;
 
SELECT 
    *
FROM
    world.country
WHERE
    Continent IN ('Europe' , 'Asia', 'South America');
 
SELECT 
    *
FROM
    world.country
WHERE
    Continent <> 'Africa';
 
SELECT 
    *
FROM
    world.city
WHERE
    CountryCode = 'ARG'
        AND District <> 'Buenos Aires';
 
SELECT 
    *
FROM
    world.city
WHERE
    Population BETWEEN 125000 AND 130000;

-- Manejo de valores nulos. Operador LIKE. Comodines. --

SELECT 
    *
FROM
    world.country
WHERE
    IndepYear IS NULL;
  
SELECT 
    *
FROM
    world.country
WHERE
    GNPOld IS NULL
        AND LifeExpectancy IS NULL;

SELECT * FROM world.country 
	WHERE Name LIKE 'A%A';
  
SELECT 
    *
FROM
    world.country
WHERE
    Name LIKE '% %';

-- Unión de tablas --

SELECT 
    coun.Name, city.Name
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.code = city.CountryCode
        AND coun.Capital = city.ID
WHERE
    coun.Continent = 'South America';

SELECT 
    coun.Code, city.Name, city.Population
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.code = city.CountryCode
WHERE
    coun.LifeExpectancy >= 80;
        
SELECT 
    city.Name, coun.GovernmentForm
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.Capital = city.ID
WHERE
    coun.GovernmentForm = 'Federal Republic';

SELECT 
    coun.Name, lng.Language
FROM
    world.country coun
        LEFT JOIN
    world.countrylanguage lng ON coun.code = lng.CountryCode
WHERE
    coun.Population BETWEEN 1000000 AND 3000000
        AND lng.IsOfficial = 'T';
                
SELECT 
    coun.Code, coun.LocalName, coun.Region
FROM
    world.country coun
        LEFT JOIN
    world.countrylanguage lng ON coun.code = lng.CountryCode
WHERE
    lng.Language = 'Spanish';

SELECT 
    coun.Name, city.Name
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.code = city.CountryCode
        AND coun.Capital = city.ID
WHERE
    city.Population > (coun.Population / 2);

SELECT 
    coun.Name, coun.SurfaceArea
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.code = city.CountryCode
        AND coun.Capital = city.ID
WHERE
    coun.Continent = 'Africa'
        AND city.Name = city.District;

SELECT 
    coun.Name, city.Name, coun.IndepYear
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.code = city.CountryCode
        AND coun.Capital = city.ID
WHERE
    coun.IndepYear IS NOT NULL
ORDER BY coun.IndepYear ASC
LIMIT 20;
   
SELECT 
    city.Name, lng.Language
FROM
    world.city city
        LEFT JOIN
    world.countrylanguage lng ON city.CountryCode = lng.CountryCode
WHERE
    lng.IsOfficial = 'T'
        AND lng.Language NOT IN ('Spanish' , 'English',
        'Portuguese',
        'Italian',
        'French',
        'German');
 
SELECT 
    city.Name, city.Population, coun.Name
FROM
    world.city city
        LEFT JOIN
    world.country coun ON city.CountryCode = coun.Code
        LEFT JOIN
    world.countrylanguage lng ON coun.Code = lng.CountryCode
WHERE
    lng.Language = 'English'
ORDER BY city.Population DESC
LIMIT 10;
          
-- Funciones de agregación. Agrupamiento. --

SELECT 
    SUM(Population) AS total,
    MAX(Population) AS poblacion_maxima,
    MIN(Population) AS poblacion_minima,
    AVG(Population) AS media_poblacional,
    COUNT(Population) AS q_registros_poblacion
FROM
    world.country;

SELECT 
    Continent AS continente,
    SUM(Population) AS total,
    MAX(Population) AS poblacion_maxima,
    MIN(Population) AS poblacion_minima,
    AVG(Population) AS media_poblacional,
    COUNT(Population) AS q_registros_poblacion
FROM
    world.country
GROUP BY Continent;

SELECT 
    Continent AS continente, COUNT(Code) AS q_paises
FROM
    world.country
GROUP BY Continent;

SELECT 
    Code, SUM(Population) AS q_habitantes
FROM
    world.country
GROUP BY code;

SELECT 
    Language, MIN(Percentage) AS min_percentage
FROM
    world.countrylanguage
GROUP BY Language;

SELECT 
    GovernmentForm, AVG(Population) AS avg_population
FROM
    world.country
WHERE
    Continent = 'Europe'
GROUP BY GovernmentForm;

SELECT 
    Region, MAX(LifeExpectancy) AS max_lifeexpectany
FROM
    world.country
GROUP BY Region
ORDER BY MAX(LifeExpectancy) DESC
LIMIT 10;

SELECT 
    District,
    MAX(Population) AS max_population,
    COUNT(ID) AS q_city
FROM
    world.city
WHERE
    Population >= 500000
GROUP BY District
ORDER BY q_city DESC
LIMIT 10;

SELECT 
    coun.Name, COUNT(city.ID) AS q_cities
FROM
    world.country coun
        LEFT JOIN
    world.city city ON coun.code = city.CountryCode
WHERE
    coun.Region = 'Caribbean'
GROUP BY coun.Name;
    
SELECT 
     lng.Language, COUNT(coun.Name) 
FROM
    world.country coun
        LEFT JOIN
    world.countrylanguage lng ON coun.Code = lng.CountryCode
WHERE
    lng.IsOfficial = 'T'
GROUP BY lng.Language;

-- Filtrado de grupos. --

SELECT
		IndepYear, COUNT(code) AS q_countries 
	FROM world.country
	WHERE 
		IndepYear IS NOT NULL
	GROUP BY IndepYear 
HAVING
	q_countries >1
ORDER BY q_countries ASC;


SELECT 
        coun.Name, COUNT(lng.Language) AS q_languages
    FROM
        world.country coun
    LEFT JOIN world.countrylanguage lng ON coun.Code = lng.CountryCode
    GROUP BY coun.Name
HAVING
    q_languages BETWEEN 3 AND 5
ORDER BY q_languages ASC;

SELECT 
    city.Name, coun.Name, city.Population
FROM
    world.city city
        LEFT JOIN
    world.country coun ON city.CountryCode = coun.Code
WHERE city.Population < 10000;

SELECT 
    country.Region,
    AVG(country.population / country.surfaceArea) AS densidad_poblacional_prom
FROM
    world.country
GROUP BY Region
HAVING densidad_poblacional_prom > MAX(country.population / country.surfaceArea) / 2;

SELECT Language, AVG(Percentage) AS promedio_habla 
FROM 
	world.countrylanguage
GROUP BY Language
HAVING promedio_habla IN (1,2,3,4,5,6,7,8,9);
