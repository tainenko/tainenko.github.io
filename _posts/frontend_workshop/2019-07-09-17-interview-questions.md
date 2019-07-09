---
layout: post
title:  "2019-05-24 F2E workshop Day5"
author: tony
categories: [ workshop, frontend ]
image: assets/images/17Media.png
tags: [workshop, frontend, 17 Media, interview, questions]
---
17 Media面試題


## Pre-Test

[表單登記](https://codesandbox.io/s/dailydrinks-d3izq?fontsize=14)

## Questions
1. Array.map  
Input:
a=[2,5,8,1,5,]  
b=[4,8,2,0,9]  
Output:  
[[2,5],[5,8],[8,2],[1,0],[5,9]]   

    延伸討論：  
    a或b的長度可能會不一樣  
    假如Input有多個Array，a,b,c,d...要怎麼處理。  

1. Hoisting & Closure concept
- output ?
    ```javascript
    for (var i = 0; i < 4; i++){
    
    setTimeout(function(i){
    
    console.log(i);
    
    }, i*1000);
    
    }
    ```
2. Code Review - what's the problem in above code
    ```javascript
    const code = {
    
    login: (account, password) => {
    
    return fetch(`http://domain?account=`${account}&password=`${password}`)
    
    .then(loginInfo => {
    
    this.loginInfo = loginInfo;
    
    })
    
    localStorage.setItem('key', this.loginInfo);
    
    },
    
    logout: () => {
    
    this.loginInfo = null;
    
    localStorage.removeItem('key');
    
    }
    
    }
    
     
    
    document.getElementById('test').addEventListenter('submit', (e) => {
    
    e.preventDefault();
    
     
    
    const { account, password } = e.target;
    
    const { login } = code;
    
     
    
    login(account, password);
    
    });
    
     
    
    document.getElementById('test2').addEventListenter('click', code.logout);
    
    ```
3. CORS & 如果今天不用 Redux 改用React Context的差
4. 解釋Redux Connect 的作用 跟 如果要自己實作一個Redux
5. 比較三大框架優缺點，如何應用至專案
6. style-component

## Solution
1. Array.zip
    ```javascript
    function zip(arr1,arr2) {
        return arr1.map(value,index=>{
            return [ value, arr2[index]];
        })
    }
    ```
    if there were more than 2 arrays in input
    ```javascript
    function zip_short() {
        var args = [].slice.call(arguments);
        var shortest = args.length==0 ? [] : args.reduce(function(a,b){
            return a.length<b.length ? a : b
        });
    
        return shortest.map(function(_,i){
            return args.map(function(array){return array[i]})
        });
    }
    
    // > zip_short([1,2],[11,22],[111,222,333])
    // [[1,11,111],[2,22,222]]]
    
    ```
    ```javascript
    function zip_long() {
        var args = [].slice.call(arguments);
        var longest = args.reduce(function(a,b){
            return a.length>b.length ? a : b
        }, []);
    
        return longest.map(function(_,i){
            return args.map(function(array){return array[i]})
        });
    }
    // > zip_long([1,2],[11,22],[111,222,333])
    // [[1,11,111],[2,22,222],[null,null,333]]
    
    ```
    
    Ref.  
    [javascript equivalent of pythons zip function](https://stackoverflow.com/questions/4856717/javascript-equivalent-of-pythons-zip-function)