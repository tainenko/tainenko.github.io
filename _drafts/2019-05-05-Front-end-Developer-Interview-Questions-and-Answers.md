---
layout: post
title:  "Front end Developer Interview Questions and Answers"
author: tony
categories: [ Frontend,Interview ]
image: assets/images/20.jpg
tags: [frontend,interview,javascript,css,html,react]
---
## 前端面試題目

1. div和span的區別？  
    div是塊級標籤，span是行級標籤  
2. 在html中，position取值有哪幾種，預設值是什麼？  
    - 取值：static、relative、fixed、absolute   
    - 預設值：static    

3. 前端頁面由哪三層構成，分別是什麼？作用是什麼？  
    前端頁面構成：結構層、表示層、行為層  
    結構層（structural layer）  
    由 HTML 或 XHTML之類的標記語言負責建立。標籤，也就是那些出現在尖括號裡的單詞，對網頁內容的語義含義做出了描述，但這些標籤不包含任何關於如何顯示有關內容的資訊。例如，P標籤表達了這樣一種語義：“這是一個文字段。”   
    
    表示層（presentation layer）  
    由 CSS 負責建立。 CSS對“如何顯示有關內容”的問題做出了回答。  
    
    行為層（behaviorlayer）  
    負責回答“內容應該如何對事件做出反應”這一問題。這是 Javascript 語言和 DOM主宰的領域。  
    
4. 如何居中一個浮動元素？

   方式1:設定容器的浮動方式為相對定位，然後確定容器的寬高比如寬500 高 300 的層，然後設定層的外邊距。
    ``` html
    <!DOCTYPEHTML>
    
    <html>
    
    <head>
    
    <styletype=”text/css”>
    
            div{ 
    
                width: 500px; 
    
                height: 300px; 
    
                margin: -150px 0 0 -250px; 
    
                position: absolute; 
    
                left: 50%; 
    
                top: 50%; 
    
                background-color: yellow;  
    
            } 
    
    </style>
    
    </head>
    
    <body>
    
    <div>
    
            元素居中 
    
    </div>
    
    </body>
    
    </html>
    ```
    方式2：需要position:absolute;絕對定位。而層的定位點，使用外補丁margin負值的方法。負值的大小為層自身寬度高度除以二。
    ``` 
    <styletype=”text/css”>
    
    <!–
    
    div {
    
    position:absolute;
    
    top:50%;
    
    left:50%;
    
    margin:-150px 0 0 -200px;
    
    width:400px;
    
    height:300px;
    
    border:1px solid #008800;
    
    }
    
    –>
    
    </style>
    
    <div>讓層垂直居中於瀏覽器視窗</div>
    ``` 
5. 請簡述HTML和XHTML最重要的4點不同？  
    - XHTML要求正確巢狀        
    - XHTML 所有元素必須關閉       
    - XHTML 區分大小寫             
    - XHTML 屬性值要用雙引號      
    - XHTML 用 id 屬性代替 name 屬性       
    - XHTML 特殊字元的處理   
        
6. 頁面佈局中常聽說的“結構與表現”分離，“結構”是指？“表現”是指？    
    - “結構”：HTML
    - “表現”：CSS
    
