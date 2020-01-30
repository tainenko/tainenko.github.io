---
layout: post
title:  "SQL Exercise 4:IF"
author: tony
categories: [ sql ]
image: assets/images/sql/hackerrank.jpg
tags: [sql,exercise]
---
Write a query identifying the type of each record in the **TRIANGLES** table using its three side lengths. Output one of the following statements for each record in the table:

- **Equilateral**: It's a triangle with 3 sides of equal length.
- **Isosceles**: It's a triangle with 2 sides of equal length.
- **Scalene**: It's a triangle with 3 sides of differing lengths.
- **Not A Triangle**: The given values of A, B, and C don't form a triangle.
# Input Format
The **TRIANGLES** table is described as follows:
|Column     | Type  |
|---|---|
|A|	Integer	|
B|	Integer	|
C|	Integer	|
Each row in the table denotes the lengths of each of a triangle's three sides.

# Sample Input
|A     | B  |C|
|---|---|---|
|20|	20	|23|
20|	20	|20
20|	21	|22
13|14|30

# Sample Output
```mysql
Isosceles
Equilateral
Scalene
Not A Triangle
```
# Explanation
Values in the tuple (20,20,23) form an Isosceles triangle, because A==B.  
Values in the tuple (20,20,20) form an Equilateral triangle, because A==B==C. Values in the tuple (20,21,22) form a Scalene triangle, because A!=B!=C.  
Values in the tuple (13,14,30) cannot form a triangle because the combined value of sides A and B is not larger than that of side C.  

# Analysis
此題需要用到IF或SWITCH CASE去判斷三邊長的關係，構成三角形的條件是任兩邊和必須大於第三邊，先判斷出ABC是否能構成三角形，接替再判斷是否符合正三角形或等腰三角形的條件。  

IF()返回一個數字或字串，當x為True時返回y，否則返回z，類似三元運算子。
```mysql
SELECT IF(x, y, z)
```
SWITCH CASE裡每一個區間都要搭配WHEN...THEN...關鍵字，都不符合的情況用ELSE處理，最後要以END關鍵字結尾。
```mysql
SELECT CASE col  
   WHEN 100 THEN '1'  
   WHEN 50 THEN '2'  
   ELSE '3'  
END  
```


# SOLUTION 
## IF 
```mysql
SELECT IF(A+B>C AND A+C>B AND B+C>A,
          IF(A=B AND A=C AND B=C,'Equilateral',
             IF(A=B OR B=C OR A=C,'Isosceles','Scalene')),
          'Not A Triangle')
FROM TRIANGLES
```
## CASE
```mysql
SELECT 
CASE 
  WHEN A+B>C AND A+C>B AND B+C>A THEN
  CASE
    WHEN A=B AND B=C THEN 'Equilateral'
    WHEN A=B OR B=C OR A=C THEN 'Isosceles'
    ELSE 'Scalene'
  END
  ELSE 'Not A Triangle'
END
FROM TRIANGLES
```
# Expected Output  
```
Equilateral 
Equilateral 
Isosceles 
Equilateral 
Isosceles 
Equilateral 
Scalene 
Not A Triangle 
Scalene 
Scalene 
Scalene 
Not A Triangle 
Not A Triangle 
Scalene 
Equilateral
```

# Extended question
