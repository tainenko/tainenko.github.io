---
layout: post
title:  "Javascript - Arrow function cheat sheet"
author: tony
categories: [ javascript]
image: assets/images/javascript/arrow_func.png
tags: [javascript, cheatsheet,beginer]
---
# Cheatsheet
箭號函數宣告 Cheatsheet
```javascript
//顯式Return, 多行
a => {
    return a
}

//顯式Return, 單行
a => { return a }

//隱式Return, 多行
a => {
    a
}

// 隱式Return, 單行
a => a

// 多參數, 需要括號
(a, b) => a,b
```
# 顯式 V.S. 隱式 回傳
因為箭號函數支持隱式回傳，因此我們有很多種書寫箭號函數的方法。  

在正規的函數宣告裡頭，如果我們要回傳值，必須使用 return 關鍵字，這也被稱作顯式回傳，箭號函數同樣支持傳統的顯式回傳。
除此之外，箭號函數在函數執行完後可以自動回傳值，不需要 return 關鍵字，這被稱為隱式回傳。

舉個例子：
```javascript

Example A: Normal Function
const sayHi = function(name) {
  return name
}

Example B: Arrow Function with Explicit Return
// Multi-line
const sayHi = (name) => {
  return name
}

// Single-line
const sayHi = (name) => { return name }
Example C: Arrow Function with Implicit Return

// Single-line
const sayHi = (name) => name

// Multi-line
const sayHi = (name) => (
  name
)

```
發現了嗎？當你使用大括號 {}，你需要使用 return 關鍵字去定義回傳值，如果你不使用大括號，則箭號函數會隱式回傳。

事實上，這是箭頭函數的語法規則，在大括號 {} 裡頭的是函數主體 block body，也就是傳統的函式宣告語法，必須要使用顯式回傳，而另一種如範例c的被稱為簡潔體 concise body，支持隱式回傳。

# 規則
## 關鍵字 return
- Block body: 關鍵字 return 無法省略
- Concise body: 關鍵字 return 被默認，並且可以省略。

## 括號
在傳統的函數宣告中，括號總是被我們使用。無論如何，在箭號函數宣告時，括號在某些情境下是可以被省略的 - 如果函數只有單一參數。

## 單參數
箭頭函數可省略括號
```javascript
// Normal Function
const numbers = function(one) {}

// Arrow Function, with parentheses
const numbers = (one) => {}

// Arrow Function, without parentheses
const numbers = one => {}

```

## 多參數
一般的函數宣告和箭頭函數，括號都不可省略
```javascript
// Normal Function
const numbers = function(one, two) {}

// Arrow Function, with parentheses
const numbers = (one, two) => {}
```

# 小技項： 回傳Object
需要注意的地方是箭號函數回傳 Object 的語法。還記得我們提到箭號函數以大括號 {} 的格式區別函數主體為 block body 和 concise body 嗎？ 當我們想要用隱式回傳一個 Object 時，要特別小心語法的使用。

舉例來說：
```javascript
const me = () => { name: "Tony" };

me(); // undefined 😱
```
箭號函數沒有正確的回傳我們要的 Object ，不用緊張，讓我們加上括號來修復這個問題。
```javascript
const me = () => ({ name: "Tony" });

me(); // { name: "Tony" } ✅
```
小技巧：
使用簡潔體時，別忘了幫 Object 加上括號。

# Reference
[MDN Web Docs - Arrow functions](https://developer.mozilla.org/zh-TW/docs/Web/JavaScript/Reference/Functions/Arrow_functions)