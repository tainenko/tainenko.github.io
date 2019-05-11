---
layout: post
title:  "Cracking F2E interview part1"
author: tony
categories: [ Frontend,Interview ]
image: assets/images/f2e_interview.png
tags: [frontend,interview,javascript,css3,html5]
---

F2E面試筆記，題型分類：

## TCP（Transmission Control Protocol）

>TCP傳輸控制協議，是一種面向連接的、可靠的、基於字節流的傳輸層通信協議。通訊雙方建立一次tcp連接，需要經過三次步驟1、客戶端發送syn包（syn=j）到服務器，並入SYN_SEND狀態，等待服務器確認。2、服務器收入syn包，必須確認客戶的SYN（ack=j+1），同時自己也發送一個SYN包（syn=k），既SYN+ACK包，此時服務器進入SYN_RECV狀態。3、客戶端收到服務器的SYN+ACK包，向服務器發送確認包ACK（ack=k+1），此包發送完畢，客戶端和服務器進入ESTABLISHED狀態，完成三次握手。（tcp在握手過程中並不攜帶數據，而是在三次握手完成之後才會進行數據傳送）

SYN：synchronous 建立聯機

ACK：acknowledgement 確認

SYN_SENT 請求連接

SYN_RECV 服務端被動打開後，接收到了客戶端的SYN並且發送了ACK時的狀態，再進一步接收到客戶端的ACK就進入ESTABISHED狀態。

UDP（User Datagram Protocol ）用戶數據報協議

UDP是非面向連接協議，使用udp協議通訊並不需要建立連接，它只負責把數據盡可能發送出去，並不可靠，在接收端，UDP把每個消息斷放入隊列中，接收端程序從隊列中讀取數據。

TCP/IP是位於傳輸層上的一種協議，用於在網絡中傳輸數據；

## socket（嵌套字）

>socket是一組實現TCP/UDP通信的接口API，既無論TCP還是UDP，通過對scoket的編程，都可以實現TCP/UCP通信。（TCP或UDP是一種計算機網絡通信中在傳輸層的一種協議，可以簡單的理解成是一種約定，只有履行合同才是實質性的行動，所以無論是TCP還是UDP要產生作用，都需要有實際性的行為去執行才能體現協議的作用。socket就是實現這種作用的方法）socket作為一個通信鏈的句柄，它包含了網絡通信必備的5種信息。1、連接使用的協議。2、本地主機的IP地址。3、本地進程的協議端口。4、遠地主機的IP地址。5、遠地進程的協議端口。即可知道，socket包含了通信本方和對方的ip和端口以及連接使用的協議（TCP/UDP）。通信雙方中的一方（客戶端）通過socket對另一方（服務端）發起連接請求，服務端在網絡上監聽請求，當收到客戶端發來的請求之後，根據socket裏攜帶的信息，定位到客戶端，就相應請求，把socket描述發給客戶端，雙方確認之後連接就建立了。

socket連接過程的三個步驟

1. 服務器監聽：服務器實時監控網絡狀態等待客戶端發來的連接請求

2. 客戶端請求：客戶端根據遠程主機服務器的IP地址和協議端口向其發起連接請求

3. 連接確認：服務端收到socket的連接請求之後，就響應請求，把服務端socket描述發給客戶端，客戶端收到後一但確認。則雙方建立連接，進行數據交互。

socket連接一旦建立就保持連接狀態，而HTTP連接則不一樣，它基於tcp協議的短連接，也就是客戶端發起請求，服務器響應請求之後，連接就會自動斷開，不會一直保持。

## URL（Uniform Resource Locator）統一資源定位符

URL是因特網上標準的資源地址

