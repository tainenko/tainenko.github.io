---
layout: post
title:  "2019-05-10 F2E workshop Day4"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.png
tags: [workshop, frontend]
---
Day4 討論內容: 
- 費氏數列遞迴&迭代解
- setTimeout面試題
- 頁面渲染過程

```javascript
/**
509. Fibonacci Number
Easy

Share
The Fibonacci numbers, commonly denoted F(n) form a sequence,
called the Fibonacci sequence,
such that each number is the sum of the two preceding ones,
starting from 0 and 1. That is,

F(0) = 0,   F(1) = 1
F(N) = F(N - 1) + F(N - 2), for N > 1.
Given N, calculate F(N).

 
///////地回
function fibonacci(n){
if(n<1){return 0}
else if(n<=2){return 1}
else {return fibonacci(n-1)+fibonacci(n-2) }
}




Example 1:

Input: 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
Example 2:

Input: 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
Example 3:

Input: 4
Output: 3
Explanation: F(4) = F(3) + F(2) = 2 + 1 = 3.
 

Note:

0 ≤ N ≤ 30.


 * @param {number} N
 * @return {number}
 */
Example: [0 1 1 2 3 5 ...]
var fib = function(N) {
    //recursive
  if(N<1){
    return 0;
  }else if(N<=2){
    return 1;
  }else {
    return fib(N-1)+fib(N-2);
  }
};


var fib = function(N) {
  //loop
  var temp = [0,1,1];
  for(var i = 3; i <= N; i++) {
    // F(N) = F(N - 1) + F(N - 2)
    temp.push(temp[i-1] + temp[i-2]);
  }
  return temp[N];
  
  if(N<2){
    return N;
  }
  var curr,prev=1,0;
  for(i=2;i<n;i++){
    [curr,prev]=[curr+prev,curr];
  }
  return curr;
  
};

var fib = function(N) {
    //Recursive Optimization
  
   if(N<2){
    return N;
   }else {
    var arr=[];
    var map = new Map();
     if(map.has(N-1)){
       
     }
    return fib(N-1)+fib(N-2);
  }
};


//Timeout
以下程式碼會列印出什麼？
for (var i = 1; i <= 5; i++) {
  setTimeout( function timer() {
      console.log(i);
  }, i * 1000 );
}
this.
this.

~~~~
for (var i = 1; i <= 5; i++) {
    setTimeout(function(i) {
      console.log(i);
    }, i * 1000,i);
  }
~~~~
  
文碩:6 6 6 6 6
昀生:6 6 6 6 6
Tyson:6 6 6 6 6


//Timeout part2
console.log(1);
setTimeout(()=>{
    console.log(3)
},0);
console.log(2);
文碩:1 2 3
昀生: 123~
Tyson:1 2 3

1. Ajax是什麽? 如何創建一個Ajax？ 
2. 頁面渲染過程。
3. 前端優化


```