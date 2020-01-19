---
layout: post
title:  "SQL Exercise 2"
author: tony
categories: [ sql ]
image: assets/images/sql/hackerrank.jpg
tags: [sql,exercise]
---
Query the two cities in STATION with the shortest and longest CITY names, as well as their respective lengths (i.e.: number of characters in the name). If there is more than one smallest or largest city, choose the one that comes first when ordered alphabetically.

## Input Format  

The STATION table is described as follows:  

|Filed     | Type  |
|---|---|
|ID|	NUMBER	|
NAME|	VARCHAR2(17)	|
COUNTRYCODE|	VARCHAR2(3)	|
DISTRICT|VARCHAR2(20)
POPULATION|	NUMBER	|

where LAT_N is the northern latitude and LONG_W is the western longitude.

## Sample Input

Let's say that CITY only has four entries: DEF, ABC, PQRS and WXY

## Sample Output

ABC 3  
PQRS 4  

## Explanation

When ordered alphabetically, the CITY names are listed as ABC, DEF, PQRS, and WXY, with the respective lengths  and . The longest-named city is obviously PQRS, but there are  options for shortest-named city; we choose ABC, because it comes first alphabetically.

## Note
You can write two separate queries to get the desired output. It need not be a single query.




## ANS  
```mysql
SELECT CITY,LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY)=(SELECT MAX(LENGTH(CITY)) FROM STATION)
LIMIT 1;

SELECT CITY,LENGTH(CITY)
FROM STATION
WHERE LENGTH(CITY)=(SELECT MIN(LENGTH(CITY)) FROM STATION)
LIMIT 1
ORDER BY CITY;
```

## Expected Output  
```
Amo 3
Marine On Saint Croix 21
```