URL標準格式：協議類型：[//服務器地址[:端口號]][/資源層級UNIX文件路徑]文件名？查詢

URL的語法規則：scheme：//host/domain:port/path/filename  (1、scheme：定義因特網服務的類型，最常見的有http。2、host：定義域主機（http默認主機是www）。3、domain：定義因特網域名，比如“www.baidu.com”。4、path：定義服務器上的路徑。5、filename：資源名)

scheme類型

1. http 超文本傳輸協議：以http：//開頭的不同網頁，不加密

2. https 安全超文本傳輸協議。安全網頁，加密所有信息交換

3. ftp 文件傳輸協議 用於將文件下載或上傳

4. file 本地文件

HTTP協議是應用層協議，基於TCP協議，用於包裝數據，程序使用它進行通信，可以簡單高效的處理通信中數據的傳輸和識別處理

## DNS（Domain Name Server）域名服務器

DNS是進行域名(domain name)和與之相對應的IP地址 (IP address)轉換的服務器。DNS中保存了一張域名(domain name)和與之相對應的IP地址 (IP address)的表，以解析消息的域名。

在瀏覽器輸入域名後的解析過程

瀏覽器根據地址去本身緩存中查找dns解析記錄，如果有，則直接返回IP地址，否則瀏覽器會查找操作系統中（hosts文件）是否有該域名的dns解析記錄，如果有則返回。

如果瀏覽器緩存和操作系統hosts中均無該域名的dns解析記錄，或者已經過期，此時就會向域名服務器發起請求來解析這個域名。

請求會先到LDNS（本地域名服務器），讓它來嘗試解析這個域名，如果LDNS也解析不了，則直接到根域名解析器請求解析

根域名服務器給LDNS返回一個所查詢余的主域名服務器（gTLDServer）地址。

此時LDNS再向上一步返回的gTLD服務器發起解析請求。

gTLD服務器接收到解析請求後查找並返回此域名對應的Name Server域名服務器的地址，這個Name Server通常就是你註冊的域名服務器（比如阿裏dns、騰訊dns等）

Name Server域名服務器會查詢存儲的域名和IP的映射關系表，正常情況下都根據域名得到目標IP記錄，連同一個TTL值返回給DNS Server域名服務器

返回該域名對應的IP和TTL值，Local DNS Server會緩存這個域名和IP的對應關系，緩存的時間有TTL值控制。

把解析的結果返回給用戶，用戶根據TTL值緩存在本地系統緩存中，域名解析過程結束。

## HTTP請求發起和響應

在一個web程序開發中，一般都有前端和後端之分，前端負責向後端請求數據和展示頁面，後端負責接收請求和做出響應發回給前端，他們之間的協作橋梁是API，而API其實就是一個URL，作為HTTP連接的一種具體載體。

用戶輸入URL到瀏覽器顯現給用戶頁面經過了什麽過程

用戶輸入URL，瀏覽器獲取到URL

瀏覽器(應用層)進行DNS解析（直接輸入IP地址既跳過該步驟）

根據解析出的IP地址+端口，瀏覽器（應用層）發起HTTP請求，請求中攜帶（請求頭header（也可細分為請求行和請求頭）、請求體body）

請求到達傳輸層，tcp協議為傳輸報文提供可靠的字節流傳輸服務，它通過三次握手等手段來保證傳輸過程中的安全可靠。通過對大塊數據的分割成一個個報文段的方式提供給大量數據的便攜傳輸。

到網絡層， 網絡層通過ARP尋址得到接收方的Mac地址，IP協議把在傳輸層被分割成一個個數據包傳送接收方。

數據到達數據鏈路層，請求階段完成

接收方在數據鏈路層收到數據包之後，層層傳遞到應用層，接收方應用程序就獲得到請求報文。

接收方收到發送方的HTTP請求之後，進行請求文件資源（如HTML頁面）的尋找並響應報文

發送方收到響應報文後，如果報文中的狀態碼表示請求成功，則接受返回的資源（如HTML文件），進行頁面渲染。

（header：1、請求的方法（get、post、put..）2、協議（http、https、ftp、sftp…）3目標url（具體的請求路徑已經文件名）4一些必要信息（緩存、cookie之類）。)

（body包含請求的內容）

## 頁面渲染過程