7. 怎麼樣從web前端方面優化效能？至少列舉5點？
    1. HTML部分  
        - 語義化HTML：好處在於可以使程式碼簡潔清晰，支援不同裝置，利於搜尋引擎，便於團隊開發；  
        - 減少DOM節點：加速頁面渲染；  
        - 給圖片加上正確的寬高值：這可以減少頁面重繪，同時防止圖片縮放；  
        - 防止src屬性和link的href屬性為空：當值為空時，瀏覽器很可能會把當前頁面當成其屬性值載入；  
        - 正確的閉合標籤：如避免使用\<div/>，瀏覽器會多一個將它解析成<div\></div\>的過程；  
        - 連結為目錄或首頁的地址後面加”/”，如http://www.5icool.org/；  
        - 用LINK而不用@import方式匯入樣式；  
        - 樣式放在頁頭，JS放在頁尾；    
        - 縮小favicon.ico並快取；  
    
    2. CSS部分
        - 避免使用CSS Expressions(CSS表示式)：如background-color: expression( (newDate()).getHours()%2 ? “#B8D4FF” : “#F08A00″ ) ;
        - 避免使用CSS Filter（CSS濾鏡）；
        - 使用CSS縮寫，減少程式碼量；
        - 通過CSSSprites把同類圖片合成一張，減少圖片請求；
        - 減少查詢層級：如.header .logo要好過.header .top .logo；
        - 減少查詢範圍：如.header>li要好過.header li；
        - 避免TAG標籤與CLASS或ID並存：如a.top、button#submit；
        - 刪除重複的CSS；
    
    3. Javscript部分
        - 儘量少用全域性變數；
        - 使用事件代理繫結事件，如將事件繫結在body上進行代理；
        - 避免頻繁操作DOM節點；
        - 不使用EVAL；
        - 減少物件查詢，如a.b.c.d這種查詢方式非常耗效能，儘可能把它定義在變數裡；
        - 型別轉換：把數字轉換成字串使用”” 1，浮點數轉換成整型使用Math.floor()或者Math.round()；
        - 對字串進行迴圈操作，譬如替換、查詢，應使用正規表示式；
        - 刪除重複的JS；
                                                                                                                                                
    4. 伺服器部分                                                                                                                                    
        - 儘量合併CSS、JS檔案，或將其直接寫在頁面上，減少HTTP請求；                                                                                                     
        - 壓縮CSS、JS檔案，縮短檔案傳輸時間；                                                                                                                  
        - 避免404錯誤：特別要避免給404指定一個停擺頁面，否則所有404錯誤都將會載入一次頁面；                                                                                         
        - 一般要求減少DNS查詢次數，如同一個頁面的請求資源儘量少的使用不同的主機名，這可以減少網站並行下載的數量，但很多網站為了加速下載資源其實是特意用了多個主機名，這裡要做一個權衡；                                              
        - 使用CDN加速，使使用者從離自己最近的伺服器下載檔案；                                                                                                           
        - 減少Cookie的大小，使用無cookie的域，客戶端請求靜態檔案的時候，減少 Cookie 的反覆傳輸對主域名的影響；                                                                          
        - 為檔案頭指定Expires，使內容具有快取性；                                                                                                               
        - 使用gzip壓縮內容；                                                                                                                           

8. JavaScript中哪些方法獲取元素?
    - getElementById  
    - getElementsByClassName  
    - getElementsByTagName  
    - getElementsByName  

9. 描述CSS hack技巧?  
    - 條件註釋：僅適用於IE
    - 特定符號：適用於能識別特定符號的瀏覽器
    - 核心符號：針對不同瀏覽器核心
    
10. 用JS擷取字串，asdfgh，要fgh;?   
    - 方式1： ‘asdfgh’.substr(3,3)  
    - 方式2： ’asdfgh’.substring(3,5) 或者 ‘asdfgh’.substring(3)

11. IE6的雙倍邊距BUG指的是什麼？怎麼解決？   
    - 雙邊距：當塊級元素有浮動樣式的時候，給元素新增margin-left和margin-right樣式，在ie6下就會出現雙倍邊距。   
    - 解決方案：給當前元素新增樣式，使當前元素不為塊，如：display:inline;display:list-item   

12. 如果製作一個訪問量很大的網站，對css，js和圖片應該怎麼處理?  
    - 方法1：資原始檔按模組進行放置，有利於團隊開發
    - 方法2：圖片儘量採取聚合技術
    - 方法3：精簡壓縮css和js檔案，減少檔案大小
    - 方法4：類庫、媒體使用CDN加速，減輕伺服器壓力  

13. 描述ajax原理，什麼是同步非同步(主觀題，答案不唯一)?

    Ajax的工作原理：相當於在使用者和伺服器之間加了—箇中間層，使使用者操作與伺服器響應非同步化。這樣把以前的一些伺服器負擔的工作轉嫁到客戶端，利於客戶端閒置的處理能力來處理，減輕伺服器和頻寬的負擔，從而達到節約ISP的空間及頻寬租用成本的目的。  
    同步非同步：

14. 平時有沒有使用xml和json，在ajax互動中，哪一種更易於開發和維護，js中怎麼序列化JSON字串?  

    - 有，json相比xml可讀性和可擴張性好、編碼及解碼難度較低、在資料互動中頻寬佔用少，並且在當下是最流行的資料互動格式。 
    - 序列化JSON字串：eval() 或者 JSON.parse()
    
15. JS怎麼建立一個類?

    方式1 : var obj = new Object();  
    方式2 : var obj = {};

16. JS的typeof返回哪些資料型別?

    string、number、object、boolean、function、undefined
17. HTTP請求有哪幾種？

    post、get、delete、input

18. 完成下面佈局（相容IE6-10以及FF、谷歌、蘋果瀏覽器）?

    ```html
    <!DOCTYPEhtml>
    
    <htmllang=”en”>
    
    <head>
    
        <metahttp-equiv=”Content-Type” content=”text/html;charset=utf-8″/>
    
        <title></title>
    
        <style>
    
            body {
    
                margin: 0;
    
                padding: 0;
    
            }
    
     
    
            #body {
    
                background-color: #0099CB;
    
                width: 100%;
    
                float: left;
    
            }
    
     
    
            #header {
    
                height: 60px;
    
                background-color: #999999;
    
            }
    
     
    
            #content {
    
                background-color: #006766;
    
                margin-left: 180px;
    
            }
    
     
    
            #sidebar {
    
                width: 180px;
    
                float: left;
    
            }
    
     
    
            #footer {
    
                clear: both;
    
                height: 60px;
    
                background-color: #999999;
    
            }
    
        </style>
    
    </head>
    
    <body>
    
    <divid=”header”></div>
    
    <divid=”body”>
    
        <divid=”sidebar”></div>
    
        <divid=”content”></div>
    
    </div>
    
    <divid=”footer”></div>
    
    </body>
    
    </html>
    ```

19. 閉包是什麼？有什麼特性？請簡單書寫一個簡單事例？
    必包：閉包是指可以包含自由（未繫結到特定物件）變數的程式碼塊；這些變數不是在這個程式碼塊內或者任何全域性上下文中定義的，而是在定義程式碼塊的環境中定義（區域性變數）  
    特性：閉包是能夠讀取其他函式內部變數的函式，即在外面可以呼叫函式中的函式的變數，其實他就是將函式內外部連線起來的橋樑  
    
    事例：
    ```javascript
    <scripttype=’text/javascript’>
    
    function a(){
    
    var i = 99;
    
    iAdd = function(){
    
    i ;
    
    }
    
    function b(){
    
    alert(i);
    
    }
    
    return b;
    
    }
    
    var result = a();
    
    result();//結果為99
    
    iAdd();
    
    result();//結果為100
    
    </script>
    ```
    
20. 解釋jsonp的原理，以及為什麼不是真正的ajax（主觀題）？

    JSONP是一種非正式傳輸協議，該協議的一個要點就是允許使用者傳遞一個callback引數給服務端，然後服務端返回資料時會將這個callback引數作為函式名來包裹住JSON資料，這樣客戶端就可以隨意定製自己的函式來自動處理返回資料了。

21. js延遲載入的方式有哪些？
    defer和async、動態建立DOM方式（用得最多）、按需非同步載入js

22. 對WEB標準以及W3C的理解與認識？
    標籤閉合、標籤小寫、不亂巢狀、提高搜尋機器人搜尋機率、使用外 鏈css和js指令碼、結構行為表現的分離、檔案下載與頁面速度更快、內容能被更多的使用者所訪問、內容能被更廣泛的裝置所訪問、更少的程式碼和元件，容易維 護、改版方便，不需要變動頁面內容、提供列印版本而不需要複製內容、提高網站易用性；
    
23. xhtml和html有什麼區別？
    HTML是一種基本的WEB網頁設計語言，XHTML是一個基於XML的置標語言
    最主要的不同：  
    XHTML 元素必須被正確地巢狀。  
    XHTML 元素必須被關閉。  
    標籤名必須用小寫字母。  
    XHTML 文件必須擁有根元素。  
    
24. Doctype? 嚴格模式與混雜模式-如何觸發這兩種模式，區分它們有何意義?
    用於宣告文件使用那種規範（html/Xhtml）一般為嚴格 過度 基於框架的html文件
    加入XMl宣告可觸發，解析方式更改為IE5.5 擁有IE5.5的bug

25. 行內元素有哪些？塊級元素有哪些？CSS的盒模型？

    - 塊級元素：div p h1 h2 h3 h4 form ul
    - 行內元素: a b br i span input select
    - Css盒模型:內容，border ,margin，padding

26. CSS引入的方式有哪些?link和@import的區別是?
    內聯 內嵌 外鏈 匯入  
    區別 ：同時載入  
    前者無相容性，後者CSS2.1以下瀏覽器不支援  
    Link 支援使用javascript改變樣式，後者不可  

27. CSS選擇符有哪些？哪些屬性可以繼承？優先順序演算法如何計算？內聯和important哪個優先順序高？
    標籤選擇符 類選擇符 id選擇符  
    繼承不如指定 Id>class>標籤選擇  
    後者優先順序高  

28. 前端頁面有哪三層構成，分別是什麼？作用是什麼？
    結構層 Html 表示層 CSS 行為層 js

29. css的基本語句構成是？
    選擇器{屬性1:值1;屬性2:值2;……}

30. 你做的頁面在哪些流覽器測試過？這些瀏覽器的核心分別是什麼?
    Ie(Ie核心)火狐（Gecko）谷歌（webkit） opear(Presto)

31. 寫出幾種IE6 BUG的解決方法？

    1. 雙邊距BUG float引起的使用display
    2. 3畫素問題使用float引起的使用dislpay:inline-3px
    3. 超連結hover 點選後失效使用正確的書寫順序link visited hover active
    4. Ie z-index問題給父級新增position:relative
    5. Png 透明使用js程式碼改
    6. Min-height 最小高度！Important解決’
    7. select 在ie6下遮蓋使用iframe巢狀
    8. 為什麼沒有辦法定義1px左右的寬度容器（IE6預設的行高造成的，使用over:hidden,zoom:0.08 line-height:1px）

32. <img>標籤上title與alt屬性的區別是什麼？

    Alt 當圖片不顯示是用文字代表。
    Title 為該屬性提供資訊

33. 描述css reset的作用和用途？

    Reset重置瀏覽器的css預設屬性瀏覽器的品種不同，樣式不同，然後重置，讓他們統一

34. 解釋css sprites，如何使用？

    Css 精靈把一堆小的圖片整合到一張大的圖片上，減輕伺服器對圖片的請求數量

35. 瀏覽器標準模式和怪異模式之間的區別是什麼？
    盒子模型渲染模式的不同
    使用 window.top.document.compatMode 可顯示為什麼模式
    
36. 你如何對網站的檔案和資源進行優化？期待的解決方案包括：
    - 檔案合併
    - 檔案最小化/檔案壓縮
    - 使用CDN託管
    - 快取的使用

37. 什麼是語義化的HTML？
    直觀的認識標籤對於搜尋引擎的抓取有好處

38. 清除浮動的幾種方式，各自的優缺點？
    1. 使用空標籤清除浮動 clear:both（理論上能清楚任何標籤，，，增加無意義的標籤）
    2. 使用overflow:auto（空標籤元素清除浮動而不得不增加無意程式碼的弊端,,使用zoom:1用於相容IE）
    3. 是用afert偽元素清除浮動(用於非IE瀏覽器)

39. javascript的typeof返回哪些資料型別？

    - Object 
    - number 
    - function 
    - boolean 
    - underfind

40. 例舉3種強制型別轉換和2種隱式型別轉換？

    強制（parseInt,parseFloat,number）  
    隱式（== – ===）

41. split() join() 的區別？

    前者是切割成陣列的形式，後者是將陣列轉換成字串

42. 陣列方法pop() push() unshift() shift()？

    Push()尾部新增 pop()尾部刪除  
    Unshift()頭部新增 shift()頭部刪除  

43. JS中的call()和apply()方法的區別？

    例子中用 add 來替換 sub，add.call(sub,3,1) == add(3,1) ，所以執行結果為：alert(4);  
    注意：js 中的函式其實是物件，函式名是對 Function 物件的引用。
    ```javascript
    function add(a,b)
    
    {
    
       alert(a b);
    
    }
    
     
    
    function sub(a,b)
    
    {
    
       alert(a-b);
    
    }
    
     
    
    add.call(sub,3,1);
    ```
    
44. IE和DOM事件流的區別？
    1. 執行順序不一樣、
    2. 引數不一樣
    3. 事件加不加on
    4. this指向問題

45. IE和標準下有哪些相容性的寫法？  
    Var ev = ev || window.event
    document.documentElement.clientWidth || document.body.clientWidth
    Var target = ev.srcElement||ev.target

46. ajax請求的時候get 和post方式的區別？  
    一個在url後面一個放在虛擬載體裡面  
    有大小限制  
    安全問題  
    應用不同一個是論壇等只需要請求的，一個是類似修改密碼的  

47. call和apply的區別？  
    Object.call(this,obj1,obj2,obj3)  
    Object.apply(this,arguments)  

48. ajax請求時，如何解釋json資料？ 
    使用eval parse 鑑於安全性考慮使用parse更靠譜

49. new操作符具體幹了什麼呢?  
    1. 建立一個空物件，並且 this 變數引用該物件，同時還繼承了該函式的原型。
    2. 屬性和方法被加入到 this 引用的物件中。
    3. 新建立的物件由 this 所引用，並且最後隱式的返回 this 。
    ```javascript
    var obj  = {};
    obj.__proto__ = Base.prototype;
    Base.call(obj);
    ```
    
50. 寫一個獲取非行間樣式的函式？
    ```javascript
    functiongetStyle(obj,attr,value)
    {
    if(!value)
    {
    if(obj.currentStyle)
    {
    return obj.currentStyle(attr)
    }
    else
    {
    obj.getComputedStyle(attr,false)
    }
    }
    else
    {
    obj.style[attr]=value
    }
    }
    ```
    
51. 事件委託是什麼？
    讓利用事件冒泡的原理，讓自己的所觸發的事件，讓他的父元素代替執行！  
    http://www.webasily.com/?p=78 例子可見此連結  

52. 閉包是什麼，有什麼特性，對頁面有什麼影響？
    閉包就是能夠讀取其他函式內部變數的函式。  
    http://blog.csdn.net/gaoshanwudi/article/details/7355794 此連結可檢視（問這個問題的不是一個公司）

53. 如何阻止事件冒泡和預設事件？
    canceBubble return false

54. 新增刪除替換插入到某個接點的方法？
    obj.appendChidl()  
    obj.innersetBefore  
    obj.replaceChild  
    obj.removeChild  

55. 解釋jsonp的原理，以及為什麼不是真正的ajax？
    動態建立script標籤，回撥函式  
    Ajax是頁面無重新整理請求資料操作  

56. javascript的本地物件，內建物件和宿主物件？  
    本地物件為array obj regexp等可以new例項化  
    內建物件為gload Math 等不可以例項化的  
    宿主為瀏覽器自帶的document,window 等  

57. document load 和document ready的區別？
    Document.onload 是在結構和樣式載入完才執行js  
Document.ready原生種沒有這個方法，jquery中有 $().ready(function)

58. ”==”和“===”的不同？
    前者會自動轉換型別  
    後者不會

59. javascript的同源策略？
    一段指令碼只能讀取來自於同一來源的視窗和文件的屬性，這裡的同一來源指的是主機名、協議和埠號的組合

60. 編寫一個陣列去重的方法？
    ```javascript
    function oSort(arr)
    
    {
    
    varresult ={};
    
    varnewArr=[];
    
    for(vari=0;i<arr.length;i )
    
    {
    
    if(!result[arr])
    
    {
    
    newArr.push(arr)
    
    result[arr]=1
    
    }
    
    }
    
    returnnewArr
    
    }
    ``` 

61. Doctype作用? 嚴格模式與混雜模式-如何觸發這兩種模式，區分它們有何意義?
    1. \<!DOCTYPE> 宣告位於文件中的最前面，處於\<html>標籤之前。告知瀏覽器的解析器，用什麼文件型別 規範來解析這個文件。
    
    2. 嚴格模式的排版和 JS 運作模式是 以該瀏覽器支援的最高標準執行。
    
    3. 在混雜模式中，頁面以寬鬆的向後相容的方式顯示。模擬老式瀏覽器的行為以防止站點無法工作。
    
    4. DOCTYPE不存在或格式不正確會導致文件以混雜模式呈現。

62. 行內元素有哪些？塊級元素有哪些？空(void)元素有那些？
    1. CSS規範規定，每個元素都有display屬性，確定該元素的型別，每個元素都有預設的display值，比如div預設display屬性值為“block”，成為“塊級”元素；span預設display屬性值為“inline”，是“行內”元素。 
    2. 行內元素有：a b span img input select strong（強調的語氣） 塊級元素有：div ul ol li dl dt dd h1 h2 h3 h4…p 
    3. 知名的空元素： \<br> \<hr> \<img> \<input> \<link> \<meta>
    4. 鮮為人知的是： \<area> \<base> \<col> \<command> \<embed> \<keygen> \<param> \<source> \<track> \<wbr>  

63. CSS的盒子模
    1. 兩種， IE 盒子模型、標準 W3C 盒子模型；IE 的content部分包含了border 和 pading;
    2. 盒模型： 內容(content)、填充(padding)、邊界(margin)、 邊框(border).

64. link 和@import 的區別是?
    1. link屬於XHTML標籤，而@import是CSS提供的;
    2. 頁面被載入的時，link會同時被載入，而@import引用的CSS會等到頁面被載入完再載入;
    3. port只在IE5以上才能識別，而link是XHTML標籤，無相容問題;
    4. link方式的樣式的權重 高於@import的權重.

65. CSS 選擇符有哪些？哪些屬性可以繼承？優先順序演算法如何計算？ CSS3新增偽類有那些？
    1. id選擇器（ # myid）
    2. 類選擇器（.myclassname）
    3. 標籤選擇器（div, h1, p）
    4. 相鄰選擇器（h1 p）
    5. 子選擇器（ul < li）
    6. 後代選擇器（li a）
    7. 萬用字元選擇器（ * ）
    8. 屬性選擇器（a[rel = “external”]）
    9. 偽類選擇器（a: hover, li: nth – child）
    可繼承： font-sizefont-family color, UL LI DL DD DT;  
    不可繼承 ：border paddingmargin width height ;  
    優先順序就近原則，樣式定義最近者為準;  
    載入樣式以最後載入的定位為準;  
    優先順序為:  
    !important >  id > class > tag   
    important 比 內聯優先順序高  
    CSS3新增偽類舉例：  
    p:first-of-type 選擇屬於其父元素的首個 \<p> 元素的每個 \<p> 元素。  
    p:last-of-type  選擇屬於其父元素的最後 \<p> 元素的每個 \<p> 元素。  
    p:only-of-type  選擇屬於其父元素唯一的 \<p> 元素的每個 \<p> 元素。  
    p:only-child    選擇屬於其父元素的唯一子元素的每個 \<p> 元素。  
    p:nth-child(2)  選擇屬於其父元素的第二個子元素的每個 \<p> 元素。  
    :enabled、:disabled控制表單控制元件的禁用狀態。  
    :checked，單選框或核取方塊被選中。 
     
66. 如何居中div,如何居中一個浮動元素?  
    給div設定一個寬度，然後新增margin:0 auto屬性
    ```html
              div{
    
    ·                width:200px;
    
    ·                margin:0 auto;
    
    ·             } 
    
    ·        居中一個浮動元素
    
    ·              確定容器的寬高 寬500 高 300 的層
    
    ·              設定層的外邊距
    
    ·         
    
    ·             .div {
    
    ·              Width:500px ; height:300px;//高度可以不設
    
    ·              Margin: -150px 0 0 -250px;
    
    ·              position:relative;相對定位
    
    ·              background-color:pink;//方便看效果
    
    ·              left:50%;
    
    ·              top:50%;
    
    ·            }
    
    ```
    
67. 瀏覽器的核心分別是什麼?經常遇到的瀏覽器的相容性有哪些？原因，解決方法是什麼，常用hack的技巧？  
    * IE瀏覽器的核心Trident、 Mozilla的Gecko、google的WebKit、Opera核心Presto；
    * png24為的圖片在iE6瀏覽器上出現背景，解決方案是做成PNG8.  
    * 瀏覽器預設的margin和padding不同。解決方案是加一個全域性的*{margin:0;padding:0;}來統一。  
    * IE6雙邊距bug:塊屬性標籤float後，又有橫行的margin情況下，在ie6顯示margin比設定的大。  
     浮動ie產生的雙倍距離 #box{float:left; width:10px; margin:0 0 0 100px;}  
    這種情況之下IE會產生20px的距離，解決方案是在float的標籤樣式控制中加入 ——_display:inline;將其轉化為行內屬性。(_這個符號只有ie6會識別)  
     漸進識別的方式，從總體中逐漸排除區域性。  
     首先，巧妙的使用“\9”這一標記，將IE遊覽器從所有情況中分離出來。  
     接著，再次使用“ ”將IE8和IE7、IE6分離開來，這樣IE8已經獨立識別。
         ```
          .bb{

           background-color:#f1ee18;/*所有識別*/

          .background-color:#00deff\9; /*IE6、7、8識別*/

          background-color:#a200ff;/*IE6、7識別*/

          _background-color:#1e0bd1;/*IE6識別*/

          }
        ```
    *  IE下,可以使用獲取常規屬性的方法來獲取自定義屬性,
      也可以使用getAttribute()獲取自定義屬性;  
      Firefox下,只能使用getAttribute()獲取自定義屬性.  
      解決方法:統一通過getAttribute()獲取自定義屬性.
    *  IE下,even物件有x,y屬性,但是沒有pageX,pageY屬性;  
        Firefox下,event物件有pageX,pageY屬性,但是沒有x,y屬性.
    * （條件註釋）缺點是在IE瀏覽器下可能會增加額外的HTTP請求數。
    * Chrome 中文介面下預設會將小於 12px 的文字強制按照 12px 顯示, 可通過加入 CSS 屬性 -webkit-text-size-adjust: none; 解決.
     超連結訪問過後hover樣式就不出現了 被點選訪問過的超連結樣式不在具有hover和active瞭解決方法是改變CSS屬性的排列順序:
     ```
     L-V-H-A :  a:link {} a:visited {}a:hover {} a:active {}
     ```
    
68. html5\CSS3有哪些新特性、移除了那些元素？如何處理HTML5新標籤的瀏覽器相容問題？如何區分 HTML 和 HTML5？

     HTML5 現在已經不是 SGML 的子集，主要是關於影象，位置，儲存，地理定位等功能的增加。
    * 繪畫 canvas 元素
     用於媒介回放的 video和 audio 元素
    本地離線儲存localStorage 長期儲存資料，瀏覽器關閉後資料不丟失；
    sessionStorage 的資料在瀏覽器關閉後自動刪除
    語意化更好的內容元素，比如 article、footer、header、nav、section
    表單控制元件，calendar、date、time、email、url、search
     CSS3實現圓角，陰影，對文字加特效，增加了更多的CSS選擇器 多背景 rgba
     新的技術webworker,websockt, Geolocation
    移除的元素
    純表現的元素：basefont，big，center，font, s，strike，tt，u；
    對可用性產生負面影響的元素：frame，frameset，noframes；    
    * 是IE8/IE7/IE6支援通過document.createElement方法產生的標籤，
    可以利用這一特性讓這些瀏覽器支援HTML5新標籤，
    瀏覽器支援新標籤後，還需要新增標籤預設的樣式：
    * 當然最好的方式是直接使用成熟的框架、使用最多的是html5shim框架
        ```html
        <!–[if lt IE 9]>
        <script>src=”http://html5shim.googlecode.com/svn/trunk/html5.js”</script>
        <![endif]–>
        ```
    
69. 你怎麼來實現頁面設計圖，你認為前端應該如何高質量完成工作? 一個滿屏品字佈局如何設計?

    - 首先劃分成header、body、foot
    - 實現效果圖是最基本的工作，精確到2px；
    - 與設計師，產品經理的溝通和專案的參與
    - 做好的頁面結構，頁面重構和使用者體驗
    - 處理hack，相容、寫出優美的程式碼格式
    - 針對伺服器的優化、擁抱 HTML5。

70. 常使用的庫有哪些？常用的前端開發工具？開發過什麼應用或元件？
    * 使用率較高的框架有jQuery、YUI、Prototype、Dojo、Ext.js、Mootools等。尤其是jQuery，超過91%。
    輕量級框架有Modernizr、underscore.js、backbone.js、Raphael.js等。
    （理解這些框架的功能、效能、設計原理）
    * Sublime Text 、Eclipse、Notepad、Firebug、HttpWatch、Yslow。
    * 城市選擇外掛，汽車型號選擇外掛、幻燈片外掛。彈出層。（寫過開源程式，載入器，js引擎更好）

72. 頁面重構怎麼操作？  
    編寫 CSS、讓頁面結構更合理化，提升使用者體驗，實現良好的頁面效果和提升效能。

73. 語義化的理解？  
    html語義化就是讓頁面的內容結構化，便於對瀏覽器、搜尋引擎解析；  
    在沒有樣式CCS情況下也以一種文件格式顯示，並且是容易閱讀的。
    搜尋引擎的爬蟲依賴於標記來確定上下文和各個關鍵字的權重，利於 SEO。
  使閱讀原始碼的人對網站更容易將網站分塊，便於閱讀維護理解。

74. HTML5的離線儲存？  
    localStorage    長期儲存資料，瀏覽器關閉後資料不丟失；
    sessionStorage  資料在瀏覽器關閉後自動刪除。
    
75. 為什麼要初始化CSS樣式。  
    因為瀏覽器的相容問題，不同瀏覽器對有些標籤的預設值是不同的，如果沒對CSS初始化往往會出現瀏覽器之間的頁面顯示差異。   
    當然，初始化樣式會對SEO有一定的影響，但魚和熊掌不可兼得，但力求影響最小的情況下初始化。
    最簡單的初始化方法就是： * {padding: 0;margin: 0;} （不建議）

    淘寶的樣式初始化：
    ```css
       body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li,pre, form, fieldset, legend, button, input, textarea, th, td { margin:0;padding:0; }
    
       body, button, input, select, textarea { font:12px/1.5tahoma, arial,\5b8b\4f53; }
    
       h1, h2, h3, h4, h5, h6{ font-size:100%; }
    
       address, cite, dfn, em, var { font-style:normal; }
    
       code, kbd, pre, samp { font-family:couriernew, courier, monospace; }
    
       small{ font-size:12px; }
    
       ul, ol { list-style:none; }
    
       a { text-decoration:none; }
    
       a:hover { text-decoration:underline; }
    
       sup { vertical-align:text-top; }
    
       sub{ vertical-align:text-bottom; }
    
       legend { color:#000; }
    
       fieldset, img { border:0; }
    
       button, input, select, textarea { font-size:100%; }
    
       table { border-collapse:collapse; border-spacing:0; }
    ```
    
76. (寫)描述一段語義的html程式碼吧。

   （HTML5中新增加的很多標籤（如：<article>、<nav>、<header>和<footer>等）

    就是基於語義化設計原則） 

 

       < div id=”header”>

       < h1>標題< /h1>

       < h2>專注Web前端技術< /h2>

       < /div>

·    語義 HTML 具有以下特性：

·        文字包裹在元素中，用以反映內容。例如：

·        段落包含在<p> 元素中。

·        順序表包含在<ol>元素中。

·        從其他來源引用的大型文字塊包含在<blockquote>元素中。

·        HTML 元素不能用作語義用途以外的其他目的。例如：

·        <h1>包含標題，但並非用於放大文字。

·        <blockquote>包含大段引述，但並非用於文字縮排。

·        空白段落元素 (<p></p> ) 並非用於跳行。

·        文字並不直接包含任何樣式資訊。例如：

·        不使用<font> 或 <center> 等格式標記。

·        類或 ID 中不引用顏色或位置。

77. iframe有那些缺點？

   *iframe會阻塞主頁面的Onload事件；

 

   *iframe和主頁面共享連線池，而瀏覽器對相同域的連線有限制，所以會影響頁面的並行載入。

   使用iframe之前需要考慮這兩個缺點。如果需要使用iframe，最好是通過javascript

   動態給iframe新增src屬性值，這樣可以可以繞開以上兩個問題。

22.css定義的權重

以下是權重的規則：標籤的權重為1，class的權重為10，id的權重為100，以下例子是演示各種定義的權重值：

 

/*權重為1*/

div{

}

/*權重為10*/

.class1{

}

/*權重為100*/

#id1{

}

