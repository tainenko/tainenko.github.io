---
layout: post
title:  "Learn concurrency mode in Javascript"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.png
tags: [workshop, frontend, javascript, concurrency mode]
---
透過async await setTimeout Promise介紹javascript的運行機制，concurrency mode、event loop、同步任務與異步任務．了解函式運行時背後的邏輯，了解背後運作的原理，我們才可以避免不必要的錯誤產生。

### Example. 以下代碼的輸出結果為何?
```javascript
console.log(1);
setTimeout(function () {
    console.log(2);
}, 0);
console.log(3);
```
Ans. 1 3 2

### Example2 以下代碼的輸出結果為何?
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
Ans.  
script start  
async1 start  
async2  
promise1  
script end  
async1 end   
promise2  
setTimeout  

## Javascript concurrency mode
### 單線程（single threaded）
首先，我們要知道 JavaScript 是單線程（single threaded runtime）的程式語言，所有的程式碼片段都會在堆疊中（stack）被執行，而且一次只會執行一個程式碼片段（one thing at a time）。

### 阻塞（blocking）
當執行程式碼片段需要等待很長一段時間，或好像「卡住」的這種現象，被稱作 阻塞（blocking），假設請求資料的 AJAX Request 變成同步（Synchronous）處理的話，那麼每 request 一次，因為必需等這個函式執行完畢從堆疊（stack）中跳離開後才能往下繼續走，進而導致阻塞的情形產生，以下面的 pseudo code 為例：
```javascript
// pseudo code
var foo = $.getSync('//foo.com')
var bar = $.getSync('//bar.com')
var qux = $.getSync('//qux.com')

console.log(foo)
console.log(bar)
console.log(qux)
```

## Concurrency and Event Loop
避免在javascripty在執行過程中被耗時的操作所阻塞，javascript使用異步處理諸如事件點擊觸發回調函數、ajax函數、setTimeout等非同步的事件．　　

為了要理解 JavaScript 之所以能夠透過非同步的方式（asynchronous）「看起來」一次處理很多事情，我們需要進一步瞭解 Event Loop。
我們之所以可以在瀏覽器中同時（concurrently）處理多個事情，是因為瀏覽器並非只是一個 JavaScript Runtime。
> JavaScript 的執行時期（Runtime）一次只能做一件事，但瀏覽器提供了更多不同的 API 讓我們使用，進而讓我們可以透過 event loop 搭配非同步的方式同時處理多個事項。

任務隊列是一個先進先出的隊列，它裏面存放著各種事件和任務。而event loop 的作用是去監控堆疊（call stack）和工作佇列（task queue），當堆疊當中沒有執行項目的時候，便把佇列中的內容拉到堆疊中去執行。

所有任務可以分成兩種，一種是同步任務（synchronous），另一種是異步任務（asynchronous）。
### 同步任務

同步任務：在主線程上排隊執行的任務，只有前一個任務執行完畢，才能執行後一個任務。　　
- 輸出　如：console.log()
- 變量的聲明
- 同步函數：如果在函數返回的時候，調用者就能夠拿到預期的返回值或者看到預期的效果，那麽這個函數就是同步的。

### 異步任務

- setTimeout和setInterval
- DOM事件
- Promise
- process.nextTick
- fs.readFile
- http.get
- 異步函數：如果在函數返回的時候，調用者還不能夠得到預期結果，而是需要在將來通過一定的手段得到，那麽這個函數就是異步的。

除此之外，任務隊列又分為macro-task（宏任務）與micro-task（微任務），在ES5標準中，它們被分別稱為task與job。
#### 宏任務

- I/O
- setTimeout
- setInterval
- setImmdiate
- requestAnimationFrame

#### 微任務
- process.nextTick
- Promise
- Promise.then
- MutationObserver

#### 宏任務和微任務的執行順序
> 一次事件循環中，先執行宏任務隊列裏的一個任務，再把微任務隊列裏的所有任務執行完畢，再去宏任務隊列取下一個宏任務執行。

註：在當前的微任務沒有執行完成時，是不會執行下一個宏任務的。

## 總結

JavaScript通過事件循環和瀏覽器各線程協調共同實現異步。同步可以保證順序一致，但是容易導致阻塞；異步可以解決阻塞問題，但是會改變順序性。
- 理解JS的單線程的概念：一段時間內做一件事
- 理解任務隊列：同步任務、異步任務
- 理解 Event Loop
- 理解哪些語句會放入異步任務隊列
- 理解語句放入異步任務隊列的時機

更詳盡的內容可以看 Philip Roberts 在 JS Conf 的演講影片 [What the heck is the event loop anyway?](https://pjchender.blogspot.com/2017/08/javascript-learn-event-loop-stack-queue.html) 和 MDN [Concurrency model and Event Loop](https://developer.mozilla.org/en-US/docs/Web/JavaScript/EventLoop)  

有興趣的可以試著做以下兩道練習題　　
```javascript
async function async1() {
    console.log('async1 start');
    await async2();
    setTimeout(function() {
        console.log('setTimeout1')
    },0)
}
async function async2() {
	setTimeout(function() {
		console.log('setTimeout2')
	},0)
}
console.log('script start');

setTimeout(function() {
    console.log('setTimeout3');
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
async function async1() {
   console.log('async1 start')
   await async2()
   console.log('async1 end')
}
async function async2() {
   console.log('async2')
	new Promise((resolve, reject) => {
		console.log('promise3')
		resolve()
	})
	.then(body => {
		console.log('promise4')
	})
}
console.log('script start')
setTimeout(function () {
   console.log('settimeout')
})
async1()
new Promise(function (resolve) {
   console.log('promise1')
   resolve()
}).then(function () {
   console.log('promise2')
})
console.log('script end')

```

Ans.
1  
 ```javascript
    script start
    async1 start
    promise1
    script end
    promise2
    setTimeout3
    setTimeout2
    setTimeout1
 ```
    
 2  
 ```javascript
    script start
    async1 start
    async2
    promise3
    promise1
    script end
    promise4
    async1 end
    promise2
    settimeout
 ```