![頁面渲染過程](https://img1.mukewang.com/5c2d835d00012d2514230720.jpg)

內容解釋

HTML parser：HTML解析器，其本質是將HTML文本解釋成DOM tree。

CSS  parser：CSS解析器，其本質是講DOM中各元素對象加入樣式信息

JavaScript引擎：專門處理JavaScript腳本的虛擬機，其本質是解析JS代碼並且把邏輯（HTML和CSS的操作）應用到布局中，從而按程序要的要求呈現相應的結果

DOM tree:文檔對象模型樹，也就是瀏覽器通過HTMLparser解析HTML頁面生成的HTML樹狀結構以及相應的接口。

render tree：渲染樹，也就是瀏覽器引擎通過DOM Tree和CSS Rule Tree構建出來的一個樹狀結構，和dom tree不一樣的是，它只有要最終呈現出來的內容，像或者帶有display:none的節點是不存在render tree中的。

layout：也叫reflow 重排，渲染中的一種行為。當rendertree中任一節點的幾何尺寸發生改變了，render tree都會重新布局。

repaint：重繪，渲染中的一種行為。render tree中任一元素樣式屬性（幾何尺寸沒改變）發生改變了，render tree都會重新畫，比如字體顏色、背景等變化。

## href與src

href (Hypertext Reference)指定網絡資源的位置，從而在當前元素或者當前文檔和由當前屬性定義的需要的錨點或資源之間定義一個鏈接或者關系。（目的不是為了引用資源，而是為了建立聯系，讓當前標簽能夠鏈接到目標地址。）

src source（縮寫），指向外部資源的位置，指向的內容將會應用到文檔中當前標簽所在位置。

href與src的區別

1. 請求資源類型不同：href 指向網絡資源所在位置，建立和當前元素（錨點）或當前文檔（鏈接）之間的聯系。在請求 src 資源時會將其指向的資源下載並應用到文檔中，比如 JavaScript 腳本，img 圖片；

2. 作用結果不同：href 用於在當前文檔和引用資源之間確立聯系；src 用於替換當前內容；

3. 瀏覽器解析方式不同：當瀏覽器解析到src ，會暫停其他資源的下載和處理，直到將該資源加載、編譯、執行完畢，圖片和框架等也如此，類似於將所指向資源應用到當前內容。這也是為什麽建議把 js 腳本放在底部而不是頭部的原因。

## link和@import的區別

兩者都是外部引用 CSS 的方式，但是存在一定的區別：

1. link是XHTML標簽，除了能夠加載CSS，還可以定義RSS等其他事務；而@import屬於CSS範疇，只可以加載CSS。

2. link引用CSS時，在頁面載入時同時加載；@import需要頁面完全載入以後再加載。

3. link是XHTML標簽，無兼容問題；@import則是在CSS2.1提出的，低版本的瀏覽器不支持。

4. link支持使用Javascript控制DOM改變樣式；而@import不支持。

## HTML

1.) HTML5的新特性：

新的內容標簽：header nav content footer article aside

更好的單元格體系:

音頻、視頻API:video radio

畫布(Canvas) API

地理(Geolocation) API

網頁存儲(Web storage) API:localStorage,sessionStorage

拖拽釋放(Drag and drop) API

2.) Doctype作用？標準模式與兼容模式各有什麽區別?

\<!DOCTYPE>聲明位於位於HTML文檔中的第一行，處於 \<html> 標簽之前。告知瀏覽器的解析器用什麽文檔標準解析這個文檔。DOCTYPE不存在或格式不正確會導致文檔以兼容模式呈現。  

3.) 行內元素有哪些？塊級元素有哪些？ 空(void)元素有那些？



首先：CSS規範規定，每個元素都有display屬性，確定該元素的類型，每個元素都有默認的display值，如div的display默認值為“block”，則為“塊級”元素；span默認display屬性值為“inline”，是“行內”元素。

i. 行內元素有：a b span img input select strong（強調的語氣）
ii. 塊級元素有：div ul ol li dl dt dd h1 h2 h3 h4…p
iii. 常見的空元素：    \<br> \<hr> \<img> \<input> \<link> \<meta>
iiii. 鮮為人知的是：    \<area> \<base> \<col> \<command> \<embed> \<keygen> \<param> \<source> \<track> \<wbr>
不同瀏覽器（版本）、HTML4（5）、CSS2等實際略有差異  

