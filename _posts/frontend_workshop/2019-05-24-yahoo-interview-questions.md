---
layout: post
title:  "2019-05-24 F2E workshop Day5"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.png
tags: [workshop, frontend, yahoo, interview, questions]
---
Yahoo 前端工程師 面試經驗分享

## 面試流程
1. 請我用英文自介
2. 請我分享過去前端開發經驗
3. 考 Computer Science 基礎問題
4. 考css, javascript
5. 另一位考官考 javascript
6. 詢問其他前端開發會遇到的問題
7. 請我說明碩論的內容
8. 主管介紹Yahoo search team的狀況
9. 很親切的人資姊姊說明薪資結構、福利等等
## 詳細狀況
1. 請我用英文自介：我曾經去歐洲交換過，這個部分對我來說沒問題，算順利。

2. 請我分享過去前端開發經驗： 因為我有和朋友在做 side project ，所以這邊就詳細說明整個網站的系統架構，前後端各用什麼語言框架、資料庫，如何實作搜尋、自動完成等等功能。 我基本上是用 jquery + vue (前端）＆ nodejs with express + mongodb （後端）在做開發。

3. 直接上機考 computer science 基礎問題，及下方面試問題的前兩題 (shuffle & reverse linked list)：以前高中有學過一點程式競賽的東西，幸好都有寫出來。

4. 考css, javascript（第3到第6題）：這個部分爆得有點慘，尤其是 css 的部分我很不熟。

5. 另一位考官考 javascript：主要是考 variable scope, closure, this 再加上 setTimeout 一起運用的問題，滿不好回答的。

6. 詢問其他前端開發會遇到的問題 (第 8 到第 10 題)：以前有用過python scrapy 寫過爬蟲爬新聞網，就盡可能把自己知道的東西說出來。
## 團隊概況
search team 是一個global team，會和全世界其他 search team 的工程師一起負責開發 yahoo 搜尋引擎的功能。所以英文要能夠溝通。
然後因為 yahoo 每天的流量等級是 million scale 的，所以在很多地方需要做不論速度上、記憶體上的最佳化，才能讓使用者有最好的體驗。也會做很多的 A/B test 甚至 bucket test 去測試不同種的方案。
但也因為要最佳化效能，主要是寫純js (vallina js)，沒有用框架。
薪資福利
第一年特休就有15天、每個月1000多得運動補助、每天提供早中餐、飲料零食 bar。工程師配 mac book pro & iphone 7s 一台，還有一個門號。必須說yahoo的工作環境真的很好沒話說。
實際上的薪資不太方便說，因為有承諾不能說出去，跟群暉、聯發科等高薪的職缺是可以比較的。
## 面試題
1. 給你一個長度為Ｎ的陣列，請幫我把它隨機打亂 (shuffle)，要怎麼做到？
2. 給你一個 Linked List ，幫我產生另一個 linked list，但 link 的順序是反過來的 (reverse linked list)
3. 有聽過 reset css 嗎? 那是什麼？
4. RWD怎麼實作? 什麼時候要用RWD?
5. .a .b 這樣子的selector，browser是怎麼實作出來的?
6. js 的 == & === 的差別?
7. variable scope + setTimeOut 去做排程的問題
8. 問到圖片搜尋如何排版
9. 網路爬蟲要如何實作
10. 網路爬蟲如果遇到需要執行js的部分，要怎麼做

### Yahoo!  (search team)
**第一關 Phone Interview**
* Linked List 插入、刪除、搜尋的時間複雜度 (忘記複習一時想不起來QAQ)
* Javascript 基礎知識
* HTML 基礎知識
    * doctype 是啥?
* CSS 基礎知識
      *  resetting 跟 normalizing CSS 差別?
      *  ID 跟 class 差別?
* Linux 問題
     * 如果有個 Process 你要強制關閉，你會怎做?
    * ls command 的替代方案? (驚嚇，但這個有趣)
     * 看CPU, Mermory 等系統狀態?
     * vim 操作

**第二關**

先英文自介，然後就是開始瘋狂的考試 (用一個線上共編平台瘋狂考)

* javasciprt
    * 模擬 OO 的方式 (prototypal inheritance)
   * Scope
    * Clousre
     * Hoisting
* 演算法:
    * 類似矩正翻轉的考題
* CSS:
  * 給你一個破掉的板型，請你修改成正常的樣子 (position)
  * position realtive 跟 absolute 差別
* 一般問題:
  * 有啥辦法提昇網頁的效能，列舉幾個

然後再與 HR 聊天

## 木易楊 前端每日面試題
1. 寫 React / Vue 項目時為什麽要在組件中寫 key，其作用是什麽  
2. ['1', '2', '3'].map(parseInt) what & why ?
3. 什麽是防抖和節流？有什麽區別？如何實現？
4. 介紹下 Set、Map、WeakSet 和 WeakMap 的區別？
5. 介紹下深度優先遍歷和廣度優先遍歷，如何實現？
6. 請分別用深度優先思想和廣度優先思想實現一個拷貝函數？
7. ES5/ES6 的繼承除了寫法以外還有什麽區別？
8. setTimeout、Promise、Async/Await 的區別
9. Async/Await 如何通過同步的方式實現異步
10. 異步筆試題
    
    請寫出下面代碼的運行結果
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

11. 算法手寫題

    已知如下數組：  
    var arr = [ [1, 2, 2], [3, 4, 5, 5], [6, 7, 8, 9, [11, 12, [12, 13, [14] ] ] ], 10];
    編寫一個程序將數組扁平化去並除其中重覆部分數據，最終得到一個升序且不重覆的數組

12. JS異步解決方案的發展歷程以及優缺點。
13. Promise 構造函數是同步執行還是異步執行，那麽 then 方法呢？
14. 情人節福利題，如何實現一個 new

## 資料來源
https://www.goodjob.life/experiences/5980a525185cc200046fe882
https://www.ptt.cc/bbs/Soft_Job/M.1503737150.A.D33.html
https://link.juejin.im/?target=https%3A%2F%2Fgithub.com%2Fyygmind%2Fblog
