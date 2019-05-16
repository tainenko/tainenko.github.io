---
layout: post
title:  "Front end javascript interviews"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.png
tags: [ workshop, frontend, javascript, interview ]
---

JavaScript 的 ES2015 改變了一切。ES2015 規範帶來了很多重大特性 。 modules（模塊）的原生支持，以及不斷發展的函數式編程模式，新的 JavaScript 感覺上完全是一種不同的語言。隨著 ES2016、ES2017 的到來，這股潮流每年都在繼續。

然而，在面試或聘用前端開發人員時，期望，現實和需求之間存在巨大差距。 正如 Laurie Voss 在其 NPM 視頻所說的：

現代 Web 應用程序中 97％ 的代碼來自 NPM 。
[![JS npm](http://img.youtube.com/vi/Qa4dxW-Qi2s/0.jpg)](https://www.youtube.com/watch?v=Qa4dxW-Qi2s "JS npm")  

我們真的是在編寫代碼，還是像樂高積木一樣簡單地組裝代碼？

在 2018 年底，我們仍然看到大多數面試者被問到 AJAX 時，面試者依然在 jQuery 語境中回答問題。這種差距還有很多典型的例子：

CSS Grid 和 Flexbox 布局已經得到了廣泛支持。然而，CSS 面試時仍然集中在多列浮動布局 和行內塊級元素居中。他們依然對 Bootstrap 或 Foundation 網格系統有著永不消亡的熱情。  

模塊打包器（Module bundler）現在幾乎是大規模應用程序的標配。然而，當談到架構時，我們談論的又是 minification(壓縮) 和 concatenation(合並) 。在面試訪談中我們真正討論過多少次 Webpack ？  

如果 97％ 的代碼來自 NPM ，但面試的重點缺又是數組排序或對象叠代。更糟糕的是，我們仍然對 typeof null 很感興趣。為什麽不能聊點 選擇合適的庫，框架或工具的理性方法呢？  

我們仍在讓面試者在原型之上進行經典繼承，但並不是要驗證對這些錯誤想法的需要。我們有更多的功能性模式。當然，使用 JavaScript class(類)，新引入的私有和靜態屬性可以好好的討論一下。這將使人們更好地理解面試者的想法，關鍵決策等。  

緩存討論仍局限於 Cache control headers(控制頭) 和 CDN。像 IndexDB，HTTP/2 或Service Workers 這樣的東西只是路過。  

這種例子不勝枚舉，面試評估與工作實際需求之間的差距顯而易見。一方面，我們的前端技術實現取得了跨越式發展，另一方面，新的開發方式還沒有形成大的社區。社區分裂永遠不是好兆頭。這是一條災難之路。差距總是會創造出一種新的東西，它有能力摧毀我們迄今為止所建造的一切。我無法想象 Java 開發人員使用 GWT 編寫另一個 Facebook 。  

面試是催生變革和匯聚人才的好方式。作為面試官的你，如果僅僅把面試當成面試，那麽它只會讓你自我膨脹。

要使一場面試成功，必須進行討論。 它必須是一個交換思想的地方。 它應該挑起人們思考並客觀地分析給定的問題。 它是理解人們做出的決策過程，也是了解一個人對技術和解決問題的熱情，也意味著了解未來可能的同事。 所有那些難題，技巧或 typeof null 都無法稱得上真正面試。  

以下是我們在面試討論中提出的一些問題清單。我們希望此清單可以幫助面試官和面試者在正確的背景下設定期望，需求和現實。  

TLDR; 我們要先把自己當成面試官。

## JavaScript 基礎問題
1. 使以下代碼正常運行：
    ```javascript
    const a = [1, 2, 3, 4, 5];
    // Implement this
    a.multiply();
    console.log(a); // [1, 2, 3, 4, 5, 1, 4, 9, 16, 25]
    ```

2. 以下代碼在 JavaScript 中返回 false 。 解釋一下為什麽會這樣：  
    ```javascript
    // false
    0.2 + 0.1 === 0.3
    ```

3. JavaScript 中有哪些不同的數據類型？  
提示：只有兩種類型 – 主要數據類型和引用類型（對象）。 有 6 種主要類型。

4. 解決以下異步代碼問題。  
檢索並計算屬於同一教室中每個學生的平均分數，其中一些ID為75。每個學生可以在一年內參加一門或多門課程。 以下 API 可用於檢索所需數據。  

    GET /api/students
    Response:  
    ```javascript
    // GET LIST OF ALL THE STUDENTS
    [{
        "id": 1,
        "name": "John",
        "classroomId": 75
    }]
    ```
    GET /api/courses?filter=studentId eq 1  
    Response:   

    ```javascript
    // GET COURSES FOR GIVEN A STUDENT  
        [{
            "id": "history",
            "studentId": 1
            
        }, 
        {
            "id": "algebra",
            "studentId": 1
        },]
    ```
    GET /api/evaluation/history?filter=studentId eq 1
    Response:
    ```javascript
        // GET EVALUATION FOR EACH COURSE
        {
            "id": 200,
            "score": 50,
            "totalScore": 100
        }
    ```
    編寫一個接受教室 ID 的函數，您將根據該函數計算該教室中每個學生的平均值。該函數的最終輸出應該是具有平均分數的學生列表：  
    ```javascript
        [
          { "id": 1, "name": "John", "average": 70.5 },
          { "id": 3, "name": "Lois", "average": 67 },
        ]
    ```
    使用普通的 callbacks ，promises ，observables，generator 或 async-wait 編寫所需的函數。嘗試使用至少 3 種不同的技術解決這個問題。

5. 使用 JavaScript Proxy 實現簡單的數據綁定  
提示：ES Proxy 允許您攔截對任何對象屬性或方法的調用。首先，每當更改底層綁定對象時，都應更新 DOM 。  

6. 解釋 JavaScript 併發模型  
您是否熟悉 Elixir，Clojure，Java 等其他編程語言中使用的任何其他併發模型？  

    提示：查找事件循環，任務隊列，調用棧，堆等。  

7. new 關鍵字在 JavaScript 中有什麽作用？   
提示：在 JavaScript 中，new 是用於實例化對象的運算符。   
另外，請註意 [[Construct]] 和 [[Call]]。  

8. avaScript 中有哪些不同的函數調用模式？ 詳細解釋。  
提示：有四種模式，函數調用，方法調用，.call() 和 .apply()。  

9. 解釋任一即將發布新的 ECMAScript 提案。
提示：比如 2018 的 BigInt，partial 函數，pipeline 操作符 等。  

10. JavaScript 中的叠代器（iterators）和叠代（iterables）是什麽？ 你知道什麽是內置叠代器嗎？  

11. 為什麽 JavaScript classes(類)被認為是壞的或反面模式？  
這是一個神話嗎？它是否遭受了誤傳？是否有一些有用的用例？

12. 如何在 JSON 中序列化以下對象？
如果我們將以下對象轉換為 JSON 字符串，會發生什麽？
    ```javascript
    const a = {
        key1: Symbol(),
        key2: 10
    }
    // What will happen?
    console.log(JSON.stringify(a));
    ```
13. 你熟悉 Typed Arrays 嗎？ 如果熟悉，請解釋他們與 JavaScript 中的傳統數組相比的異同？
14. 默認參數是如何工作？
如果我們在調用 makeAPIRequest 函數時必須使用 timeout 的默認值，那麽正確的語法是什麽？
    
    ```javascript
    function makeAPIRequest(url, timeout = 2000, headers) {
       // Some code to fetch data
    } 
    ```
15. 解釋 TCO – 尾調用優化（Tail Call Optimization）。 有沒有支持尾調用優化的 JavaScript 引擎？
提示：截至 2018 年，沒有。

## JavaScript 前端應用設計問題
1. 解釋單向數據流和雙向數據綁定。
Angular 1.x 基於雙向數據綁定，而 React，Vue，Elm 等基於單向數據流架構。

2. 單向數據流架構在哪些方面適合 MVC？
MVC 擁有大約 50 年的悠久歷史，並已演變為 MVP，MVVM 和 MV *。兩者之間的相互關系是什麽？如果 MVC 是架構模式，那麽單向數據流是什麽？這些競爭模式是否能解決同樣的問題？

3. 客戶端 MVC 與服務器端或經典 MVC 有何不同？
提示：經典 MVC 是適用於桌面應用程序的 Smalltalk MVC。在 Web 應用中，至少有兩個不同的數據 MVC 周期。

4. 使函數式編程與面向對象或命令式編程不同的關鍵因素是什麽？
提示：Currying（柯裏化），point-free 函數，partial 函數應用，高階函數，純函數，獨立副作用，record 類型（聯合，代數數據類型）等。

5. 在 JavaScript 和前端的上下文中，函數式編程與響應式編程有什麽關系？
提示：沒有正確答案。但粗略地說，函數式編程是關於小型編碼，編寫純函數和響應式編程是大型編碼，即模塊之間的數據流，連接以 FP 風格編寫的組件。 FRP – 功能響應式編程（ Functional Reactive Programming）是另一個不同但相關的概念。

6. 不可變數據結構（immutable data structures）解決了哪些問題？
不可變結構是否有任何性能影響？ JS 生態系統中哪些庫提供了不可變的數據結構？這些庫的優點和缺點是什麽？

    提示：線程安全（我們真的需要在瀏覽器 JavaScript 中擔心嗎？），無副作用的函數，更好的狀態管理等。

7. 大型應用程序是否應使用靜態類型？
如何比較 TypeScript/Flow 與 Elm/ReasonML/PureScript 等 JS 轉換語言？這些方法的優缺點是什麽？
選擇特定類型系統的主要標準應該是什麽？
什麽是類型推斷（type inference）？
靜態類型語言和強類型語言有什麽區別？在這方面 JavaScript 的本質是什麽？
有你知道的弱類型但靜態類型的語言嗎？有你知道的動態類型但強類型的語言嗎？舉例一二。
提示：Structural 與 Nominal 類型系統，類型穩健性，工具/生態系統支持，正確性超過方便。

8. JavaScript 中有哪些傑出的模塊系統（module systems ）？如何評價 ES 模塊系統。
列出在實現不同模塊系統之間互操作所涉及的一些覆雜性問題（主要對 ES 模塊和 CommonJS 互操作感興趣）

9. HTTP/2 將如何影響 JavaScript 應用程序打包？
列出 HTTP/2 與其上一個版本的基本區別。

10. Fetch API 相對於傳統的 Ajax 有哪些改進？
使用 Fetch API 有那些缺點/難點嗎？
哪些是Ajax 可以做的，而 fetch 不能做的？
11.如何評論 pull-based 和 push-based 的反應系統。
討論概念，含義，用途等。

    在這個討論中加入惰性和及早求值。
然後在討論中添加單數和覆數值維度。
最後，討論值解析的同步和異步性質。
為JavaScript中可用的每個組合提供示例。
提示：Observable 是惰性的，基於推送的覆數值構造，同時具有 async/sync 調度程序。

12. 討論與 Promise 相關的問題。
提示：及早求值（eager evaluation），尷尬的取消機制，用 then() 方法偽裝 map() 和 flatMap() 等。

## 前端基礎和理論問題
1. HTML 中 Doctype 的用途是什麽？
具體談談，以下每種情況下會發生什麽：

    - Doctype 不存在。
使用了 HTML4 Doctype，但 HTML 頁面使用了 HTML5 的標簽，如 \<audio> 或 \<video> 。它會導致任何錯誤嗎？  

    - 使用了無效的 Doctype。
2. DOM 和 BOM 的區別是什麽？
提示：BOM，DOM，ECMAScript 和 JavaScript 都是不同的東西。

3. JavaScript 中的事件處理如何運行？
如下圖所示，我們有三個 div 元素。每個 div 都有一個與之關聯的點擊處理程序。處理程序執行以下任務：

    Outer div click 處理程序將 hello outer 打印到控制台。
Inner div click 處理程序將 hello inner 打印到控制台。
Innermost div click 處理程序將 hello innermost 打印到控制台。
編寫一段代碼來分配這些任務，以便在單擊 innermost div 時始終打印以下序列？

    hello inner → hello innermost → hello outer

    事件冒泡和捕獲

    提示：事件捕獲和事件冒泡

4. 使用單頁應用將文件上傳到服務器的有哪些方法？
提示：XMLHttpRequest2（streaming），fetch（non-streaming），File API

5. CSS 重排和重繪之間有什麽區別？
哪些 CSS 屬性會導致重排及重繪？

6. 什麽是 CSS 選擇器權重以及它如何工作？
說說計算 CSS 選擇器權重的算法。

7. CSS 中的 pixel 與硬件/物理中的 pixel 有何不同？
提示：像素不是像素不是像素 – ppk。

8. 什麽是 sectioning 算法？
提示：它也被稱為 HTML5 大綱算法。特別是在構建具有語義結構的網站時非常重要。

9. 如果你用過 CSS Flex / CSS Grid（網格）布局，請說明你為什麽要使用它？它為你解決了什麽問題？
使用 CSS Grid，百分比％和 fr 單位有何不同？
使用 CSS flexbox，有時 flex-items/children 會不考慮 flex 容器設置的寬度/高度？為什麽會這樣？
可以使用 CSS Grid 創建 Masonry layout（瀑布流布局）嗎？如果可以，怎麽做？
解釋 CSS Grid 和 CSS flexbox 術語？
浮動元素（float: left | right;）如何在 CSS Grid 和 flexbox 中渲染？
提示：等高的列，垂直居中，覆雜網格等。

10. 什麽時候應該使用 CSS animations 而不是 CSS transitions ？你做出這個決定標準是什麽？
11. 如果你正在 Review CSS 代碼，那麽你在代碼中經常遇到的問題是什麽？
示例：使用魔性數字，如 width: 67px; 或使用 em 代替 rem 單位，在通用代碼之前編寫 media queries（媒體查詢），濫用 ID 和類等。

12. 如何在 JavaScript 中檢測觸摸事件？
你是否不看好檢測設備對觸摸事件的支持？如果是，為什麽？
比較觸摸事件和點擊事件。
當設備同時支持觸摸和鼠標事件時，你認為這些事件的正確事件順序是什麽或應該是什麽？
13. 為 script 標簽定義的 async 和 defer 屬性有什麽用？
現在我們有 HTTP/2 和 ES 模塊，它們真的很有用嗎？
列出的清單只是我們在面試中可能討論的無限點的一瞥。Web Components，CORS，安全性，Cookies，CSS transform，Web Assembly，Service Workers，PWA，CSS架構等，還有許多我們沒有考慮到的東西。我們也沒有涉及框架或庫的具體問題。

## Ref
https://blog.webf.zone/front-end-javascript-interviews-in-2018-19-e17b0b10514