4.)  介紹一下你對瀏覽器內核的理解？

主要分成兩部分：渲染引擎(layout engineer或Rendering Engine)和JS引擎。
渲染引擎：負責取得網頁的內容（HTML、XML、圖像等等）、整理訊息（例如加入CSS等），以及計算網頁的顯示方式，然後會輸出至顯示器或打印機。瀏覽器的內核的不同對於網頁的語法解釋會有不同，所以渲染的效果也不相同。所有網頁瀏覽器、電子郵件客戶端以及其它需要編輯、顯示網絡內容的應用程序都需要內核。

JS引擎則：解析和執行javascript來實現網頁的動態效果。

最開始渲染引擎和JS引擎並沒有區分的很明確，後來JS引擎越來越獨立，內核就傾向於只指渲染引擎。

常見內核
Trident內核：IE,MaxThon,TT,The World,360,搜狗瀏覽器等。[又稱MSHTML]
Gecko內核：Netscape6及以上版本，FF,MozillaSuite/SeaMonkey等
Presto內核：Opera7及以上。      [Opera內核原為：Presto，現為：Blink;]
Webkit內核：Safari,Chrome等。   [ Chrome的：Blink（WebKit的分支）]  

5.) 請描述一下 cookies，sessionStorage 和 localStorage 的區別？

cookie是網站為了標示用戶身份而儲存在用戶本地終端（Client Side）上的數據（通常經過加密）。
cookie數據始終在同源的http請求中攜帶（即使不需要），記會在瀏覽器和服務器間來回傳遞。
sessionStorage和localStorage不會自動把數據發給服務器，僅在本地保存。

存儲大小：
    cookie數據大小不能超過4k。
    sessionStorage和localStorage 雖然也有存儲大小的限制，但比cookie大得多，可以達到5M或更大。

有期時間：
    localStorage    存儲持久數據，瀏覽器關閉後數據不丟失除非主動刪除數據；
    sessionStorage  數據在當前瀏覽器窗口關閉後自動刪除。
    cookie          設置的cookie過期時間之前一直有效，即使窗口或瀏覽器關閉  
    
6.) iframe有那些缺點？

iframe會阻塞主頁面的Onload事件；
搜索引擎的檢索程序無法解讀這種頁面，不利於SEO;
iframe和主頁面共享連接池，而瀏覽器對相同域的連接有限制，所以會影響頁面的並行加載。
使用iframe之前需要考慮這兩個缺點。如果需要使用iframe，最好是通過javascript動態給iframe添加src屬性值，這樣可以繞開以上兩個問題  

7.) 如何實現瀏覽器內多個標簽頁之間的通信? (阿裏)
WebSocket、SharedWorker；也可以調用localstorge、cookies等本地存儲方式；  
localstorge另一個瀏覽上下文裏被添加、修改或刪除時，它都會觸發一個事件，我們通過監聽事件，控制它的值來進行頁面信息通信；  
註意quirks：Safari 在無痕模式下設置localstorge值時會拋出QuotaExceededError 的異常  

8.) HTML5的離線儲存怎麽使用，工作原理能不能解釋一下？

在用戶沒有與因特網連接時，可以正常訪問站點或應用，在用戶與因特網連接時，更新用戶機器上的緩存文件。  
原理：HTML5的離線存儲是基於一個新建的.appcache文件的緩存機制(不是存儲技術)，通過這個文件上的解析清單離線存儲資源，這些資源就會像cookie一樣被存儲了下來。之後當網絡在處於離線狀態下時，瀏覽器會通過被離線存儲的數據進行頁面展示。  

如何使用：
i. 頁面頭部像下面一樣加入一個manifest的屬性；
i. 在cache.manifest文件的編寫離線存儲的資源；
    CACHE MANIFEST
    #v0.11
    CACHE:
    js/app.js
    css/style.css
    NETWORK:
    resourse/logo.png
    FALLBACK:
    / /offline.html
i. 在離線狀態時，操作window.applicationCache進行需求實現。


10.) CSS  

