---
layout: post
title:  "SQL Exercise 3: LIKE REGEX"
author: tony
categories: [ sql ]
image: assets/images/sql/hackerrank.jpg
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
我們有兩個方法可以Query出所要的資料，第一個是使用 WHERE ... LIKE ... 關鍵字，本題需要多重條件，因此必須使用多個LIKE條件並且用OR串接。第二個方法是使用正則表示法，關鍵字是REGEX


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

### REGEX
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


