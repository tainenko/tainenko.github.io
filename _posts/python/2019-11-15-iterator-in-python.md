---
layout: post
title:  "Iterator in Python"
author: tony
categories: [ python ]
image: assets/images/python/iterators-python.jpg
tags: [python, iterator]
---
# Definition
Iterator is any type of python object that can be used in 'for loop'.
An iterator must implement the following methods:
- **\__iter\__**
- **next** (**\__next\__** in python3)

Python lists, tuples, dicts and sets are all inbuilt iterators.

# Example
Below is a example of python program that create a fibonacci iterator that iterate from 1 to given limit. For example, if limit is 5, then it would print 1, 1, 2, 3, 5. And if limit is less or equal than zero, then it would print nothing.
## \__iter\__
This method is called on initialization of an iterator. It should return a object which has a next or \__next\__ method.

## next ( \__next\__):
The iterator should have a next (\__next\__) method to return the next value for a iterate. The for loop would implicitly call the next (\__next\__) method during the iteration. This method should raise a StopIteration to signal the end of iteration.
```python
class IteratorDemo:
    def __init__(self,limit):
        self.limit=limit
    
    def __iter__(self):
        self.x=0
        self.y=1
        return self
    
    def __next__(self):
        if self.y>self.limit:
            raise StopIteration
        self.x,self.y=self.y,self.x+self.y
        return self.x


``` 
```python
for i in IteratorDemo(5):
    print(i)
```
Output:
```python
1
1
2
3
5
```
```python
for i in IteratorDemo(-1):
    print(i)
# Output nothing
```