1.CSS選擇符有哪些？哪些屬性可以繼承？  
    a. id選擇器（ # myid）  
    b. 類選擇器（.myclassname）  
    c. 選擇器（div, h1, p）  
    d. 相鄰選擇器（h1 + p）  
    e. 子選擇器（ul > li）  
    f. 後代選擇器（li a）  
    g. 通配符選擇器（ * ）  
    h. 屬性選擇器（a[rel = "external"]）  
    i. 偽類選擇器（a:hover, li:nth-child）  

*   可繼承的樣式： font-size font-family color, UL LI DL DD DT;
*   不可繼承的樣式：border padding margin width height ;

2. CSS優先級算法如何計算？
*   優先級就近原則，同權重情況下樣式定義最近者為準;
*   載入樣式以最後載入的定位為準;

優先級為:  
    同權重: 內聯樣式表（標簽內部）> 嵌入樣式表（當前文件中）> 外部樣式表（外部文件中）。  
    !important >  id > class > tag  
    important 比 內聯優先級高  
    
3. CSS3新增偽類有那些？  
  
  舉例：
  
    p:first-of-type 選擇屬於其父元素的首個 <p> 元素的每個 <p> 元素。
    p:last-of-type  選擇屬於其父元素的最後 <p> 元素的每個 <p> 元素。
    p:only-of-type  選擇屬於其父元素唯一的 <p> 元素的每個 <p> 元素。
    p:only-child        選擇屬於其父元素的唯一子元素的每個 <p> 元素。
    p:nth-child(2)  選擇屬於其父元素的第二個子元素的每個 <p> 元素。

    :after          在元素之前添加內容,也可以用來做清除浮動。
    :before         在元素之後添加內容
    :enabled        
    :disabled       控制表單控件的禁用狀態。
    :checked        單選框或覆選框被選中。
    
4. 如何居中div？  
i. 水平居中：給div設置一個寬度，然後添加margin:0 auto屬性

    div{
        width:200px;
        margin:0 auto;
     }

i. 水平垂直居中一  

確定容器的寬高 寬500 高 300 的層
設置層的外邊距  

    div {
        position: relative;     /* 相對定位或絕對定位均可 */
        width:500px; 
        height:300px;
        top: 50%;
        left: 50%;
        margin: -150px 0 0 -250px;      /* 外邊距為自身寬高的一半 */
        background-color: pink;     /* 方便看效果 */
    
     }

i. 水平垂直居中二  

未知容器的寬高，利用 `transform` 屬性  

    div {
        position: absolute;     /* 相對定位或絕對定位均可 */
        width:500px; 
        height:300px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        background-color: pink;     /* 方便看效果 */
    
    }

i. 水平垂直居中三  

利用 flex 布局  
實際使用時應考慮兼容性  

    .container {
        display: flex; 
        align-items: center;        /* 垂直居中 */
        justify-content: center;    /* 水平居中 */
    
    }
    .container div {
        width: 100px;
        height: 100px;
        background-color: pink;     /* 方便看效果 */
    }
    
5. CSS3有哪些新特性？

 新增各種CSS選擇器  （: not(.input)：所有 class 不是“input”的節點）
  圓角            （border-radius:8px）
  多列布局      （multi-column layout）
  陰影和反射   （Shadow\Reflect）
  文字特效      （text-shadow、）
  文字渲染      （Text-decoration）
  線性漸變      （gradient）
  旋轉            （transform）
  縮放,定位,傾斜,動畫,多背景
  例如:transform:\scale(0.85,0.90)\ translate(0px,-30px)\ skew(-9deg,0deg)\Animation:  
  
6. 請解釋一下CSS3的Flexbox（彈性盒布局模型）,以及適用場景？

 一個用於頁面布局的全新CSS3功能，Flexbox可以把列表放在同一個方向（從上到下排列，從左到右），並讓列表能延伸到占用可用的空間。
 較為覆雜的布局還可以通過嵌套一個伸縮容器（flex container）來實現。
 采用Flex布局的元素，稱為Flex容器（flex container），簡稱"容器"。
 它的所有子元素自動成為容器成員，稱為Flex項目（flex item），簡稱"項目"。
 常規布局是基於塊和內聯流方向，而Flex布局是基於flex-flow流可以很方便的用來做局中，能對不同屏幕大小自適應。
 在布局上有了比以前更加靈活的空間。
 
