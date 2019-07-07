---
layout: post
title:  " Cracking the coding interview - Array "
author: tony
categories: [ interview ]
image: assets/images/Cracking-The-Coding-INterviw.png
tags: [ interview ]
---

## Questions
1. **Is Unique**: Implement an algorithm to determine if a string has all unique characters. What if you cannot use additional data structures?

2. **Check Permutation**: Given two strings, write a method to decide if one is a permutation of the other.

3. **URLify**: Write a method to replace all spaces in a string with '%20': You may assume that the string has sufficient space at the end to hold the additional characters, and that your are given the "true" length of the string. (Noe: if implementing in Java, please use a character array so that you can perform this operation in place.)  
    EXAMPLE:  
    Input:  "Mr John Smith  ",13    
    Output: "Mr%20John%20Smith"   
4. **Palindrome permutation**: Given a string, write a function to check if it is a permutation of a palindrome. A palindrome is a word or phrase that is the same forwards and backwards. A permutation is a rearrangement of letters. The palindrome does not need to be limited to jest dictionary words.  
    EXAMPLE:  
    Input:  Tact Coa  
    Output: True (permutations: "taco cat", "atco cta", etc.)  
5. **One Away**: There are three types of edits that can be performed on strings: Insert a character, remove a character, or replace a character. Given two strings, write a function to check if they are one edit (or zero edits) away.  
    EXAMPLE:  
    pale,   ple     -> true
    pales,  pale    -> true
    pale,   bale    -> true
    pale,   bake    -> false
6. **String Compression**: Implement a method to perform basic string compression using the counts of repeated characters. For example the string aabcccccaaa would become a2b1c5a3. if the "compressed"string would not become smaller than the original string, your method should return the original string. You can assume the string has only uppercase and lowercase letters (a-z).  
7. **Rotate matrix**: Given an image represented by an NxN matrix, where each pixel in the image is 4 bytes, write a method to rotate the image by 90 degrees. Can you do this in place?  
8. **Zero Matrix**: Write an algorithm such that if an element in an MxN matrix is 0, its entire row and column are set to 0.
9. **String Rotation**: Assume you have a method isSubstring which checks if one word is a substring of another. Given two strings, s1 and s2, write code to check if s2 is a rotation of s1 using only one call to isSubstring(e.g., "waterbottle" is a rotation of "erbottlewat")

## Solution
1. Is Unique
    ```python
    def isUnique(str):
        chars=set()
        for letter in str:
            if letter in chars:
                return False
            chars.add(letter)
        return True
    ```
    without additional data structure
    ```python
    def isUnique(str):
        for i in range(len(str)-1):
            if str[i] in str[i+1]:
                return False
        return True
    ```
2. Check Permutation:
    ```python
    def checkPermutation(str1,str2):
        dct = dict()
        for letter in str1:
            dct[letter] = dct.get(letter,0) + 1
        for letter in str2:
            dct[letter] = dct.get(letter,0) - 1
        return all([dct.values()])
    ```
3. URLify
    ```python
    def URLify(str):
        lst = list(str)
        right = len(str)-1
        left = right
        while left == " ":
            left -= 1
        while left < right:
            if left != " ":
                lst[right] = lst[left]
                right -= 1
                left -=1
            else:
                lst[right] = "0"
                lst[right-1] = "2"
                lst[right-2] = "%"
                right -=3
                left -=1
        return "".join(lst)
    ```
4. is Palindrome Permutation
    ```python
    def isPalindromePermutation(str):
        count = dict()
        for letter in str:
            if letter == " ":
                continue
            count[letter] = count.get(letter,0) + 1
        flag = false
        for val in count.values():
            if val%2 == 0:
                continue
            else:
                if flag:
                    return False
                flag = True
        return True
    ```
5. One Away:
    ```python
    def isOneAway(str1,str2):
        i = len(str1) - 1
        j = len(str2) - 1
        flag = False
        while i >= 0 and j >= 0:
            if str1[i] == str2[j]:
                i -= 1
                j -= 1
                continue
            else:
                if flag:
                    return False
                flag = True
                if str1[i-1] == str2[j]:
                    i -= 2
                    j -= 1
                elif str1[i] == str2[j-1]:
                    i -=1
                    j -=2
                else:
                    i -=1
                    j -=1
        return True
    ```
6. Stirng Compression:
    ```python
    def compressString(str):
        ret = ""
        for i in range(len(str)):
            count = 1
            if i+1 < len(str) and str[i] == str[i+1]:
                count +=1
                continue
            ret += str[i] + str(count)
         if len(ret) == len(str):
            return str
         else:
            return ret
    ```
7. Rotate Matrix:
    ```python
    
    ```
8. Zero Matrix:
    ```python
    def isZeroMatrix(matrix):
        m = len(matrix)
        n = len(matrix[0])
        for i in range(m):
            for j in range(n):
                if matrix[i][j] == 0:
                    matrix = [[0]*n for _ in range(m)]
                    return matrix
        return matrix
    ```
9. String Rotation:
    ```python
    
    ```