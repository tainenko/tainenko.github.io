---
layout: post
title:  "Cracking the front-end interview"
author: tony
categories: [ Frontend,Interview ]
image: assets/images/19.gif
tags: [frontend,interview, javascript]
---
## 摘要
此文章紀錄了前端學習過程的資源，包含以下項目：
- 如何學習javascipt、css、html
- 網路上的面試心得分享
- 前端面試考題(含筆試與概念)

## 前端工程師面試問題集

以下是前端開發的面試問題，可以用來審查一個有潛力的面試者。這並不是建議你對同一個面試者問上所有的問題 (那會花費好幾小時)。從列表中挑幾個題目，應該就能幫助你審查面試者是否擁有你需要的技能。

在你準備前端面試之前，[Rebecca Murphey](http://rmurphey.com/) 的 [Baseline For Front-End Developers](http://rmurphey.com/blog/2012/04/12/a-baseline-for-front-end-developers/) 也是一篇很棒且值得讀的文章。

**註意：** 請記住一點，很多問題都是隨情況而變化，能引發很多有趣的討論，比直接的標準答案更能讓你瞭解此人的能力。

### 常見問題：

- 你昨天或這週學習了什麼？
- 寫程式的哪部份最讓你感到很興奮或是有興趣？
- 說說你喜好的開發環境 (作業系統, 編輯器, 瀏覽器, 開發工具 … 之類)
- 你可以描述你在開發一個網站時的工作流程嗎？
- 你可以描述漸進增強 (progressive enhancement) 和優美退化 (graceful degradation) 間的差異嗎？
    - 加分題：描述這兩項的特色？
- 描述什麼是"Semantic HTML"？
- 你怎麼優化一個網站的靜態檔案 (assets) 和資源 (resources)？
	- 可能的解決方法包含如下：
		- File concatenation (檔案合併)
		- File minification (最小化文檔)
		- CDN Hosted (CDN託管)
		- Caching (快取)
		- …之類
- 為什麼用多個域名來放置網站資源會比較好？
	- 瀏覽器一次能在同一個域名下載多少資源？
- 說出三種能加快網頁讀取速度的方法？ (感覺上的速度或是真正的讀取時間)
- 如果你加入了一個專案，但是他們的程式碼用tabs，但是你習慣用spaces (空白鍵)，你會怎麼做？
	- 建議此專案使用，例如：EditorConfig (http://editorconfig.org)
	- 訂定一個公約 (保持一致)
	- `issue :retab! command` (retab! 在vim中用來把所有spaces換成tabs)
- 寫一個簡易的投影片頁面
	- 加分如果沒有用到 JavaScript
- 你用什麼工具來測試你的程式碼效能？
	- Profiler, [JSPerf](http://jsperf.com/), [Dromaeo](http://dromaeo.com/)
- 如果今年你能精通一項技術，那會是什麼？
- 描述標準和製定標準機構的重要性？
- 什麼是 FOUC？ 你怎麼避免 FOUC?

### HTML 規格問題集:

- `doctype` 做什麼用的？
- standards mode 和 quirks mode 有什麼不同？
- 使用 XHTML 有什麼限制？?
	- 如果網頁使用 `application/xhtml+xml` 會有問題嗎？
- 你怎麼做一個需要支持多國語言的網頁？
	- 當開發和設計一個多國語言網站時，有什麼需要小心的？
- `data-` 屬性的好處在哪？
- 考慮 HTML5 作為一個開放式的網站平台。HTML5 的 building blocks 有哪些？
- 請描述 cookies, sessionStorage 和 localStorage 的不同？

### JS 規格問題集

- 描述 event delegation
- 描述 `this` 如果運作在 JavaScript 中
- 描述 prototypal inheritance 如何運作？
- 你如何測試你的 JavaScript？
- AMD vs. CommonJS?
- 什麼是 hashtable?
- 什麼是  `undefined` 和 `undeclared` 變數？
- 什麼是 closure, 如何/為什麼使用?
	- 你最喜愛並習慣用的 pattern 是怎樣的? argyle (Only applicable to IIFEs)
- anonymous functions 典型的使用時機？
- 描述 "JavaScript module pattern"，你什麼情況會用到？
	- 加分題：清楚地提到 namespacing.
	- 如果你的 module 沒有命名空間怎辦？
- 你如何架構你的程式碼？ (module pattern, classical inheritance?)
- host objects 和 native objects 有何不同？
- 有何不同:
```javascript
function Person(){} var person = Person() var person = new Person()
```
- `.call` 和 `.apply` 有何不同？
- 描述 `Function.prototype.bind`?
- 你什麼時候優化你的程式？
- 你可以描述 inheritance 如何運作在 JavaScript？
- 你什麼情況會使用 `document.write()`？
	- 多數的廣告產生仍然使用 `document.write()` 雖然這樣用會令人皺眉
- feature detection, feature inference, 和使用 UA string 有什麼不同？
- 盡可能的詳述描述 AJAX
- 描述 JSONP 如何運作 (且為何它不是真正的 AJAX)
- 你是用過 JavaScript templating (樣板) ？
	- 如果有的話，你有用過哪些 libraries？ (Mustache.js, Handlebars … 等)
- 描述 "hoisting"
- 描述 event bubbling.
- "attribute" 和 "property" 的不同？
- 為什麼擴展 JavaScript 內建的 objects 不是個好方法？
- 為什麼擴展 JavaScript 插件是個好方法？
- document load event 和 document ready event 有什麼不同？
- `==` 和 `===` 有什麼不同？
- 描述你如何取得一個 query string 的 parameter 從瀏覽器的網址列。
- 描述 JavaScript 的 same-origin policy (同源策略)
- 描述 JavaScript 的 inheritance patterns (繼承模式)
- 實作如下程式:
```javascript
[1,2,3,4,5].duplicate(); // [1,2,3,4,5,1,2,3,4,5]
```
- 描述一個 memoization (避免重複運算) 的策略  在 JavaScript 中
- Ternary expression 怎麼來的, "Ternary" 的意思是什麼？
- function 的 arity 是什麼？
- 什麼是 `"use strict";`? 使用他的優點和缺點是什麼？

### JS 程式範例：

```javascript
~~3.14
```
問: 上述的statement(陳述式)會回傳什麼？
--答: 3--

```javascript
"i'm a lasagna hog".split("").reverse().join("");
```
問: 上述的statement(陳述式)會回傳什麼？
--答: "goh angasal a m'i"--

```javascript
( window.foo || ( window.foo = "bar" ) );
```
問:  window.foo 的值是什麼？
--答: "bar"--
只有在 window.foo 是 falsey 時會回傳此答案，否則的話會回傳window.foo

```javascript
var foo = "Hello"; (function() { var bar = " World"; alert(foo + bar); })(); alert(foo + bar);
```
問: 上述的兩個alerts的結果會是什麼？
--答: "Hello World" & ReferenceError: bar is not defined--

```javascript
var foo = [];
foo.push(1);
foo.push(2);
```

問: foo.length 的值是什麼？
--答： `2`

```javascript
var foo = {};
foo.bar = 'hello';
```
問: foo.length 的值是什麼？
--答： `undefined`

### jQuery 規格問題集：

- 描述 "chaining"
- 描述 "deferreds"
- 你知道哪些實作 jQuery 的優化方式？
- `.end()` 做些什麼？
- 如何給一個綁定的 event handler 命名空間？為什麼這樣做？
- 說出四種可以傳到 jQuery 方法的值
	- Selector (string), HTML (string), Callback (function), HTMLElement, object, array, element array, jQuery Object … 等。
- 什麼是 effects (or fx) queue?
- `.get()`, `[]`, 和 `.eq()` 有何不同？
- `.bind()`, `.live()`, 和 `.delegate()` 有何不同？
- `$` 和 `$.fn` 有何不同？ 或什麼是 `$.fn`？
- 優化這個 selector:
```javascript
$(".foo div#bar:eq(0)")
```
- 'delegate()' 和 'live()' 有何不同？


### CSS 規格問題集：

- 描述 "reset" 在 CSS 中做什麼, 如何用？
- 描述 Floats 並解釋如何運作
- 有哪些不同的 clearing 技術？哪個適用在哪種內容上？
- 描述 CSS sprites, 你如何實作在網頁或網站上？
- 你最喜愛的圖片取代技術是什麼？你什麼時候會用到？
- CSS 屬性 hacks, 也條件引用 .css 檔案, 或是… 其他的？
- 你怎麼讓你的網頁支援有功能限制的瀏覽器？
	- 你會使用什麼樣的技術/流程 ？
- 有什麼方法來隱藏網頁的內容？ (只顯示在 screen readers)？
- 你使用過 grid system 嗎？如果有的話？你較推薦哪個？
- 你曾經實作 media queries 或是 mobile specific (手機規格的) layouts/CSS?
- 你熟悉任何有關 SVG 嗎？
- 你如何優化你的網頁以利於列印？
- 在寫高效的 CSS 時，有什麼要註意的？
- 使用 CSS preprocessors 的優點和缺點是什麼？ (SASS, Compass, Stylus, LESS)
	- 如果是這樣, 描述你使用過的喜歡和不喜歡的 CSS preprocessors
- 你如何使用非標準字體來實作網頁設計？
	- Webfonts (font services 像是: Google Webfonts, Typekit …等等)
- 姐是瀏覽器如何按照 CSS selector 找到對應的element？

### 可選的有趣問題：

- 你寫過最酷的程式是什麼？你最自豪的是什麼？
- 你使用的開發工具中，你最喜歡的部分是什麼？
- 你有任何的 pet projects (個人開發的小專案)？ 什麼樣的？
- 你最喜歡 IE 瀏覽器的什麼特點？


## 面試心得
[前端面試心得 (2018/11) KKstream, Oath, MIT jobs 快速面試](https://linyencheng.github.io/2018/11/12/thinking-interview/)
[2018 前端工程師面試心得](https://medium.com/@weihanglo/2018-%E5%89%8D%E7%AB%AF%E5%B7%A5%E7%A8%8B%E5%B8%AB%E9%9D%A2%E8%A9%A6%E5%BF%83%E5%BE%97-125e633db3a2)
[前端工程師面試心得 | Frontend Engineer interview](https://iandays.com/2018/03/25/interview/index.html)
[木易楊 高級前端進階](https://github.com/yygmind/blog)

## 知名企業面試題整理
主要整理各大公司的線上測驗難度和白板題。

### Hahow 好學校
#### 線上測驗
RemoteInterview.io30分鐘3題。  難度約leetcode easy，有考closuret概念。
#### 白板題
array

### Appier 沛星科技
#### on-site
- 原型鍊的觀念
- 解釋 CORS
- 爲什麼送 request 伺服器沒收到 cookies（因爲沒有加 withCredentials）
- 何謂 third-party cookies

### Yahoo
#### phone
電話面試題目:
網頁載入流程、display all type、Cookie localstorage sessionstorage、CSS box model、Javasctipt Event loop、settimeout原理、CORS 處理、Promise 原理、功能
#### on-site
- 求質數，input一個數字，return 小於input數字的所有質數.
- Css - 排版、selector、box-modal、border box-sizing
- js - event loop、this、eettimeout、hosisting、let 命名function 處理 hoisting
- react - HOC high order component、state prop、Stateless component
- Es6 - 介紹es6新功能、Promise

### KKbox
#### 線上測驗
codity，第一題是array處理、第二題debug、第三題ajax處理畫面，作答時間2小時。

#### on-site
簡報面試，題目是優化曾經寫過的code。

### 阿裏
- 使用過的koa2中間件
- koa-body原理
- 介紹自己寫過的中間件
- 有沒有涉及到Cluster
- 介紹pm2
- master掛了的話pm2怎麽處理
- 如何和MySQL進行通信
- React聲明周期及自己的理解
- 如何配置React-Router
- 路由的動態加載模塊
- 服務端渲染SSR
- 介紹路由的history
- 介紹Redux數據流的流程
- Redux如何實現多個組件之間的通信，多個組件使用相同狀態如何進行管理
- 多個組件之間如何拆分各自的state，每塊小的組件有自己的狀態，它們之間還有一些公共的狀態需要維護，如何思考這塊
- 使用過的Redux中間件
- 如何解決跨域的問題
- 常見Http請求頭
- 移動端適配1px的問題
- 介紹flex布局
- 其他css方式設置垂直居中
- 居中為什麽要使用transform（為什麽不使用marginLeft/Top）
- 使用過webpack裏面哪些plugin和loader
- webpack裏面的插件是怎麽實現的
- dev-server是怎麽跑起來
- 項目優化
- 抽取公共文件是怎麽配置的
- 項目中如何處理安全問題
- 怎麽實現this對象的深拷貝

### 網易
- 介紹redux，主要解決什麽問題
- 文件上傳如何做斷點續傳
- 表單可以跨域嗎
- promise、async有什麽區別
- 搜索請求如何處理（防抖）
- 搜索請求中文如何請求
- 介紹觀察者模式
- 介紹中介者模式
- 觀察者和訂閱-發布的區別，各自用在哪裏
- 介紹react優化
- 介紹http2.0
- 通過什麽做到並發請求
- http1.1時如何覆用tcp連接
- 介紹service worker
- 介紹css3中position:sticky
- redux請求中間件如何處理並發
- 介紹Promise，異常捕獲
- 介紹position屬性包括CSS3新增
- 瀏覽器事件流向
- 介紹事件代理以及優缺點
- React組件中怎麽做事件代理
- React組件事件代理的原理
- 介紹this各種情況
- 前端怎麽控制管理路由
- 使用路由時出現問題如何解決
- React怎麽做數據的檢查和變化

### 滴滴
- react-router怎麽實現路由切換
- react-router裏的<Link>標簽和<a>標簽有什麽區別
- <a>標簽默認事件禁掉之後做了什麽才實現了跳轉
- React層面的性能優化
- 整個前端性能提升大致分幾類
-   import { Button } from 'antd' ，打包的時候只打包button，分模塊加載，是怎麽做到的
-   使用import時，webpack對node_modules裏的依賴會做什麽
- JS異步解決方案的發展歷程以及優缺點
- Http報文的請求會有幾個部分
- cookie放哪裏，cookie能做的事情和存在的價值
- cookie和token都存放在header裏面，為什麽只劫持前者
- cookie和session有哪些方面的區別
- React中Dom結構發生變化後內部經歷了哪些變化
- React掛載的時候有3個組件，textComponent、composeComponent、domComponent，區別和關系，Dom結構發生變化時怎麽區分data的變化，怎麽更新，更新怎麽調度，如果更新的時候還有其他任務存在怎麽處理
- key主要是解決哪一類的問題，為什麽不建議用索引index（重繪）
- Redux中異步的請求怎麽處理
- Redux中間件是什麽東西，接受幾個參數（兩端的柯裏化函數）
- 柯裏化函數兩端的參數具體是什麽東西
- 中間件是怎麽拿到store和action，然後怎麽處理
- state是怎麽註入到組件的，從reducer到組件經歷了什麽樣的過程
- koa中response.send、response.rounded、response.json發生了什麽事，瀏覽器為什麽能識別到它是一個json結構或是html
- koa-bodyparser怎麽來解析request
-   webpack整個生命周期，loader和plugin有什麽區別
-   介紹AST（Abstract Syntax Tree）抽象語法樹
- 安卓Activity之間數據是怎麽傳遞的
- 安卓4.0到6.0過程中WebView對js兼容性的變化
- WebView和原生是如何通信
- 跨域怎麽解決，有沒有使用過Apache等方案

### 今日頭條
- 對async、await的理解，內部原理
- 介紹下Promise，內部實現
-   清除浮動
-   定位問題（絕對定位、相對定位等）
- 從輸入URL到頁面加載全過程
- tcp3次握手
- tcp屬於哪一層（1 物理層 -> 2 數據鏈路層 -> 3 網絡層(ip)-> 4 傳輸層(tcp) -> 5 應用層(http)）
- redux的設計思想
- 接入redux的過程
- 綁定connect的過程
- connect原理
-   webpack介紹
- == 和 ===的區別，什麽情況下用相等==
- bind、call、apply的區別
- 動畫的了解
- 介紹下原型鏈（解決的是繼承問題嗎）
- 對跨域的了解

有讚
- Linux 754 介紹
- 介紹冒泡排序，選擇排序，冒泡排序如何優化
- transform動畫和直接使用left、top改變位置有什麽優缺點
- 如何判斷鏈表是否有環
- 介紹二叉搜索樹的特點
- 介紹暫時性死區
- ES6中的map和原生的對象有什麽區別
- 觀察者和發布-訂閱的區別
- react異步渲染的概念,介紹Time Slicing 和 Suspense
- 16.X聲明周期的改變
- 16.X中props改變後在哪個生命周期中處理
- 介紹純函數
- 前端性能優化
- pureComponent和FunctionComponent區別
- 介紹JSX
- 如何做RN在安卓和IOS端的適配
- RN為什麽能在原生中繪制成原生組件（bundle.js）
- 介紹虛擬DOM
- 如何設計一個localStorage，保證數據的實效性
- 如何設計Promise.all()
- 介紹高階組件
- sum(2, 3)實現sum(2)(3)的效果
- react性能優化
- 兩個對象如何比較

### 挖財
- JS的原型
- 變量作用域鏈
- call、apply、bind的區別
- 防抖和節流的區別
- 介紹各種異步方案
- react生命周期
- 介紹Fiber
- 前端性能優化
- 介紹DOM樹對比
- react中的key的作用
- 如何設計狀態樹
- 介紹css，xsrf
- http緩存控制
- 項目中如何應用數據結構
- native提供了什麽能力給RN
- 如何做工程上的優化
- shouldComponentUpdate是為了解決什麽問題
- 如何解決props層級過深的問題
- 前端怎麽做單元測試
-   webpack生命周期
-   webpack打包的整個過程
-   常用的plugins
- pm2怎麽做進程管理，進程掛掉怎麽處理
- 不用pm2怎麽做進程管理

### 滬江
- 介紹下瀏覽器跨域
- 怎麽去解決跨域問題
- jsonp方案需要服務端怎麽配合
- Ajax發生跨域要設置什麽（前端）
- 加上CORS之後從發起到請求正式成功的過程
- xsrf跨域攻擊的安全性問題怎麽防範
- 使用Async會註意哪些東西
- Async裏面有多個await請求，可以怎麽優化（請求是否有依賴）
- Promise和Async處理失敗的時候有什麽區別
- Redux在狀態管理方面解決了React本身不能解決的問題
- Redux有沒有做過封裝
- react生命周期，常用的生命周期
- 對應的生命周期做什麽事
- 遇到性能問題一般在哪個生命周期裏解決
- 怎麽做性能優化（異步加載組件...）
- 寫react有哪些細節可以優化
- React的事件機制（綁定一個事件到一個組件上）
- 介紹下事件代理，主要解決什麽問題
- 前端開發中用到哪些設計模式
- React/Redux中哪些功能用到了哪些設計模式
- JS變量類型分為幾種，區別是什麽
- JS裏垃圾回收機制是什麽，常用的是哪種，怎麽處理的
- 一般怎麽組織CSS（Webpack）

### 餓了麽
- 小程序裏面開頁面最多多少
- React子父組件之間如何傳值
- Emit事件怎麽發，需要引入什麽
- 介紹下React高階組件，和普通組件有什麽區別
- 一個對象數組，每個子對象包含一個id和name，React如何渲染出全部的name
- 在哪個生命周期裏寫
- 其中有幾個name不存在，通過異步接口獲取，如何做
- 渲染的時候key給什麽值，可以使用index嗎，用id好還是index好
-   webpack如何配sass，需要配哪些loader
-   配css需要哪些loader
- 如何配置把js、css、html單獨打包成一個文件
-   div垂直水平居中（flex、絕對定位）
- 兩個元素塊，一左一右，中間相距10像素
- 上下固定，中間滾動布局如何實現
- [1, 2, 3, 4, 5]變成[1, 2, 3, a, b, 5]
- 取數組的最大值（ES5、ES6）
- apply和call的區別
- ES5和ES6有什麽區別
- some、every、find、filter、map、forEach有什麽區別
- 上述數組隨機取數，每次返回的值都不一樣
- 如何找0-5的隨機數，95-99呢
- 頁面上有1萬個button如何綁定事件
- 如何判斷是button
- 頁面上生成一萬個button，並且綁定事件，如何做（JS原生操作DOM）
- 循環綁定時的index是多少，為什麽，怎麽解決
- 頁面上有一個input，還有一個p標簽，改變input後p標簽就跟著變化，如何處理
- 監聽input的哪個事件，在什麽時候觸發

### 攜程
- 手寫兩道算法題
- 對React看法，有沒有遇到一些坑
- 對閉包的看法，為什麽要用閉包
- 手寫數組去重函數
- 手寫數組扁平化函數
- 介紹下Promise的用途和性質
- Promise和Callback有什麽區別
- React生命周期

### 喜馬拉雅
- ES6新的特性
- 介紹Promise
- Promise有幾個狀態
- 說一下閉包
- React的生命周期
- componentWillReceiveProps的觸發條件是什麽
- React16.3對生命周期的改變
- 介紹下React的Filber架構
- 畫Filber渲染樹
- 介紹React高階組件
- 父子組件之間如何通信
- Redux怎麽實現屬性傳遞，介紹下原理
- React-Router版本號
- 網站SEO怎麽處理
- 介紹下HTTP狀態碼
- 403、301、302是什麽
- 緩存相關的HTTP請求頭
- 介紹HTTPS
- HTTPS怎麽建立安全通道
- 前端性能優化（JS原生和React）
- 用戶體驗做過什麽優化
- 對PWA有什麽了解
- 對安全有什麽了解
- 介紹下數字簽名的原理
- 前後端通信使用什麽方案
- RESTful常用的Method
- 介紹下跨域
- Access-Control-Allow-Origin在服務端哪裏配置
- csrf跨站攻擊怎麽解決
- 前端和後端怎麽聯調

### 兌吧
- localStorage和cookie有什麽區別
- CSS選擇器有哪些
- 盒子模型，以及標準情況和IE下的區別
- 如何實現高度自適應
- prototype和——proto——區別
- _construct是什麽
- new是怎麽實現的
- promise的精髓，以及優缺點
- 如何實現H5手機端的適配
- rem、flex的區別（root em）
- em和px的區別
- React聲明周期
- 如何去除url中的#號
- Redux狀態管理器和變量掛載到window中有什麽區別
- webpack和gulp的優缺點
- 如何實現異步加載
- 如何實現分模塊打包（多入口）
- 前端性能優化（1js css；2 圖片；3 緩存預加載； 4 SSR； 5 多域名加載；6 負載均衡）
- 並發請求資源數上限（6個）
- base64為什麽能提升性能，缺點
- 介紹webp這個圖片文件格式
- 介紹koa2
- Promise如何實現的
- 異步請求，低版本fetch如何低版本適配
- ajax如何處理跨域
- CORS如何設置
- jsonp為什麽不支持post方法
- 介紹同源策略
- React使用過的一些組件
- 介紹Immuable
- 介紹下redux整個流程原理
- 介紹原型鏈
- 如何繼承

### 微醫
- 介紹JS數據類型，基本數據類型和引用數據類型的區別
- Array是Object類型嗎
- 數據類型分別存在哪裏
- var a = {name: "前端開發"}; var b = a; a = null那麽b輸出什麽
- var a = {b: 1} 存放在哪裏
- var a = {b: {c: 1}}存放在哪裏
- 棧和堆的區別
- 垃圾回收時棧和堆的區別
- 數組裏面有10萬個數據，取第一個元素和第10萬個元素的時間相差多少
- 棧和堆具體怎麽存儲
- 介紹閉包以及閉包為什麽沒清除
- 閉包的使用場景
- JS怎麽實現異步
- 異步整個執行周期
- Promise的三種狀態
- Async/Await怎麽實現
- Promise和setTimeout執行先後的區別
- JS為什麽要區分微任務和宏任務
- Promise構造函數是同步還是異步執行，then呢
- 發布-訂閱和觀察者模式的區別
- JS執行過程中分為哪些階段
- 詞法作用域和this的區別
- 平常是怎麽做繼承
- 深拷貝和淺拷貝
- loadsh深拷貝實現原理
- ES6中let塊作用域是怎麽實現的
- React中setState後發生了什麽
- setState為什麽默認是異步
- setState什麽時候是同步的
- 為什麽3大框架出現以後就出現很多native（RN）框架（虛擬DOM）
- 虛擬DOM主要做了什麽
- 虛擬DOM本身是什麽（JS對象）
- 304是什麽
- 打包時Hash碼是怎麽生成的
- 隨機值存在一樣的情況，如何避免
-   使用webpack構建時有無做一些自定義操作
-   webpack做了什麽
- a，b兩個按鈕，點擊aba，返回順序可能是baa，如何保證是aba（Promise.then）
- node接口轉發有無做什麽優化
- node起服務如何保證穩定性，平緩降級，重啟等
- RN有沒有做熱加載
- RN遇到的兼容性問題
- RN如何實現一個原生的組件
- RN混原生和原生混RN有什麽不同
- 什麽是單頁項目
- 遇到的覆雜業務場景
- Promise.all實現原理

### 寺庫
- 介紹Promise的特性，優缺點
- 介紹Redux
- RN的原理，為什麽可以同時在安卓和IOS端運行
- RN如何調用原生的一些功能
- 介紹RN的缺點
- 介紹排序算法和快排原理
- 堆和棧的區別
- 介紹閉包
- 閉包的核心是什麽
- 網絡的五層模型
- HTTP和HTTPS的區別
- HTTPS的加密過程
- 介紹SSL和TLS
- 介紹DNS解析
- JS的繼承方法
- 介紹垃圾回收
- cookie的引用為了解決什麽問題
- cookie和localStorage的區別
- 如何解決跨域問題
- 前端性能優化

### 寶寶樹
- 使用canvas繪圖時如何組織成通用組件
- formData和原生的ajax有什麽區別
- 介紹下表單提交，和formData有什麽關系
- 介紹redux接入流程
- rudux和全局管理有什麽區別（數據可控、數據響應）
- RN和原生通信
- 介紹MVP怎麽組織
- 介紹異步方案
- promise如何實現then處理
- koa2中間件原理
- 常用的中間件
- 服務端怎麽做統一的狀態處理
- 如何對相對路徑引用進行優化
- node文件查找優先級
- npm2和npm3+有什麽區別

### 海康威視
- knex連接數據庫響應回調
- 介紹異步方案
- 如何處理異常捕獲
- 項目如何管理模塊
- 前端性能優化
- JS繼承方案
- 如何判斷一個變量是不是數組
- 變量a和b，如何交換
- 事件委托
- 多個
- 標簽生成的Dom結構是一個類數組
- 類數組和數組的區別
- dom的類數組如何轉成數組
- 介紹單頁面應用和多頁面應用
- redux狀態樹的管理
- 介紹localstorage的API

### 蘑菇街
- html語義化的理解
- <b>和<strong>的區別
- 對閉包的理解
- 工程中閉包使用場景
- 介紹this和原型
- 使用原型最大的好處
- react設計思路
- 為什麽虛擬DOM比真實DOM性能好
- react常見的通信方式
- redux整體的工作流程
- redux和全局對象之間的區別
- Redux數據回溯設計思路
- 單例、工廠、觀察者項目中實際場景
- 項目中樹的使用場景以及了解
- 工作收獲

### 酷家樂
- react生命周期
- react性能優化
- 添加原生事件不移除為什麽會內存泄露
- 還有哪些地方會內存泄露
- setInterval需要註意的點
- 定時器為什麽是不精確的
- setTimeout(1)和setTimeout(2)之間的區別
- 介紹宏任務和微任務
- promise裏面和then裏面執行有什麽區別
- 介紹pureComponet
- 介紹Function Component
- React數據流
- props和state的區別
- 介紹react context
- 介紹class和ES5的類以及區別
- 介紹箭頭函數和普通函數的區別
- 介紹defineProperty方法，什麽時候需要用到
- for..in 和 object.keys的區別
- 介紹閉包，使用場景
- 使用閉包特權函數的使用場景
- get和post有什麽區別

### 百分點
- React15/16.x的區別
- 重新渲染render會做些什麽
- 哪些方法會觸發react重新渲染
- state和props觸發更新的生命周期分別有什麽區別
- setState是同步還是異步
- 對無狀態組件的理解
- 介紹Redux工作流程
- 介紹ES6的功能
- let、const以及var的區別
- 淺拷貝和深拷貝的區別
- 介紹箭頭函數的this
- 介紹Promise和then
- 介紹快速排序
- 算法：前K個最大的元素

### 海風教育
- 對react看法，它的優缺點
- 使用過程中遇到的問題，如何解決的
- react的理念是什麽（拿函數式編程來做頁面渲染）
- JS是什麽範式語言(面向對象還是函數式編程)
- koa原理，為什麽要用koa(express和koa對比)
- 使用的koa中間件
- ES6使用的語法
- Promise 和 async/await 和 callback的區別
- Promise有沒有解決異步的問題（promise鏈是真正強大的地方）
- Promise和setTimeout的區別（Event Loop）
- 進程和線程的區別（一個node實例就是一個進程，node是單線程，通過事件循環來實現異步)
- 介紹下DFS深度優先
- 介紹下觀察者模式
- 觀察者模式裏面使用的數據結構(不具備順序 ，是一個list)
## 學習資源

- [The Best Frontend JavaScript Interview Questions (written by a Frontend Engineer)](https://performancejs.com/post/hde6d32/The-Best-List-of-Frontend-JavaScript-Interview-Questions-(written-by-a-Frontend-Engineer))
- [Overreacted (Dan's blog)](https://overreacted.io/)
- [Front End interview questions](https://github.com/h5bp/Front-end-Developer-Interview-Questions)
- [@bentruyman](http://twitter.com/bentruyman) - http://bentruyman.com
- [@cowboy](http://twitter.com/cowboy) - http://benalman.com
- [@ajpiano](http://ajpiano) - http://ajpiano.com
- [@SlexAxton](http://twitter.com/slexaxton) - http://alexsexton.com
- [@boazsender](http://twitter.com/boazsender) - http://boazsender.com
- [@miketaylr](http://twitter.com/miketaylr) - http://miketaylr.com
- [@vladikoff](http://twitter.com/vladikoff) - http://vladfilippov.com
- [@gf3](http://twitter.com/gf3) - http://gf3.ca
- [@jon_neal](http://twitter.com/jon_neal) - http://twitter.com/jon_neal
- [@wookiehangover](http://twitter.com/wookiehangover) - http://wookiehangover.com
- [@darcy_clarke](http://twitter.com/darcy) - http://darcyclarke.me
- [@iansym](http://twitter.com/iansym)