7. 為什麽要初始化CSS樣式

- 因為瀏覽器的兼容問題，不同瀏覽器對有些標簽的默認值是不同的，如果沒對CSS初始化往往會出現瀏覽器之間的頁面顯示差異。

- 當然，初始化樣式會對SEO有一定的影響，但魚和熊掌不可兼得，但力求影響最小的情況下初始化。

最簡單的初始化方法： 

    * {padding: 0; margin: 0;} （強烈不建議）

淘寶的樣式初始化代碼：

    body, h1, h2, h3, h4, h5, h6, hr, p, blockquote, dl, dt, dd, ul, ol, li, pre, form, fieldset, legend, button, input, textarea, th, td { margin:0; padding:0; }
    body, button, input, select, textarea { font:12px/1.5tahoma, arial, \5b8b\4f53; }
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

11. js

i. js的基本數據類型。

 Undefined、Null、Boolean、Number、String、
 ECMAScript 2015 新增:Symbol(創建後獨一無二且不可變的數據類型 )
 
i. JavaScript原型，原型鏈 ? 有什麽特點？

每個對象都會在其內部初始化一個屬性，就是prototype(原型)，當我們訪問一個對象的屬性時，
如果這個對象內部不存在這個屬性，那麽他就會去prototype裏找這個屬性，這個prototype又會有自己的prototype，
於是就這樣一直找下去，也就是我們平時所說的原型鏈的概念。
關系：instance.constructor.prototype = instance.__proto__

特點：
JavaScript對象是通過引用來傳遞的，我們創建的每個新對象實體中並沒有一份屬於自己的原型副本。當我們修改原型時，與之相關的對象也會繼承這一改變。

 當我們需要一個屬性的時，Javascript引擎會先看當前對象中是否有這個屬性， 如果沒有的話，就會查找他的Prototype對象是否有這個屬性，如此遞推下去，一直檢索到 Object 內建對象。   
 
     function Func(){}
            Func.prototype.name = "Sean";
            Func.prototype.getInfo = function() {      return this.name;
            }    var person = new Func();//現在可以參考var person = Object.create(oldObject);
            console.log(person.getInfo());//它擁有了Func的屬性和方法
            //"Sean"    console.log(Func.prototype);    // Func { name="Sean", getInfo=function()}
            
i. 如何實現數組的隨機排序？

方法一： 
```javascript 
 
　　var arr = [1,2,3,4,5,6,7,8,9,10]; 
     function randSort1(arr){ 
        for(var i = 0,len = arr.length;i < len; i++ ){ 
            var rand = parseInt(Math.random()*len); 
            var temp = arr[rand]; 
            arr[rand] = arr[i]; 
            arr[i] = temp; 
        }         return arr;
     }
     console.log(randSort1(arr));
 
```
方法二：
```javascript        var arr = [1,2,3,4,5,6,7,8,9,10];        function randSort2(arr){            var mixedArray = [];            while(arr.length > 0){                var randomIndex = parseInt(Math.random()*arr.length);
                mixedArray.push(arr[randomIndex]);
                arr.splice(randomIndex, 1);
            }            return mixedArray;
        }
        console.log(randSort2(arr));
 
```
方法三：
```javascript        var arr = [1,2,3,4,5,6,7,8,9,10];
        arr.sort(function(){            return Math.random() - 0.5;
        })
        console.log(arr);
4.Javascript如何實現繼承？

- 構造繼承
- 原型繼承
- 實例繼承
- 拷貝繼承

原型prototype機制或apply和call方法去實現較簡單，建議使用構造函數與原型混合方式。
```javascript        function Parent(){            this.name = 'wang';
        }        function Child(){            this.age = 28;
        }
        Child.prototype = new Parent();//繼承了Parent，通過原型

        var demo = new Child();
        alert(demo.age);
        alert(demo.name);//得到被繼承的屬性
