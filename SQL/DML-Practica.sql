-- Ejercicios Guia practica DML --

-- Selección. Unicidad. Alias. Columnas calculadas --
SELECT Code, Name, Continent, Population FROM world.country;

SELECT DISTINCT Name FROM world.country;

SELECT Name as Nombre, Population as Poblacion FROM world.city;

SELECT Name, GNP as 'Producto Bruto NAcional', GNPOld as 'Producto Bruto NAcional Anterior',
IF(GNPOld IS NULL, GNP, GNP-GNPOld) as 'Diferencia' FROM world.country;

SELECT Name, Population, SurfaceArea, Population/SurfaceArea as 'Densidad' FROM world.country;

-- Límites. Ordenamiento --
SELECT * FROM world.country 
	ORDER BY Population ASC; 
    
SELECT DISTINCT Language FROM world.countrylanguage
	ORDER BY Language;
    
SELECT Name, Population FROM world.city
	ORDER BY Population ASC LIMIT 20;

SELECT Code, Name, IndepYear FROM world.country
	ORDER BY IndepYear DESC;


SELECT Name, Continent FROM world.country 
	ORDER BY LifeExpectancy, SurfaceArea  ASC LIMIT 100;
    
-- Filtrado de registros. Operadores relacionales y lógicos. Operadores IN y BETWEEN. --

SELECT * FROM world.country
	WHERE Population = 0;

SELECT * FROM world.country
	WHERE LifeExpectancy > 75 ORDER BY LifeExpectancy DESC;
   
   
SELECT * FROM world.country 
	WHERE IndepYear >= 1850 AND GovernmentForm = 'Constitutional Monarchy';
    
SELECT * FROM world.country
	WHERE Continent = 'Europe' ORDER BY GNP DESC LIMIT 10;

SELECT * FROM world.country
	WHERE name = LocalName;
    
SELECT * FROM world.country 
	WHERE IndepYear >= 1950;
    
SELECT * FROM world.country 
	WHERE Continent IN('Europe', 'Asia', 'South America');
    
SELECT * FROM world.country 
	WHERE Continent <> 'Africa';
    
SELECT * FROM world.city
	WHERE CountryCode = 'ARG' and District <> 'Buenos Aires';
    
SELECT * FROM world.city
	WHERE Population BETWEEN 125000 AND 130000;

-- Manejo de valores nulos. Operador LIKE. Comodines. --

SELECT * FROM world.country 
	WHERE IndepYear IS NULL;
    
SELECT * FROM world.country 
	WHERE GNPOld IS NULL AND LifeExpectancy IS NULL;

SELECT * FROM world.country 
	WHERE Name LIKE 'A%A';
    
SELECT * FROM world.country 
	WHERE Name LIKE '% %';

-- Unión de tablas --

SELECT coun.Name, city.Name FROM world.country coun
	LEFT JOIN world.city city 
		ON coun.code = city.CountryCode AND coun.Capital = city.ID 
		WHERE coun.Continent = 'South America';

SELECT coun.Code, city.Name, city.Population FROM world.country coun
	LEFT JOIN world.city city 
		ON coun.code = city.CountryCode
		WHERE coun.LifeExpectancy >= 80;
        
SELECT * FROM world.city;

