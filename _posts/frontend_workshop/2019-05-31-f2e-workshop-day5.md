---
layout: post
title:  "2019-05-31 F2E workshop Day"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.jpg
---

## Yahoo筆試
- js 的 == & === 的差別?
  
- Linked List 插入、刪除、搜尋的時間複雜度 
插入 O(1)
刪除 O(1)
搜尋 O(n)

## 請寫出下面代碼的運行結果
1. async await setTimeout
    ```javascript
    async function async1() {
        console.log('async1 start');
        await async2();
        console.log('async1 end');           
    }
    async function async2() {
        console.log('async2');
    }
    console.log('script start');
    setTimeout(function() {
        console.log('setTimeout');
    }, 0)
    async1();
    new Promise(function(resolve) {
        console.log('promise1');
        resolve();
    }).then(function() {
        console.log('promise2');
    });
    console.log('script end');
    
    ```
    ```javascript
    //william yang's solution
    console.log('script start');
    console.log('async1 start');
    console.log('script end');
    console.log('promise1');
    console.log('setTimeout');
     console.log('async2');
    console.log('async1 end');   
    console.log('promise2');
    
    //
    script start
    async1 start
    async2
    promise1
    script end
    promise2
    setTimeout
    async1 end
    
    ```

2. Object
    ```javascript {.line-numbers}
    var a = {};b = {key:'b'};c = {key:'c'};a[b] = 123;a[c] = 456;console.log(a[b]);
    
    ```
    Solution
    ```javascript
    //console.log(a[b])
    456
    ```

3. setTimeout
    ```javascript {.line-numbers}
    console.log("a");
    setTimeout(()=>{
        console.log("b")
    },0);
    while(1){}
    ```
    Solution
    ```javascript
    a
    ```
