---
layout: post
title:  "SQL Exercise 5: Asian Population"
author: tony
categories: [ sql ]
image: assets/images/sql/hackerrank.jpg
tags: [sql,exercise]
---
Given the **CITY** and **COUNTRY** tables, query the sum of the populations of all cities where the CONTINENT is 'Asia'.

**Note**: CITY.CountryCode and COUNTRY.Code are matching key columns.

## Input Format  

The CITY and COUNTRY tables are described as follows: 

CITY  

|Filed     | Type  |
|---|---|
|ID|	NUMBER	|
NAME|	VARCHAR2(17)	|
COUNTRYCODE|	VARCHAR2(3)	|
DISTRICT|VARCHAR2(20)
POPULATION|	NUMBER	|

COUNTRY

|Filed     | Type  |
|---|---|
|CODE|VARCHAR2(3)
NAME|	VARCHAR2(44)	|
CONTINENT|	VARCHAR2(13)	|
REGION|VARCHAR2(25)
SURFACEAREA|	NUMBER	|
INDEPYEAR|VARCHAR2(5)
POPULATION|	NUMBER	|
LIFEEXPECTANCE|VARCHAR2(4)
GNP|	NUMBER	|
GNPOLD|VARCHAR2(9)
LOCALNAME|VARCHAR2(44)
GOVERNMENTFORM|VARCHAR2(44)
HEADOFSTATE|VARCHAR2(32)
CAPITAL|VARCHAR2(4)
CODE2|VARCHAR2(2)


# ANALYSIS
1. JOIN two tables on CITY.CountryCode = COUNTRY.Code
2. add the limitation where Country.continent = 'Asia'
3. Using SUM keyword to compute the total of city population.


## ANS  
SELECT SUM(CITY.POPULATION)
FROM CITY
JOIN COUNTRY
ON CITY.CountryCode = COUNTRY.Code
WHERE COUNTRY.CONTINENT='Asia'

## Expected Output  
```
27028484
```
