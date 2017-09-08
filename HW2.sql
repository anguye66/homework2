CREATE TABLE Countries (
	name VARCHAR (20),
	latitude INT,
	longitude INT,
	area INT,
	population INT,
	gdp INT,
	gdpYear INT,
	PRIMARY KEY (name)
);

-- 4a Create table Borders
CREATE TABLE Borders (
	country1 VARCHAR (20),
	country2 VARCHAR (20),
	FOREIGN KEY (country1) REFERENCES Countries (name),
	FOREIGN KEY (country2) REFERENCES Countries (name)
);

-- 4b Populate both tables
INSERT INTO Countries VALUES ("Germany",51,10,357,80,3466,1452),
							 ("Netherlands",52,5,41,17,771,452),
							 ("Belgium",50,4,32,11,466,152),
							 ("Luxemburg",50,2,1,1,59,12),
							 ("Poland",52,19,312,38,467,321),
							 ("Czech Republic",50,15,78,11,192,102),
							 ("Austria",48,15,83,8,1258,651),
							 ("France",46,2,675,66,2463,1123),
							 ("Switzerland",46,8,41,8,659,342);

INSERT INTO Borders VALUES ("Germany","Netherlands"),
                           ("Germany","Belgium"),
						   ("Germany","Luxemburg"),
						   ("Germany","Poland"),
						   ("Germany","Czech Republic"),
						   ("Germany","Austria"),
						   ("Germany","Switzerland"),
						   ("Netherlands","Germany"),
						   ("Netherlands","Belgium"),
						   ("Belgium","Germany"),
						   ("Belgium","Luxemburg"),
						   ("Belgium","Netherlands"),
						   ("Belgium","France"),
						   ("Luxemburg","Germany"),
						   ("Luxemburg","Belgium"),
						   ("Luxemburg","France"),
						   ("Poland","Germany"),
						   ("Poland","Czech Republic");
						   
-- 4c All countries that border Germany
SELECT country2 AS Name
FROM Borders 
WHERE country1 = "Germany";

-- 4d All countries that have a population greater than 100 million
SELECT name
FROM Countries 
WHERE population > 100;

-- 4e All countries that have a population greater than 100 million and border Germany
SELECT country2 AS Name
FROM Borders INNER JOIN Countries ON Borders.country1 = Countries.name
WHERE country1 = "Germany" AND population > 100;
