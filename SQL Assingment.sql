-- Active: 1676995268951@@127.0.0.1@3306@PC
/*Creates a table called PC with the columns Code, Model, Speed_MHz, Ram_Mb, HD_Gb, CD, Price_£*/
CREATE TABLE PC (
  Code INT PRIMARY KEY,
  Model VARCHAR(10),
  Speed_MHz INT,
  Ram_Mb INT,
  HD_Gb INT,
  CD VARCHAR(10),
  Price_£ INT
);
/*Inserts the data from the CSV file provided into the table for further analysis*/
INSERT INTO PC (Code, Model, Speed_MHz, Ram_Mb, HD_Gb, CD, Price_£)
VALUES
  (1, '1232', 500, 64, 5, '12x', 600),
  (10, '1260', 500, 32, 10, '12x', 350),
  (11, '1233', 900, 128, 40, '40x', 980),
  (12, '1233', 800, 128, 20, '50x', 970),
  (2, '1121', 750, 128, 14, '40x', 850),
  (3, '1233', 500, 64, 5, '12x', 600),
  (4, '1121', 600, 128, 14, '40x', 850),
  (5, '1121', 600, 128, 8, '40x', 850),
  (6, '1233', 750, 128, 20, '50x', 950),
  (7, '1232', 500, 32, 10, '12x', 400),
  (8, '1232', 450, 64, 8, '24x', 350),
  (9, '1232', 450, 32, 10, '24x', 350);
  SELECT * FROM PC;
/*This Section of Code finds the Model, Speed_MHz and HD_Gb size of the PCs with 12 or 24x
  CD drives which have a price of less than 600 pounds*/
SELECT *
FROM PC 
WHERE (CD = '12x' OR CD = '24x') AND Price_£ < 600;
/*This Section of Code finds the code of PCs with max RAM_Mb and minimal price.*/
SELECT *
FROM PC
WHERE Price_£ = (
    SELECT MIN(Price_£)
    FROM PC
) 
ORDER BY Ram_Mb DESC
LIMIT 1;
/*This section locates all HD_Gbs which have identical capacities for two or more PCs*/
SELECT*
FROM PC
WHERE HD_Gb IN (
  SELECT HD_Gb
  FROM PC
  GROUP BY HD_Gb
  HAVING COUNT(*) >= 2
)
ORDER BY HD_Gb;

CREATE TABLE PC (
  Code INT PRIMARY KEY,
  Model VARCHAR(10),
  Speed_MHz INT,
  Ram_Mb INT,
  HD_Gb INT,
  CD VARCHAR(10),
  Price_£ INT
);
/*Inserts the data from the CSV file provided into the table for further analysis*/
LOAD DATA LOCAL INFILE './Presentationdata.csv'
INTO TABLE PC
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
IGNORE 1 ROWS;
SELECT * FROM PC;
/*This Section of Code finds the Model, Speed_MHz and HD_Gb size of the PCs with 12 or 24x
  CD drives which have a price of less than 600 pounds*/
SELECT *
FROM PC
WHERE (CD = '12x' OR CD = '24x') AND Price_£ < 600;






/*This section finds the processing speed of each PC with a HD_Gb capacity of 10GB or more
SELECT Code, Model, Speed_MHz, Ram_Mb, HD_Gb, CD, Price_£
FROM PC
WHERE HD_Gb >= 10;*/
