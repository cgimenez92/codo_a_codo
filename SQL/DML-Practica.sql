-- Ejercicios Guia practica DML --

SELECT Code, Name, Continent, Population FROM world.country;

SELECT DISTINCT Name FROM world.country;

SELECT Name as Nombre, Population as Poblacion FROM world.city;

SELECT Name, GNP as 'Producto Bruto NAcional', GNPOld as 'Producto Bruto NAcional Anterior',
IF(GNPOld IS NULL, GNP, GNP-GNPOld) as 'Diferencia' FROM world.country;

SELECT Name, Population, SurfaceArea, Population/SurfaceArea as 'Densidad' FROM world.country;

SELECT * FROM world.country 
	ORDER BY Population ASC; 
    
SELECT DISTINCT Language FROM world.countrylanguage
	ORDER BY Language;
    
SELECT Name, Population FROM world.city
	ORDER BY Population ASC LIMIT 20;
