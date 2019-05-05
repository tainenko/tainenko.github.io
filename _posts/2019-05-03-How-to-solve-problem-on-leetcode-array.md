---
layout: post
title:  "How to solve problem on leecode - Array"
author: tony
categories: [ Leetcode ]
image: assets/images/18.png
tags: [leetcode, algorithms, data structure, array]
---
## Introduction
The most common way is to traverse the array, manipulating each element. The other approach is to use double Pointers.  

Double pointer, as the name implies, is to use two Pointers to traverse array. Two Pointers is commonly used in an ordered array. We use two pointers left pointer  and right point which traverse the array form head and tail in the mean time. The traversal would be  completed  until the two pointers intersect. Time complexity is O (n).

> 1. Establish one or more indicators.  
> 2. Move the indicator to the target element.  
> 3. manipulated the element.  
> 4. Repeat step 2.3 until you have traversed the entire array.  
## How to use
In general, We will have two pointers: `left` and `right`. They point to the beginning and end of an array, respectively.
```
  left = 0;
  right = len(A)-1
```
The loop termination condition is whether two Pointers meet or one of the pointer traversals completed.
```
  while left<right:
  # do something
      #move the pointers
      if condition:
          left+=1
      else:
          right-=1
```
## Usable range
Double Pointers are commonly used in ordered arrays. (unsorted arrays are also used in some cases.)  
Listed below are some of the common problem of array have (to be added latter)  
### 1. SUM
In this case, if the array is ordered, we can use two Pointers to traverse from front to back, front to move and up, and tail to move and down, respectively. By specific judgment, we can find the specific SUM.  
Time complexity is O (n), if use double loop is O (n ^ 2).  
### 2. in place swap
An in place swap of an array generally requires a double pointer, otherwise adding or removing an element from the array requires moving a large number of elements.  
In this case, it is usually one pointer traversal, the other pointer to find the elements can be used to swap.   

