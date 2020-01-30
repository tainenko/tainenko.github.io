---
layout: post
title:  "SQL Exercise 6:CONCAT"
author: tony
categories: [ sql ]
image: assets/images/sql/sql_problems.jpg
tags: [sql,exercise]
---
Generate the following two result sets:

1. Query an alphabetically ordered list of all names in **OCCUPATIONS**, immediately followed by the first letter of each profession as a parenthetical (i.e.: enclosed in parentheses). For example: AnActorName(A), ADoctorName(D), AProfessorName(P), and ASingerName(S).
2. Query the number of ocurrences of each occupation in **OCCUPATIONS**. Sort the occurrences in ascending order, and output them in the following format: 
    ```mysql
    There are a total of [occupation_count] [occupation]s.
    ```
    where \[occupation_count] is the number of occurrences of an occupation in **OCCUPATIONS** and \[occupation] is the lowercase occupation name. If more than one Occupation has the same \[occupation_count], they should be ordered alphabetically.
**Note**: There will be at least two entries in the table for each type of occupation.
## Input Format  

The **OCCUPATIONS** table is described as follows:

|Filed     | Type  |
|---|---|
NAME|	STRING
OCCUPATION|	STRING

Occupation will only contain one of the following values: **Doctor**, **Professor**, **Singer** or **Actor**.

# Analysis
1. Use CONCAT() to combine the string we want. 
    ```mysql
    Syntax
    CONCAT(expression1, expression2, expression3,...)
    ```
2.  To get the abbreviation of occupation, we can use the SUBSTR() function.
    ```mysql
    Syntax
    SUBSTR(string, start, length)
    # In this case
    # SUBSTR(OCCUPATION, 1, 1)
    ```
3. sort the result with ORDER BY keyword.
3. Do the same things in second query.

## ANS  
#
```mysql
SELECT CONCAT(NAME,'(',SUBSTR(OCCUPATION,1,1),')')
FROM OCCUPATIONS
ORDER BY NAME;

SELECT CONCAT('There are a total of ',COUNT(OCCUPATION),' ',LOWER(OCCUPATION),'s.')
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(OCCUPATION),OCCUPATION;

```

## Expected Output  
```
Aamina(D) 
Ashley(P) 
Belvet(P) 
Britney(P) 
Christeen(S) 
Eve(A) 
Jane(S) 
Jennifer(A) 
Jenny(S) 
Julia(D) 
Ketty(A) 
Kristeen(S) 
Maria(P) 
Meera(P) 
Naomi(P) 
Priya(D) 
Priyanka(P) 
Samantha(A) 
There are a total of 3 doctors. 
There are a total of 4 actors. 
There are a total of 4 singers. 
There are a total of 7 professors. 
```