/*權重為100 1=101*/

#id1 div{

}

/*權重為10 1=11*/

.class1 div{

}

/*權重為10 10 1=21*/

.class1 .class2 div{

}

 

如果權重相同，則最後定義的樣式會起作用，但是應該避免這種情況出現

78. eval是做什麼的？

它的功能是把對應的字串解析成JS程式碼並執行；

避免使用eval，不安全，非常耗效能（2次，一次解析成js語句，一次執行）。

23.寫一個通用的事件偵聽器函式

`// event(事件)工具集，來源：https://github.com/markyun

markyun.Event = {

   // 頁面載入完成後

   readyEvent : function(fn) {

       if (fn==null) {

            fn=document;

       }

       var oldonload = window.onload;

       if (typeof window.onload != ‘function’) {

            window.onload = fn;

       } else {

            window.onload = function() {

                oldonload();

                fn();

            };

       }

   },

   // 視能力分別使用dom0||dom2||IE方式來繫結事件

   // 引數： 操作的元素,事件名稱 ,事件處理程式

   addEvent : function(element, type, handler) {

       if (element.addEventListener) {

            //事件型別、需要執行的函式、是否捕捉

            element.addEventListener(type,handler, false);

       } else if (element.attachEvent) {

            element.attachEvent(‘on’ type,function() {

                handler.call(element);

            });

       } else {

            element[‘on’ type] = handler;

       }

   },

   // 移除事件

   removeEvent : function(element, type, handler) {

       if (element.removeEnentListener) {

            element.removeEnentListener(type,handler, false);

       } else if (element.datachEvent) {

            element.detachEvent(‘on’ type,handler);

       } else {

            element[‘on’ type] = null;

       }

   },

   // 阻止事件 (主要是事件冒泡，因為IE不支援事件捕獲)

   stopPropagation : function(ev) {

       if (ev.stopPropagation) {

            ev.stopPropagation();

       } else {

            ev.cancelBubble = true;

       }

   },

   // 取消事件的預設行為

   preventDefault : function(event) {

       if (event.preventDefault) {

            event.preventDefault();

       } else {

            event.returnValue = false;

       }

   },

   // 獲取事件目標

   getTarget : function(event) {

       return event.target || event.srcElement;

   },

   // 獲取event物件的引用，取到事件的所有資訊，確保隨時能使用event；

   getEvent : function(e) {

       var ev = e || window.event;

       if (!ev) {

            var c = this.getEvent.caller;

            while (c) {

                ev = c.arguments[0];

                if (ev && Event ==ev.constructor) {

                    break;

               }

                c = c.caller;

            }

       }

       return ev;

   }

};

24. 99%的網站都需要被重構是那本書上寫的？

* 網站重構：應用web標準進行設計（第2版）

79. 什麼叫優雅降級和漸進增強？

優雅降級：Web站點在所有新式瀏覽器中都能正常工作，如果使用者使用的是老式瀏覽器，則程式碼會檢查以確認它們是否能正常工作。由於IE獨特的盒模型佈局問題，針對不同版本的IE的hack實踐過優雅降級了,為那些無法支援功能的瀏覽器增加候選方案，使之在舊式瀏覽器上以某種形式降級體驗卻不至於完全失效.

 

漸進增強：從被所有瀏覽器支援的基本功能開始，逐步地新增那些只有新式瀏覽器才支援的功能,向頁面增加無害於基礎瀏覽器的額外樣式和功能的。當瀏覽器支援時，它們會自動地呈現出來並發揮作用。

80. Node.js的適用場景？

高併發、聊天、實時訊息推送

81. WEB應用從伺服器主動推送Data到客戶端有那些方式？

   html5 websoket

   WebSocket通過Flash

   XHR長時間連線

    XHR Multipart Streaming

   不可見的Iframe

   <script>標籤的長時間連線(可跨域)

 

82. js的幾種資料型別？

number,string,boolean,object,undefined

 

js的常見內建物件類：Date,Array,Math、Number、Boolean、String、Array、RegExp、Function…

·      通常可以做一些小練習來判斷TA的水平，js 雖然很靈活，但是具體的程式碼和實現方式能體現出一個人的全域性觀，隨著程式碼規模的增長，複雜度增加，如何合理劃分模組實現功能和介面的能力比較重要。（下面例題）

·        [“1″,”2”, “3”].map(parseInt)

·         

·        [typeof null, nullinstanceof Object]

·         

·        [ [3,2,1].reduce(Math.pow),[].reduce(Math.pow)] ]

·         

·         var val = ‘smtg’;

·         console.log(‘Value is ‘ (val === ‘smtg’) ?’Something’ : ‘Nothing’);

83. 建立一個物件？

     function Person(name, age) {

       this.name = name;

       this.age = age;

       this.sing = function() { alert(this.name) }

     }

84. 談談This物件的理解？

this是js的一個關鍵字，隨著函式使用場合不同，this的值會發生變化。

 

但是總有一個原則，那就是this指的是呼叫函式的那個物件。

 

this一般情況下：是全域性物件Global。 作為方法呼叫，那麼this就是指這個物件

85. 事件、IE與火狐的事件機制有什麼區別？如何阻止冒泡？

 1. 我們在網頁中的某個操作（有的操作對應多個事件）。例如：當我們點選一個按鈕就會產生一個事件。是可以被 JavaScript 偵測到的行為。 

 2. 事件處理機制：IE是事件冒泡、火狐是 事件捕獲；

 3. ev.stopPropagation();

86. 什麼是閉包（closure），為什麼要用？

·      待完善

·      執行say667()後,say667()閉包內部變數會存在,而閉包內部函式的內部變數不會存在.使得Javascript的垃圾回收機制GC不會收回say667()所佔用的資源，因為say667()的內部函式的執行需要依賴say667()中的變數。這是對閉包作用的非常直白的描述.

·          function say667() {

·            // Local variable that ends up withinclosure

·            var num = 666;

·            var sayAlert = function() { alert(num); }

·            num ;

·            return sayAlert;

·        }

·         

·         var sayAlert = say667();

·         sayAlert()//執行結果應該彈出的667 

 

87. 如何判斷一個物件是否屬於某個類？

使用instanceof （待完善）

      if(a instanceof Person){

           alert(‘yes’);

      }

 

88. JSON 的瞭解？

JSON(JavaScript Object Notation) 是一種輕量級的資料交換格式。它是基於JavaScript的一個子集。資料格式簡單, 易於讀寫, 佔用頻寬小

{‘age’:’12’, ‘name’:’back’}

89.ajax 是什麼?ajax 的互動模型?同步和非同步的區別?如何解決跨域問題?

·              待完善

·          1. 通過非同步模式，提升了使用者體驗

·         

·          2. 優化了瀏覽器和伺服器之間的傳輸，減少不必要的資料往返，減少了頻寬佔用

·         

·          3. Ajax在客戶端執行，承擔了一部分本來由伺服器承擔的工作，減少了大使用者量下的伺服器負載。

·         

·          2. Ajax的最大的特點是什麼。

·         

·          Ajax可以實現動態不重新整理（區域性重新整理）

·          readyState屬性 狀態 有5個可取值： 0=未初始化 ，1=正在載入 2=以載入，3=互動中，4=完成

·      ajax的缺點

·          1、ajax不支援瀏覽器back按鈕。

·         

·          2、安全問題 AJAX暴露了與伺服器互動的細節。

·         

·          3、對搜尋引擎的支援比較弱。

·         

·          4、破壞了程式的異常機制。

·         

·          5、不容易除錯。

·        跨域： jsonp、 iframe、window.name、window.postMessage、伺服器上設定代理頁面
 
90. 模組化怎麼做？

立即執行函式,不暴露私有成員

var module1 = (function(){

　　　　var _count = 0;

　　　　var m1 = function(){

　　　　　　//…

　　　　};

　　　　var m2 = function(){

　　　　　　//…

　　　　};

　　　　return {

　　　　　　m1 : m1,

　　　　　　m2 : m2

　　　　};

　　})();

91. 對Node的優點和缺點提出了自己的看法？

   *（優點）因為Node是基於事件驅動和無阻塞的，所以非常適合處理併發請求，

     因此構建在Node上的代理伺服器相比其他技術實現（如Ruby）的伺服器表現要好得多。

     此外，與Node代理伺服器互動的客戶端程式碼是由javascript語言編寫的，

     因此客戶端和伺服器端都用同一種語言編寫，這是非常美妙的事情。

 

   *（缺點）Node是一個相對新的開源專案，所以不太穩定，它總是一直在變，

      而且缺少足夠多的第三方庫支援。看起來，就像是Ruby/Rails當年的樣子。

92. 非同步載入的方式？

 (1) defer，只支援IE

 (2) async：

 (3) 建立script，插入到DOM中，載入完畢後callBack

     documen.write和 innerHTML的區別

     document.write只能重繪整個頁面

     innerHTML可以重繪頁面的一部分

93. 告訴我答案是多少？

(function(x){

   delete x;

   alert(x);

})(1 5);

 

函式引數無法delete刪除，delete只能刪除通過for in訪問的屬性。

當然，刪除失敗也不會報錯，所以程式碼執行會彈出“1”。

94. Jquery與jQuery UI 有啥區別？

   *jQuery是一個js庫，主要提供的功能是選擇器，屬性修改和事件繫結等等。

 

   *jQuery UI則是在jQuery的基礎上，利用jQuery的擴充套件性，設計的外掛。

    提供了一些常用的介面元素，諸如對話方塊、拖動行為、改變大小行為等等

95. jquery 中如何將陣列轉化為json字串，然後再轉化回來？

jQuery中沒有提供這個功能，所以你需要先編寫兩個jQuery的擴充套件：

   $.fn.stringifyArray = function(array) {

       return JSON.stringify(array)

   }

 

   $.fn.parseArray = function(array) {

       return JSON.parse(array)

   }

 

   然後呼叫：

$(“”).stringifyArray(array)

 

 

 

96. 前端開發的優化問題？

·          （1）減少http請求次數：CSS Sprites, JS、CSS原始碼壓縮、圖片大小控制合適；網頁Gzip，CDN託管，data快取 ，圖片伺服器。

·         

·          （2）前端模板 JS 資料，減少由於HTML標籤導致的頻寬浪費，前端用變數儲存AJAX請求結果，每次操作本地變數，不用請求，減少請求次數

·         

·          （3）用innerHTML代替DOM操作，減少DOM操作次數，優化javascript效能。

·         

·          （4）當需要設定的樣式很多時設定className而不是直接操作style。

·         

·          （5）少用全域性變數、快取DOM節點查詢的結果。減少IO讀取操作。

·         

·          （6）避免使用CSS Expression（css表示式)又稱Dynamic properties(動態屬性)。

·         

·          （7）圖片預載入，將樣式表放在頂部，將指令碼放在底部  加上時間戳。

·         

·          （8）避免在頁面的主體佈局中使用table，table要等其中的內容完全下載之後才會顯示出來，顯示比div css佈局慢。

97. http狀態碼有那些？分別代表是什麼意思？

   100-199 用於指定客戶端應相應的某些動作。

   200-299 用於表示請求成功。

   300-399 用於已經移動的檔案並且常被包含在定位頭資訊中指定新的地址資訊。

   400-499 用於指出客戶端的錯誤。400    1、語義有誤，當前請求無法被伺服器理解。401   當前請求需要使用者驗證 403  伺服器已經理解請求，但是拒絕執行它。

   500-599 用於支援伺服器錯誤。 503 – 服務不可用

98. 平時如何管理你的專案，如何設計突發大規模併發架構？

先期團隊必須確定好全域性樣式（globe.css），編碼模式(utf-8) 等

編寫習慣必須一致（例如都是採用繼承式的寫法，單樣式都寫成一行）；

標註樣式編寫人，各模組都及時標註（標註關鍵樣式呼叫的地方）；

頁面進行標註（例如 頁面 模組 開始和結束）；

CSS跟HTML分資料夾並行存放，命名都得統一（例如style.css）

JS 分資料夾存放 命民以該JS 功能為準英文翻譯；

圖片採用整合的 images.png png8 格式檔案使用盡量整合在一起使用方便將來的管理

1.        那些操作會造成記憶體洩漏？

2.  記憶體洩漏指任何物件在您不再擁有或需要它之後仍然存在。

3.  垃圾回收器定期掃描物件，並計算引用了每個物件的其他物件的數量。如果一個物件的引用數量為 0（沒有其他物件引用過該物件），或對該物件的惟一引用是迴圈的，那麼該物件的記憶體即可回收。

4.   

5.  setTimeout 的第一個引數使用字串而非函式的話，會引發記憶體洩漏。

6.  閉包、控制檯日誌、迴圈（在兩個物件彼此引用且彼此保留時，就會產生一個迴圈）

 

99.JavaScript是一門什麼樣的語言，它有哪些特點？

沒有標準答案。

100. JavaScript的資料型別都有什麼？

基本資料型別：String,boolean,Number,Undefined, Null

引用資料型別：Object(Array,Date,RegExp,Function)

101.如何判斷某變數是否為陣列資料型別？

·        方法一.判斷其是否具有“陣列性質”，如slice()方法。可自己給該變數定義slice方法，故有時會失效

·        方法二.obj instanceof Array 在某些IE版本中不正確

·        方法三.方法一二皆有漏洞，在ECMA Script5中定義了新方法Array.isArray(),保證其相容性，最好的方法如下：

JavaScript

 

1

2

3

4

5

6

if(typeof Array.isArray===”undefined”)

{

  Array.isArray = function(arg){

        return Object.prototype.toString.call(arg)===”[object Array]”

    };  

}

102. 已知ID的Input輸入框，希望獲取這個輸入框的輸入值，怎麼做？(不使用第三方框架)

JavaScript

1

document.getElementById(“ID”).value

103. 希望獲取到頁面中所有的checkbox怎麼做？(不使用第三方框架)

JavaScript

1

2

3

4

5

6

7

8

var domList = document.getElementsByTagName(‘input’)

var checkBoxList = [];

var len = domList.length;//快取到區域性變數

while (len–) {//使用while的效率會比for迴圈更高

if (domList[len].type == ‘checkbox’) {

    checkBoxList.push(domList[len]);

}

}

104. 設定一個已知ID的DIV的html內容為xxxx，字型顏色設定為黑色(不使用第三方框架)

JavaScript

1

2

3

var dom = document.getElementById(“ID”);

dom.innerHTML = “xxxx”

dom.style.color = “#000”

105. 當一個DOM節點被點選時候，我們希望能夠執行一個函式，應該怎麼做？

·         直接在DOM裡繫結事件：<div onclick=”test()”></div>

·         在JS裡通過onclick繫結：xxx.onclick = test

·         通過事件新增進行繫結：addEventListener(xxx, ‘click’, test)

那麼問題來了，Javascript的事件流模型都有什麼？

·        “事件冒泡”：事件開始由最具體的元素接受，然後逐級向上傳播

·        “事件捕捉”：事件由最不具體的節點先接收，然後逐級向下，一直到最具體的

·        “DOM事件流”：三個階段：事件捕捉，目標階段，事件冒泡

106. 什麼是Ajax和JSON，它們的優缺點?

Ajax是非同步JavaScript和XML，用於在Web頁面中實現非同步資料互動。

優點：

·        　可以使得頁面不過載全部內容的情況下載入區域性內容，降低資料傳輸量

·        　避免使用者不斷重新整理或者跳轉頁面，提高使用者體驗

缺點：

·        　對搜尋引擎不友好（

·        　要實現ajax下的前後退功能成本較大

·        　可能造成請求數的增加

·        　跨域問題限制

JSON是一種輕量級的資料交換格式，ECMA的一個子集

優點：輕量級、易於人的閱讀和編寫，便於機器（JavaScript）解析，支援複合資料型別（陣列、物件、字串、數字）

 

107. 看下列程式碼輸出為何？解釋原因。

JavaScript

1

2

3

var a;

alert(typeof a); // undefined

alert(b); // 報錯

解釋：Undefined是一個只有一個值的資料型別，這個值就是“undefined”，在使用var宣告變數但並未對其賦值進行初始化時，這個變數的值就是undefined。而b由於未宣告將報錯。注意未申明的變數和宣告瞭未賦值的是不一樣的。

108. 看下列程式碼,輸出什麼？解釋原因。

JavaScript

1

2

var a = null;

alert(typeof a); //object

解釋：null是一個只有一個值的資料型別，這個值就是null。表示一個空指標物件，所以用typeof檢測會返回”object”。

109. 看下列程式碼,輸出什麼？解釋原因。

JavaScript

1

2

3

4

5

6

7

8

9

var undefined;

undefined == null; // true

1 == true;   // true

2 == true;   // false

0 == false;  // true

0 == ”;     // true

NaN == NaN;  // false

[] == false; // true

[] == ![];   // true

·        undefined與null相等，但不恆等（===）

·        一個是number一個是string時，會嘗試將string轉換為number

·        嘗試將boolean轉換為number，0或1

·        嘗試將Object轉換成number或string，取決於另外一個對比量的型別

·        所以，對於0、空字串的判斷，建議使用 “===” 。“===”會先判斷兩邊的值型別，型別不匹配時為false。

那麼問題來了，看下面的程式碼，輸出什麼，foo的值為什麼？

JavaScript

1

2

3

var foo = “11” 2-“1”;

console.log(foo);

console.log(typeof foo);

執行完後foo的值為111，foo的型別為String。

110. 看程式碼給答案。

JavaScript

1

2

3

4

5

var a = new Object();

a.value = 1;

b = a;

b.value = 2;

alert(a.value);

答案：2（考察引用資料型別細節）

111. 已知陣列var stringArray = [“This”, “is”, “Baidu”, “Campus”]，Alert出”This is Baidu Campus”。

答案：alert(stringArray.join(“”))

已知有字串foo=”get-element-by-id”,寫一個function將其轉化成駝峰表示法”getElementById”。

JavaScript

1

2

3

4

5

6

7

8

function combo(msg){

    var arr=msg.split(“-“);

    for(var i=1;i<arr.length;i ){

        arr[i]=arr[i].charAt(0).toUpperCase() arr[i].substr(1,arr[i].length-1);

    }

    msg=arr.join(“”);

    return msg;

}

(考察基礎API)

112. var numberArray = [3,6,2,4,1,5]; （考察基礎API）

1) 實現對該陣列的倒排，輸出[5,1,4,2,6,3]

2) 實現對該陣列的降序排列，輸出[6,5,4,3,2,1]

JavaScript

1

2

3

4

5

6

7

8

function combo(msg){

    var arr=msg.split(“-“);

    for(var i=1;i<arr.length;i ){

        arr[i]=arr[i].charAt(0).toUpperCase() arr[i].substr(1,arr[i].length-1);

    }

    msg=arr.join(“”);

    return msg;

}

113. 輸出今天的日期，以YYYY-MM-DD的方式，比如今天是2014年9月26日，則輸出2014-09-26

JavaScript

1

2

3

4

5

6

7

8

9

10

11

var d = new Date();

// 獲取年，getFullYear()返回4位的數字

var year = d.getFullYear();

// 獲取月，月份比較特殊，0是1月，11是12月

var month = d.getMonth() 1;

// 變成兩位

month = month < 10 ? ‘0’ month : month;

// 獲取日

var day = d.getDate();

day = day < 10 ? ‘0’ day : day;

alert(year ‘-‘ month ‘-‘ day);

114.將字串”<tr><td>{$id}</td><td>{$name}</td></tr>”中的{$id}替換成10，{$name}替換成Tony （使用正規表示式）

答案：”<tr><td>{$id}</td><td>{$id}_{$name}</td></tr>”.replace(/{\$id}/g, ’10’).replace(/{\$name}/g, ‘Tony’);

115. 為了保證頁面輸出安全，我們經常需要對一些特殊的字元進行轉義，請寫一個函式escapeHtml，將<, >, &, “進行轉義

JavaScript

1

2

3

4

5

6

7

8

9

10

11

12

13

14

function escapeHtml(str) {

return str.replace(/[<>”&]/g, function(match) {

    switch (match) {

                   case “<”:

                      return “&lt;”;

                   case “>”:

                      return “&gt;”;

                   case “&”:

                      return “&amp;”;

                   case “\””:

                      return “&quot;”;

      }

  });

}

116. foo =foo||bar ，這行程式碼是什麼意思？為什麼要這樣寫？

答案：if(!foo) foo = bar; //如果foo存在，值不變，否則把bar的值賦給foo。

短路表示式：作為”&&”和”||”操作符的運算元表示式，這些表示式在進行求值時，只要最終的結果已經可以確定是真或假，求值過程便告終止，這稱之為短路求值。

117.看下列程式碼，將會輸出什麼?(變數宣告提升)

JavaScript

1

2

3

4

5

6

var foo = 1;

function(){

    console.log(foo);

    var foo = 2;

    console.log(foo);

}

答案：輸出undefined 和 2。上面程式碼相當於：

JavaScript

1

2

3

4

5

6

7

var foo = 1;

function(){

    var foo;

    console.log(foo); //undefined

    foo = 2;

    console.log(foo); // 2;  

}

函式宣告與變數宣告會被JavaScript引擎隱式地提升到當前作用域的頂部，但是隻提升名稱不會提升賦值部分。

118.用js實現隨機選取10–100之間的10個數字，存入一個陣列，並排序。

JavaScript

1

2

3

4

5

6

7

8

9

var iArray = [];

funtion getRandom(istart, iend){

        var iChoice = istart – iend 1;

        return Math.floor(Math.random() * iChoice istart;

}

for(var i=0; i<10; i ){

        iArray.push(getRandom(10,100));

}

iArray.sort();

119.把兩個陣列合並，並刪除第二個元素。

JavaScript

1

2

3

4

var array1 = [‘a’,’b’,’c’];

var bArray = [‘d’,’e’,’f’];

var cArray = array1.concat(bArray);

cArray.splice(1,1);

120 .怎樣新增、移除、移動、複製、建立和查詢節點（原生JS，實在基礎，沒細寫每一步）

1）建立新節點

createDocumentFragment()    //建立一個DOM片段

createElement()   //建立一個具體的元素

createTextNode()   //建立一個文字節點

2）新增、移除、替換、插入

appendChild()      //新增

removeChild()      //移除

replaceChild()      //替換

insertBefore()      //插入

3）查詢

getElementsByTagName()    //通過標籤名稱

getElementsByName()     //通過元素的Name屬性的值

getElementById()        //通過元素Id，唯一性

121.有這樣一個URL：http://item.taobao.com/item.htm?a=1&b=2&c=&d=xxx&e，請寫一段JS程式提取URL中的各個GET引數(引數名和引數個數不確定)，將其按key-value形式返回到一個json結構中，如{a:’1′, b:’2′, c:”, d:’xxx’, e:undefined}。

答案：

JavaScript

1

2

3

4

5

6

7

8

9

function serilizeUrl(url) {

    var result = {};

    url = url.split(“?”)[1];

    var map = url.split(“&”);

    for(var i = 0, len = map.length; i < len; i ) {

        result[map[i].split(“=”)[0]] = map[i].split(“=”)[1];

    }

    return result;

}

122.正規表示式建構函式var reg=newRegExp(“xxx”)與正則表達字面量var reg=//有什麼不同？匹配郵箱的正規表示式？

答案：當使用RegExp()建構函式的時候，不僅需要轉義引號（即\”表示”），並且還需要雙反斜槓（即\\表示一個\）。使用正則表達字面量的效率更高。 

郵箱的正則匹配：

JavaScript

1

var regMail = /^([a-zA-Z0-9_-]) @([a-zA-Z0-9_-]) ((.[a-zA-Z0-9_-]{2,3}){1,2})$/;

123.看下面程式碼，給出輸出結果。

JavaScript

1

2

3

4

5

for(var i=1;i<=3;i ){

  setTimeout(function(){

      console.log(i);    

  },0);  

};

答案：4 4 4。

原因：Javascript事件處理器線上程空閒之前不會執行。追問，如何讓上述程式碼輸出1 2 3？

JavaScript

1

2

3

4

5

6

7

8

9

for(var i=1;i<=3;i ){

   setTimeout((function(a){  //改成立即執行函式

       console.log(a);    

   })(i),0);  

};

 

1           //輸出

2

3

124.寫一個function，清除字串前後的空格。（相容所有瀏覽器）

使用自帶介面trim()，考慮相容性：

JavaScript

1

2

3

4

5

6

7

8

9

if (!String.prototype.trim) {

 String.prototype.trim = function() {

 return this.replace(/^\s /, “”).replace(/\s $/,””);

 }

}

 

// test the function

var str = ” \t\n test string “.trim();

alert(str == “test string”); // alerts “true”

125..Javascript中callee和caller的作用？

答案：

caller是返回一個對函式的引用，該函式呼叫了當前函式；

callee是返回正在被執行的function函式，也就是所指定的function物件的正文。

那麼問題來了？如果一對兔子每月生一對兔子；一對新生兔，從第二個月起就開始生兔子；假定每對兔子都是一雌一雄，試問一對兔子，第n個月能繁殖成多少對兔子？（使用callee完成）
```javascript
var result=[];