```        
5.javascript創建對象的幾種方式？

javascript創建對象簡單的說,無非就是使用內置對象或各種自定義對象，當然還可以用JSON；但寫法有很多種，也能混合使用。1、對象字面量的方式

    person={firstname:"Mark",lastname:"Yun",age:25,eyecolor:"black"};2、用function來模擬無參的構造函數    function Person(){}    var person=new Person();//定義一個function，如果使用new"實例化",該function可以看作是一個Class
    person.name="Mark";
    person.age="25";
    person.work=function(){
    alert(person.name+" hello...");
    }
    person.work();3、用function來模擬參構造函數來實現（用this關鍵字定義構造的上下文屬性）    function Pet(name,age,hobby){       this.name=name;//this作用域：當前對象
       this.age=age;       this.hobby=hobby;       this.eat=function(){
          alert("我叫"+this.name+",我喜歡"+this.hobby+",是個程序員");
       }
    }    var maidou =new Pet("麥兜",25,"coding");//實例化、創建對象
    maidou.eat();//調用eat方法4、用工廠方式來創建（內置對象）     var wcDog =new Object();
     wcDog.name="旺財";
     wcDog.age=3;
     wcDog.work=function(){
       alert("我是"+wcDog.name+",汪汪汪......");
     }
     wcDog.work();5、用原型方式來創建    function Dog(){

     }
     Dog.prototype.name="旺財";
     Dog.prototype.eat=function(){
     alert(this.name+"是個吃貨");
     }     var wangcai =new Dog();
     wangcai.eat();5、用混合方式來創建    function Car(name,price){      this.name=name;      this.price=price; 
    }
     Car.prototype.sell=function(){
       alert("我是"+this.name+"，我現在賣"+this.price+"萬元");
      }    var camry =new Car("凱美瑞",27);
    camry.sell();
6.閉包

閉包是指有權訪問另一個函數作用域中變量的函數，創建閉包的最常見的方式就是在一個函數內創建另一個函數，通過另一個函數訪問這個函數的局部變量,利用閉包可以突破作用鏈域，將函數內部的變量和方法傳遞到外部。

閉包的特性：1.函數內再嵌套函數2.內部函數可以引用外層的參數和變量3.參數和變量不會被垃圾回收機制回收//li節點的onclick事件都能正確的彈出當前被點擊的li索引
```
 <ul id="testUL">
    <li> index = 0</li>
    <li> index = 1</li>
    <li> index = 2</li>
    <li> index = 3</li>
</ul>
<script type="text/javascript">    var nodes = document.getElementsByTagName("li");    for(i = 0;i<nodes.length;i+= 1){
        nodes[i].onclick = (function(i){                  return function() {
                     console.log(i);
                  } //不用閉包的話，值每次都是4                })(i);
    }</script>執行say667()後,say667()閉包內部變量會存在,而閉包內部函數的內部變量不會存在
```
使得Javascript的垃圾回收機制GC不會收回say667()所占用的資源
因為say667()的內部函數的執行需要依賴say667()中的變量
這是對閉包作用的非常直白的描述  
```function say667() {    // Local variable that ends up within closure
    var num = 666;    var sayAlert = function() {
        alert(num);
    }
    num++;    return sayAlert;
} var sayAlert = say667();
 sayAlert()//執行結果應該彈出的667
```
7. Ajax 是什麽? 如何創建一個Ajax？

ajax的全稱：Asynchronous Javascript And XML。
異步傳輸+js+xml。
所謂異步，在這裏簡單地解釋就是：向服務器發送請求的時候，我們不必等待結果，而是可以同時做其他的事情，等到有了結果它自己會根據設定進行後續操作，與此同時，頁面是不會發生整頁刷新的，提高了用戶體驗。

(1)創建XMLHttpRequest對象,也就是創建一個異步調用對象
(2)創建一個新的HTTP請求,並指定該HTTP請求的方法、URL及驗證信息
(3)設置響應HTTP請求狀態變化的函數
(4)發送HTTP請求
(5)獲取異步調用返回的數據
(6)使用JavaScript和DOM實現局部刷新