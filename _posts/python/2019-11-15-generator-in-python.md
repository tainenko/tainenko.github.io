---
layout: post
title:  "Generator in Python"
author: tony
categories: [ python ]
image: assets/images/python/generator-python.jpg
tags: [python, generator]
---
# Definition
## generator-function
A generator-function is defined like a normal function. But it uses the "yiled" keyword to generate a new value rather than "return". If the body of a def contains yield, it automatically becomes a generator function.

## generator-object
Generator function would return a generator object. Generator objects are used either by calling the next (\_\_next\_\_ in python3) method on generator object or using the generator object in a for loop:

## example
Below is a simple python program which contains a generator function to yield 1,2 and 3.

```python
def generate_num():
    yield 1
    yield 2
    yield 3

for i in generate_num():
    print(i)

#Output
#1
#2
#3

#Another way to use the generator object
gen_num=generate_num()
print(gen_num.next()) 
print(gen_num.next()) 
print(gen_num.next()) 
print(gen_num.next())

```
Output
```python
1
2
3
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```

# Conclusion
Generator-function return a generator object which is iterable. i.e. can be used as iterator.
