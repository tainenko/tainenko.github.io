---
layout: post
title:  "SQL Exercise 4"
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
我們有兩個方法可以Query出所要的資料，第一個是使用 WHERE ... LIKE ... 關鍵字，本題需要多重條件，因此必須使用多個LIKE條件並且用OR串接。第二個方法是使用正則表示法，關鍵字是REGEXP


# SOLUTION  

# Expected Output  
```

```

# Extended question
