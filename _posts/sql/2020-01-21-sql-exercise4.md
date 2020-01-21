---
layout: post
title:  "SQL Exercise 4:SUBSTR,ORDERBY"
author: tony
categories: [ sql ]
image: assets/images/sql/hackerrank.jpg
tags: [sql,exercise]
---
Query the Name of any student in **STUDENTS** who scored higher than **75** Marks. Order your output by the last three characters of each name. If two or more students both have names ending in the same last three characters (i.e.: Bobby, Robby, etc.), secondary sort them by ascending ID.## Input Format  

# Input Format
|Column     | Type  |
|---|---|
|ID|	Integer	|
NAME|	STRING	|
MARKS|	Integer	|


The **STUDENTS** table is described as follows:  
The Name column only contains uppercase (A-Z) and lowercase (a-z) letters.

# Sample Input
|ID     | NAME  |MARKS|
|---|---|---|
|1|	Asheley	|81|
2|	Samanta	|75
4|	Julia	|76
3|Belvet|84

# Sample Output
```mysql
Ashley
Julia
Belvet
Explanation
```

Only Ashley, Julia, and Belvet have Marks > **75**. If you look at the last three characters of each of their names, there are no duplicates and 'ley' < 'lia' < 'vet'.

# 解題思路
1. 使用 WHERE 關鍵字設定過濾條件 MARKS >75
2. 使用 ORDER BY 關鍵字排序，排序條件是NAME的末三位string，再來是ID。
3. SUBSTR是用來截取子字串的函數，其用法為SUBSTR(str, pos)或SUBSTR(str, pos, len)。

# SOLUTION  
```mysql
SELECT NAME
FROM STUDENTS
WHERE MARKS > 75
ORDER BY SUBSTR(NAME,-3),ID
```
# Expected Output  
```
Stuart 
Kristeen 
Christene 
Amina 
Aamina 
Priya 
Heraldo 
Scarlet 
Julia 
Salma 
Britney 
Priyanka 
Samantha 
Vivek 
Belvet 
Devil 
Evil
```

# Extended question
