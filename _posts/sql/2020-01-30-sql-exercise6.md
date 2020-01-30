---
layout: post
title:  "SQL Exercise 6"
author: tony
categories: [ sql ]
image: assets/images/sql/sql_problems.jpg
tags: [sql,exercise]
---
Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates.
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

# 解題思路
我們有兩個方法可以Query出所要的資料，第一個是使用 WHERE ... LIKE ... 關鍵字，本題需要多重條件，因此必須使用多個LIKE條件並且用OR串接。第二個方法是使用正則表示法，關鍵字是REGEXP


## ANS  
### MULTIPLE LIKE
```mysql
SELECT CITY
FROM STATION
WHERE CITY LIKE 'a%' 
OR CITY LIKE 'e%'
OR CITY LIKE 'i%'
OR CITY LIKE 'o%'
OR CITY LIKE 'u%'
```

### REGEXP
```mysql
SELECT CITY
FROM STATION
WHERE CITY REGEXP '^(a|e|i|o|u)'
```

## Expected Output  
```
Acme 
Addison 
Agency 
Aguanga 
Alanson 
Alba 
Albany 
Albion 
Algonac 
Aliso Viejo 
Allerton 
Alpine 
Alton 
Amazonia 
Amo 
Andersonville 
Andover 
Anthony 
Archie 
Arispe 
Arkadelphia 
Arlington 
Arrowsmith 
Athens 
Atlantic Mine 
Auburn 
East China 
East Haddam 
East Irvine 
Eastlake 
Edgewater 
Effingham 
Eleele 
Elkton 
Elm Grove 
Emmett 
Equality 
Eriline 
Ermine 
Eros 
Eskridge 
Esmond 
Eufaula 
Eureka Springs 
Eustis 
Everton 
Irvington 
Oakfield 
Oconee 
Odin 
Ojai 
Olmitz 
Onaway 
Orange City 
Orange Park 
Osage City 
Osborne 
Oshtemo 
Ottertail 
Ozona 
Udall 
Ukiah 
Union Star 
Upperco 
Urbana
```

## Extended question
1. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.
2. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates. 
3. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
4. Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
5. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.

