---
layout: post
title:  "SQL Exercise 1"
author: tony
categories: [ sql ]
image: assets/images/sql/hackerrank.jpg
tags: [sql,exercise]
---
Query all columns for all American cities in CITY with populations larger than 100000. The CountryCode for America is USA.

## Input Format
The CITY table is described as follows:  

|Filed     | Type  |
|---|---|
|ID|	NUMBER	|
NAME|	VARCHAR2(17)	|
COUNTRYCODE|	VARCHAR2(3)	|
DISTRICT|VARCHAR2(20)
POPULATION|	NUMBER	|

## ANS  
```mysql
SELECT *
FROM CITY
WHERE POPULATION >= 100000
AND COUNTRYCODE ='USA'
```

## Expected Output  
```
3878 Scottsdale USA Arizona 202705 
3965 Corona USA California 124966 
3973 Concord USA California 121780 
3977 Cedar Rapids USA Iowa 120758 
3982 Coral Springs USA Florida 117549 
```