function fn(n){  //典型的斐波那契數列

   if(n==1){

        return 1;

   }else if(n==2){

           return 1;

   }else{

        if(result[n]){

                return result[n];

        }else{

                //argument.callee()表示fn()

                result[n]=arguments.callee(n-1) arguments.callee(n-2);

                return result[n];

        }

   }

}
```


 

126. 你說你熱愛前端，那麼應該WEB行業的發展很關注吧？說說最近最流行的一些東西吧？

Node.js、Mongodb、npmM、MVVM、MEAN

127. 你有了解我們公司嗎？說說你的認識？

 因為我想去阿里，所以我針對阿里的說

 最羨慕就是在雙十一購物節，350.19億元，每分鐘支付79萬筆。海量資料，居然無一漏單、無一故障。太厲害了。

 

128. absolute的containingblock計算方式跟正常流有什麼不同？

129. position跟display、margin collapse、overflow、float這些特性相互疊加後會怎麼樣？

130. 對BFC規範的理解？（W3C CSS 2.1 規範中的一個概念,它決定了元素如何對其內容進行定位,以及與其他元素的關係和相互作用。）

131. 事件繫結和普通事件有什麼區別？

132. b繼承a的方法？

133. JavaScript中的作用域與變數宣告提升？

134. 一個頁面從輸入 URL 到頁面載入顯示完成，這個過程中都發生了什麼？（流程說的越詳細越好）

135. 你所知道的頁面效能優化方法有那些？

136. 除了前端以外還了解什麼其它技術麼？你最最厲害的技能是什麼？

137. AMD（Modules/Asynchronous-Definition）、CMD（Common ModuleDefinition）規範區別？

138 .談談你認為怎樣做能是專案做的更好？

139. 你對前端介面工程師這個職位是怎麼樣理解的？它的前景會怎麼樣？

140. 移動端（比如：Android IOS）怎麼做好使用者體驗?

141. 加班的看法

加班就像借錢，原則應當是——救急不救窮