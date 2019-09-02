---
layout: post
title:  "Python interview questions "
author: tony
categories: [ interviewmpython ]
image: assets/images/python-interview.jpg
tags: [interview,python]
---

微软十五道面试题

1、有一个整数数组，请求出两两之差绝对值最小的值,
记住，只要得出最小值即可，不需要求出是哪两个数。

##############一般解法################

def foo(data1,data2):
   min=abs(data1[0]-data2[0])
    for i indata1:
       for j in data2:
           if abs(i-j)<min:

            min=abs(i-j)
    returnmin

a=[132,43,-1876,565,1]
b=[85,-63443,569,-1899,135]
c=foo(a,b)
print c

#################oneliner#####################

>>>a=[132,43,-1876,565,1]
>>>b=[85,-63443,569,-1899,135]
>>> c=min(abs(i-j) fori in a for j in b)

>>> c
3
这里有一个技巧，[abs(i-j) for i in a for j inb]会生成一个list，使用大量的存储空间，而(abs(i-j) for i in a for j inb)则产生一个生成器。

 

2、写一个函数，检查字符是否是整数，如果是，返回其整数值。（或者：怎样只用4行代码编写出一个从字符串到长整形的函数？）

用python解这题很方便，内置函数isdigit()和int()可以实现：

a=raw_input('a:')
print type(a)
print a.isdigit()
a=int(a)
print type(a)
结果如下：

a:43627856823958612387568912365
<type'str'>
True

<type'long'>

 

3、给出一个函数来输出一个字符串的所有排列。

这题一看就是各种迭代吧，自然想到一个python标准库--itertools：

from itertools import permutations

>>> a='nice'

>>> for element inlist(itertools.permutations(a, 4)):
       print ''.join(element),' ',

nice  niec  ncie  ncei  neic  neci  ince  inec  icne  icen  ienc  iecn  cnie  cnei  cine  cien  ceni  cein  enic  enci  einc  eicn  ecni   ecin

4、给出一个函数来复制两个字符串A和B。字符串A的后几个字节和字符串B的前几个字节重叠
基本思路：

先判断两个字符串长度，再使用内置函数a.endswith()或b.startswith()寻找重叠部分。

a='abcdefghijklmnop'
b='ijklmnopqrstuvwxyz'
minlen=min(len(a),len(b))
i=0
while i:

    ifa.endswith(b[:i+1]):
       break
    else:
       i+=1
if i== minlen:
   newstr=a+b
else:
   newstr=a+b[i+1:]
print newstr

5、怎样编写一个程序，把一个有序整数数组放到二叉树中？

6、怎样从顶部开始逐层打印二叉树结点数据？请编程。

Python的二叉树还没有研究过。。。先放一下。。。

7、怎样把一个链表掉个顺序（也就是反序，注意链表的边界条件并考虑空链表）？
使用内置reverse（）函数或者使用a[-1::-1]都可以

8、请编写能直接实现int atoi(const char *pstr)函数功能的代码。

不适用int（）函数。考虑两种情况：输入‘1234’，输出1234；输入‘1234.56’，输出‘1234’。

‘1’肿么转换成1？ord('1')-ord('0')

def my_atoi(data):
   integer=data.split('.')[0]
   result=0
    for i,ele inenumerate(integer):
       result+=(ord(ele)-ord('0'))*10**(len(integer)-i-1)
    returnresult

a='1234'
b='1234.56'
print my_atoi(a)
print my_atoi(b)

10、在排序数组中，找出给定数字的出现次数
比如 [1, 2, 2, 2, 3] 中2的出现次数是3次。

内置函数count()

11、平面上N个点，每两个点都确定一条直线，
求出斜率最大的那条直线所通过的两个点（斜率不存在的情况不考虑）。时间效率越高越好。

同样使用itertools库，方便的两两组合N个点

from itertools import combinations
A=(1,4)
B=(2,1)
C=(4,3)
D=(5,5)
E=(8,2)
name='ABCDE'
pos=[A,B,C,D,E]
name_com=combinations(name,2)
pos_com=combinations(pos,2)

def cal_rate(data1,data2):
    return(data1[1]-data2[1])/(data1[0]-data2[0])

rates=[]
for ele in list(pos_com):
   rates.append(cal_rate(ele[0],ele[1]))

print rates
print rates.index(max(rates))
print list(name_com)[rates.index(max(rates))]
运行结果：

[-3, -1, 0, -1, 1, 1, 0, 2, -1, -1]
7
('C','D')   

12、一个整数数列，元素取值可能是0~65535中的任意一个数，相同数值不会重复出现。0是例外，可以反复出现。
请设计一个算法，当你从该数列中随意选取5个数值，判断这5个数值是否连续相邻。
注意：
- 5个数值允许是乱序的。比如： 8 7 5 0 6
- 0可以通配任意数值。比如：8 7 5 0 6 中的0可以通配成9或者4
- 0可以多次出现。
- 复杂度如果是O(n2)则不得分。

我的思路：不管有几个零，非零整数两两之差最大值小于等于4。因此做一次循环，求出数列中的最大值和最小值，两者相减即可。这里需要考虑的细节是求出去零以外的最小值以及数列如果全零的情况。

a=[1,4,5,2,3]
b=[0,0,0,0,0]
c=[6,1,0,2,5]
d=[4,0,7,8,0]

def foo(data):
   maxint=max(data)
   minint=maxint
    ifminint==0:
       return True
    else:
        for i in data:
           if i<minint:

               minint=i
    ifmaxint-minint<=4:
       return True
    else:
       return False
   
print foo(a)  #True
print foo(b)  #True
print foo(c)  #False
print foo(d)  #False

其实这里还有一个问题，如何产生随机数列，且零能重复，其他数字不能重复。

from random import randint
array=[]
while len(array)<=5:
   x=randint(0,65535)
    if x==0 or xnot in array:
       array.append(x)

13、设计一个算法，找出二叉树上任意两个结点的最近共同父结点。
复杂度如果是O(n2)则不得分。

14、一棵排序二叉树，令 f=(最大值+最小值)/2，
设计一个算法，找出距离f值最近、大于f值的结点。
复杂度如果是O(n2)则不得分。

又是二叉树，待我研究研究再整理一个二叉树专题。

15、一个整数数列，元素取值可能是1~N（N是一个较大的正整数）中的任意一个数，相同数值不会重复出现。
设计一个算法，找出数列中符合条件的数对的个数，满足数对中两数的和等于N+1。
复杂度最好是O(n)，如果是O(n2)则不得分。

同样使用from itertools import combinations，代码就不写了。

