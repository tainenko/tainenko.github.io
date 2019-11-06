---
layout| post
title|  "Javascript - Flatten/Merge Array"
author| tony
categories| [javascript]
image| assets/images/flatten_array.png
tags| [javascript, flatten,array]
---
# Merge/Flatten Array
在 StackOverflow 上看到了一個經典問題 - [Array Flatten](https://stackoverflow.com/questions/10865025/merge-flatten-an-array-of-arrays) ，七年前提問的，但是到15天前還有人回應，引起了我的興趣，那麼就來記錄&實作 Flatten有哪些實現的方法吧。  
![flatten](assets/images/stackoverflow/flatten.png)

# Question
原始的題目是這樣的
有一個嵌套的Array如下，現在想要實現一個 Array 解構的方法，消除掉 Array 裡的層次。
```javascript
//Origin:
[["$6"], ["$12"], ["$25"], ["$25"], ["$18"], ["$22"], ["$10"]]

//After flatten operation
["$6", "$12", "$25", ...]
```

# 實現方法
## 方法1:  concat
```javascript
var arrays = [
  ["$6"],
  ["$12"],
  ["$25"],
  ["$25"],
  ["$18"],
  ["$22"],
  ["$10"]
];
var merged = [].concat.apply([], arrays);

console.log(merged);
//Output
//[
//  "$6",
//  "$12",
//  "$25",
//  "$25",
//  "$18",
//  "$22",
//  "$10"
//]
```
### 討論
concat方法的作用是連結兩個以上的陣列，或是將元素增加到我們想要的陣列內容中。
```javascript
var array1 = ["aaa", "bbb", "ccc"];
var array2 = ["ddd", "eee", "fff"];
console.log(array1.concat(array2));
//Output
// ["aaa", "bbb", "ccc", "ddd", "eee", "fff"]
``` 
apply方法的功能是把 Array 解構成一個個的元素後再傳遞給調用函數。
```javascript
func.apply(thisValue, [arg1, arg2, ...])
// 不考慮thisValue的作用的話，上式與下面的寫法等價
func(arg1, arg2, ...)
```
也就是說，在解法一中的寫法
```javascript
[].concat.apply([], [["$6"], ["$12"], ["$25"], ["$25"], ["$18"], ["$22"], ["$10"]])
//等價於
["$6"].concat(["$12"], ["$25"], ["$25"], ["$18"], ["$22"], ["$10"])
```

## 方法2 Array.prototype.flat()
[flat](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat)是在 ECMA2019 準標內新增的方法。  
使用的方法如下
```javascript
var newArray = arr.flat([depth]);
```
其中depth是你想要flatten的層數，預設為1。

以官方的說明舉例：
```javascript
var arr1 = [1, 2, [3, 4]];
arr1.flat(); 
// [1, 2, 3, 4]

var arr2 = [1, 2, [3, 4, [5, 6]]];
arr2.flat();
// [1, 2, 3, 4, [5, 6]]

var arr3 = [1, 2, [3, 4, [5, 6]]];
arr3.flat(2);
// [1, 2, 3, 4, 5, 6]

var arr4 = [1, 2, [3, 4, [5, 6, [7, 8, [9, 10]]]]];
arr4.flat(Infinity);
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```
## 方法3 遞迴
直接上pseudo code
```javascript
宣告一個array res 存放flatten姞果
Array.forEacch 遍歷目標array
   {
       判斷元素的資料型態是否為Array
       是：
            遞迴呼叫forEach，繼續做flatten
       否：
            直接把元素加到 res 中
   }
```

實作如下
```javascript
const deepFlatten = (arr) => {
  const flatList = [];
  arr.forEach(item => {
    Array.isArray(item)
     ? flatList.push(...deepFlatten(item)) // recursive call
     : flatList.push(item)
  });
  return flatList;
```

