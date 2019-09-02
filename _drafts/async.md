async await、Promise、setTimeout执行顺序
由题目见真知：

【题目】

async function async1(){
   console.log('async1 start');
    await async2();
    console.log('async1 end')
}
async function async2(){
    console.log('async2')
}
console.log('script start');
setTimeout(function(){
    console.log('setTimeout')
},0);
async1();
new Promise(function(resolve){
    console.log('promise1');
    resolve();
}).then(function(){
    console.log('promise2')
});
console.log('script end')
复制代码
答案：

script start
async1 start
async2
promise1
script end
promise2
async1 end
setTimeout
复制代码
相关知识点：

阮一峰老师的解释我觉得更容易理解：

async 函数返回一个 Promise 对象，当函数执行的时候，一旦遇到 await 就会先返回，等到触发的异步操作完成，再接着执行函数体内后面的语句。 可以理解为，是让出了线程，跳出了async 函数体

然后,下面的这个输出顺序，和我们预想的不一样啊

async1 end
promise2
复制代码
==async==

async function 声明将定义一个返回 AsyncFunction 对象的异步函数。
当调用一个 async 函数时，会返回一个 Promise 对象。
当这个 async 函数返回一个值时，Promise 的 resolve 方法会负责传递这个值；
当 async 函数抛出异常时，Promise 的 reject 方法也会传递这个异常值。

所以你现在知道咯，使用 async 定义的函数，当它被调用时，它返回的其实是一个Promise对象。

我们再来看看 await 表达式执行会返回什么值。

await

语法：[return_value] = await expression; 表达式（express）：一个 Promise 对象或者任何要等待的值。 返回值（return_value）：返回 Promise 对象的处理结果。如果等待的不是 Promise 对象，则返回该值本身。

所以，当await操作符后面的表达式是一个Promise的时候，它的返回值，实际上就是Promise的回调函数resolve的参数。

明白了这两个事情后，我还要再啰嗦两句。我们都知道Promise是一个立即执行函数，但是他的成功（或失败：reject）的回调函数resolve却是一个异步执行的回调。
当执行到resolve()时，这个任务会被放入到回调队列中，等待调用栈有空闲时事件循环再来取走它。

解题思路：
执行到 async1 这个函数时，首先会打印出“async1 start”（这个不用多说了吧，async 表达式定义的函数也是立即执行的）；

然后执行到 await async2()，发现 async2 也是个 async 定义的函数，所以直接执行了“console.log('async2')”，同时async2返回了一个Promise，划重点：此时返回的Promise会被放入到回调队列中等待，await会让出线程（js是单线程还用我介绍吗），接下来就会跳出 async1函数 继续往下执行。

然后执行到 new Promise，前面说过了promise是立即执行的，所以先打印出来“promise1”，然后执行到 resolve 的时候，resolve这个任务就被放到回调队列中（前面都讲过了上课要好好听啊喂）等待，然后跳出Promise继续往下执行，输出“script end”。

接下来是重头戏。同步的事件都循环执行完了，调用栈现在已经空出来了，那么事件循环就会去回调队列里面取任务继续放到调用栈里面了。

这时候取到的第一个任务，就是前面 async1 放进去的Promise，执行Promise时发现又遇到了他的真命天子resolve函数，划重点：这个resolve又会被放入任务队列继续等待，然后再次跳出 async1函数 继续下一个任务。

接下来取到的下一个任务，就是前面 new Promise 放进去的 resolve回调 啦 yohoo～这个resolve被放到调用栈执行，并输出“promise2”，然后继续取下一个任务。

后面的事情相信你已经猜到了，没错调用栈再次空出来了，事件循环就取到了下一个任务：历经千辛万苦终于轮到的那个Promise的resolve回调！！！执行它（啥也不会打印的，因为 async2 并没有return东西，所以这个resolve的参数是undefined），此时 await 定义的这个 Promise 已经执行完并且返回了结果，所以可以继续往下执行 async1函数 后面的任务了，那就是“console.log('async1 end')”。

然后同步(这里的回调是可以算成同步，有的时候勉强成异步)的执行完了，开始执行等待队列中的定时器，输出 setTimeout

总结
调用栈
事件循环
任务队列
promise的回调函数执行
async表达式的返回值
await表达式的作用和返回值
队列任务优先级：promise.Trick()>promise的回调>setTimeout>setImmediate

至此，该题的输出结果分析完毕了，这类的执行结果可以用一句话总结，先执行同步代码，遇到异步代码就先加入队列，然后按入队的顺序执行异步代码，最后执行setTimeout队列的代码。

原文地址：https://lvdingjin.github.io/tech/2018/05/27/async-and-await.html

JavaScript 同步延遲 ( Promise + setTimeout ) 
過去在寫 JavaScript 使用的同步延遲，都是用非同步的 setTimeout 加上 callback 來實現，但如果有很多個任務或流程要執行，就得用上一大堆的 callback，然而 JavaScript 裡的 Promise ，剛好就可以用來解決同步與非同步的問題，讓整個延遲的過程可以很漂亮且同步的「串」在一起。

同步非同步
一般來說 JavaScript 裡面有分成同步 sync 和非同步 async，在同步模式下，每個任務必須按照順序執行，後面的任務必須等待前面的任務執行完成，非同步模式則相反，後面的任務不用等前面的，各自執行各自的任務，例如setTimeout、setInterval都是這種模式。

延伸閱讀：非同步(Asynchronous)與同步(Synchronous)的差異



如果 JavaScript 撰寫成下面這樣，結果並不會如果們預期的「等待一秒後出現 A，出現 A 後等待一秒再出現 B」，反而是等待一秒後 A、B 同時出現，所以變成傳統在實作的時候，就要寫很多的 callback 來滿足同步的情況。

setTimeout(function(){
    console.log('A');
},1000);

setTimeout(function(){
    console.log('B');
},1000);
Promise
為了解決同步非同步的問題，我開始學習 Promise，剛接觸 Promise 的時候實在是有點頭昏腦脹，因為網路上的資料很多，但總找不到一個合適的範例展示，導致一直沒辦法深入理解，後來找到了下面這兩篇相當完整且豐富的教學，也讓我終於踏入了 Promise 的世界，由於這兩篇文章已經相當完整，就不在這邊做描述，有興趣的可以點進去看看。

從 Promise 開始的 JavaScript 異步生活
JavaScript Promise 迷你書（ 中文版 )
簡單來說，Promise 就是「承諾」，可以想像成 A 承諾 B 要去辦事，辦完之後才會回報結果，而這個結果只有兩種狀況：成功與失敗，不會有處於成功失敗不明的中間狀況。

所以換成程式的講法，要使用 Promise，一開始要先 new 一個 Promise 物件，物件中的建構式包含兩個參數：resolve ( 成功 ) 與 reject ( 失敗 )。

基本創建 Promise 的方法如下，resolve 在函式或流程成功，或有合法值的狀況下會執行，reject 則是在失敗或有錯誤的時候會執行，resolve 和 reject 都有一個回傳值，可將這個會傳值透過.then傳給下一個流程。

function asyncFunction(value) {
  return new Promise(function(resolve, reject){
    if(value){
      resolve(value) // 已實現，成功
    }else{
      reject(reason) // 有錯誤，已拒絕，失敗
    }
  });
}
同步延遲
大概知道用法之後，先來個簡單的例子，建立一個 delay 的流程，流程裡有個setTimeout，在延遲一秒後，將 resolve 成功的值透過.then傳下去。

function delay() {   
  return new Promise(function (resolve, reject) {
    setTimeout(function () {
      resolve('我是傳下去的值');
    }, 1000);
  });
}

delay().then(function (value) {
  console.log(value);    // '我是傳下去的值'
}).catch(function (error) {
  console.log(error);
});
不過這樣只有寫，跟純粹setTimeout的結果看起來沒什麼差異，因為只延遲了一次而已，現在換個例子，讓顯示的文字延遲三次，每次都延遲一秒，如果是傳統setTimeout的寫法就會像下面這樣：三個流程 + 兩個 callback，不僅越來越難閱讀，維護成本相對也越來越高。

setTimeout(function(){
  console.log(1);  // 顯示 1
  a(2);            // 呼叫 a 顯示 2
});

function a(v){
  setTimeout(function(){
    console.log(v);  // 延遲一秒之後顯示 2
    b(3);            // 延遲一秒之後呼叫 b 來顯示 3
  },1000);
}

function b(v){
  setTimeout(function(){
  console.log(v);    // 延遲一秒之後顯示 3
  },1000);
}
如果換成 Promise 的做法，就可以把 setTimeout 放到 Promise 裡面，同時可以設定一個變數作為延遲的毫秒數，接下來就可以使用.then來做串接，在每一個 then 裡頭，再 return 一個 Promise 物件，就可以繼續使用.then串接下去，實際完成之後，應該就會看到 123 依序隔一秒才出現，寫法上也就更為清楚簡潔。

範例展示：demo-01.html

var delay = function(s){
  return new Promise(function(resolve,reject){
   setTimeout(resolve,s); 
  });
};

delay().then(function(){
  console.log(1);     // 顯示 1
  return delay(1000); // 延遲ㄧ秒
}).then(function(){
  console.log(2);     // 顯示 2
  return delay(1000); // 延遲一秒
}).then(function(){
  console.log(3);     // 顯示 3
});
resolve 回傳值
當 resolve 有合法值的時候，可將這個值傳遞下去使用，但 resolve 只能有一個回傳值 (resolve(value))，所以如果有兩個以上，則必須透過陣列或是物件來傳遞，舉例來說 delay 有兩個變數，第一個變數是顯示的文字，第二個則是延遲的秒數，透過resolve([r,s]);就能不斷地將值傳遞下去，結果就會是先顯示「a 0」，延遲一秒後顯示「b 1000」，延遲兩秒後顯示「c 2000」。

範例展示：demo-02.html

var delay = function(r,s){
  return new Promise(function(resolve,reject){
   setTimeout(function(){
     resolve([r,s]);
   },s); 
  });
};

delay('a',0).then(function(v){
  console.log(v[0],v[1]);   // 顯示 a 0
  return delay('b',1000);   // 延遲一秒之後，告訴後面的函示顯示 b 1000
}).then(function(v){
  console.log(v[0],v[1]);   // 顯示 b 1000
  return delay('c',2000);   // 延遲兩秒之後，告訴後面的函示顯示 c 2000
}).then(function(v){
  console.log(v[0],v[1]);   // 顯示 c 2000
});
小結
以上就是透過 Promise + setTimeout 所實現的同步延遲，但在 ES7 開始其實有 async、await、delay 的用法 ( 聽說用過就會上癮了 )，就等瀏覽器全面支援後，應該就可以更方便的使用囉！

4月 12, 2017


JavaScript async/await 的奇淫技巧

話說，最新的 ECMAScript 已經引入了 async/await 語法，讓開發者可以更容易控制非同步的程式邏輯，換言之，我們可以減少許多 callback 的使用，讓 JavaScript 這種單線程、事件驅動的程式語言更易讀、好寫。

關於 async/await 的基礎使用，有興趣的人可以參考舊文「JavaScript 好用的 async 異步函數！」，而本文將探討更多實際使用上的小技巧。

另外，瀏覽器不一定有支援 async/await，你可以在新版的 Node.js 上面測試本文的內容。

呼叫 async 函數與一般的函數沒有差別

想像一下，async 函數就是一個在執行後會回傳 Promise 物件的「普通函數」，和一般常見的函數的使用差異，僅僅只是 async 函數在執行後「不是回傳函數執行結果」。這代表我們可以把 async 函數當作一般函數來呼叫使用，用法一模一樣。

async/await 與 Promise 是可以共通的

非常有趣，async 函數與 Promise 其實能夠共通，這代表我們可以玩一些特別的組合技。所以，若要把 async/await 玩得通透，建議你盡量熟悉 Promise 的各種用法。

實現 delay 函數

過去因為單線程和事件驅動的關係，JavaScript 不可能實現一個沒有嚴重副作用的 delay 函數，所以取而代之的是使用 setTimeout() 加上 callback 來實現「一定時間後執行什麼工作」的需要。

不過來到 async/await 的世界後，我們可以一行行描述程式邏輯，無論是不是同步（Synchronous）的程式碼，所以我們可以用 Promise 來包裝 setTimeout()，以實現一個在 async 函數裡可以跑的 delay 函數：

// 實現一個等待函數
const delay = (interval) => {
    return new Promise((resolve) => {
        setTimeout(resolve, interval);
    });
};

const main = async () => {
    console.log('Starting...');

    // 等待五秒
    await delay(5000);
    
    console.log('Done after five seconds')
};

main();

與 .map() 的組合技

JavaScript 陣列裡常使用的 .map() 方法，但是 .map() 方法內的處理函數是同步的（synchronous），也就是如果我們想在裡面跑非同步的邏輯，是沒辦法等到我們非同步的工作完成的。

假設我們有一個陣列，然後使用 .map() 方法操作它：

const arr = [ 1, 2, 3, 4, 5 ];

let results = arr.map((num) => {
    return num + 1;
});

// [ 2, 3, 4, 5, 6 ]
console.log(results);

通常，如果我們想引入非同步邏輯，我們可以這樣做，直接代換 .map() 內的處理函數就可以：

const asyncWorker = async (num) => {
    // 非同步的工作，會做一段時間
};

let results = arr.map(async (num) => {
    // 等待非同步工作完成
    await asyncWorker(num);
    
    return num + 1;
});

特別注意，引入 async 以後，results 會是一堆的 Promise 物件，而不是一個數值陣列。而且 .map 並不會等 asyncWorker() 這個非同步的工作做完才回傳，你可以想像這是一種「射後不理」的機制。

等 .map() 裡的所有工作處理完

既然 async 函數被執行後，會回傳一個 Promise，這代表我們可以藉由 Promise 物件來得知工作什麼時候完成。所以我們可以這樣做：

const asyncWorker = async (num) => {
    // 非同步的工作，會做一段時間
};

let jobs = arr.map(async (num) => {
    // 等待非同步工作完成
    await asyncWorker(num);
    
    return num + 1;
});

// 當所有工作完成後，顯示執行內容
Promise.all(jobs).then((results) => {
    // [ 2, 3, 4, 5, 6 ]
    console.log(results);
});

用 await 取代 promise.then() 的使用方式

前面說到可以運用 Promise.all() 方法來等待所有的非同步工作完成，但最終還是回到了 callback 的模式進行等待。而且，總是有懶惰鬼開發者會把這些程式碼寫成一行，非常不好讀：

Promise.all(arr.map(async (num) => {
    // 等待非同步工作完成
    await asyncWorker(num);
    
    return num + 1;
})).then((results) => {
    // [ 2, 3, 4, 5, 6 ]
    console.log(results);
});

既然已經有 async/await 的環境，很多人會盡量讓自己的 context 處於 async 函數的環境之下，這時我們就可以用 await 來取代 Promise 的 .then() 方法：

const main = async () => {

    // 改用 await 等待 Promise 內的工作全部完成
    let results = await Promise.all(arr.map(async (num) => {
        // 等待非同步工作完成
        await asyncWorker(num);
        
        return num + 1;
    }));
    
    // [ 2, 3, 4, 5, 6 ]
    console.log(results);
};

main();

與 .reduce() 的組合技

如同 .map() 方法，.reduce() 是另一個常見的陣列處理方法之一，它也同樣不是一個非同步的方法。若引入 async/await，可以讓 .reduce() 擴展為一個依序處理非同步工作的工具，讓非同步工作一個處理完後下一個才接著做。

一個原始的 .reduce() 使用大概如下：

const arr = [ 1, 2, 3, 4, 5 ];

// 將陣列所有數值一一加總
let result = arr.reduce((accumulation, num) => {
    return accumulation + num;
}, 0);

// 15
console.log(result);

若引入 async/await，會變成這樣的形式：

const arr = [ 1, 2, 3, 4, 5 ];

const main = async () => {

    // 將陣列所有數值一一加總
    let result = await arr.reduce(async (prev, num) => {
    
        // 等待前一個工作完成，並得到前個工作的結果
        let accumulation = await prev;
    
        return accumulation + num;
    }, Promise.resolve(0));
    
    // 15
    console.log(result);
};

main();

這時裡面可以跑各式各樣非同步工作，如前面所提到的 delay 函數：

const arr = [ 1, 2, 3, 4, 5 ];

const main = async () => {

    // 將陣列所有數值一一加總
    let result = await arr.reduce(async (prev, num) => {
    
        // 等待前一個工作完成，並得到前個工作的結果
        let accumulation = await prev;
        
        // 非同步工作：等一秒
        await delay(1000);
        
        return accumulation + num;
    }, Promise.resolve(0));
    
    // 15
    console.log(result);
};

main();

後記

懂得使用 async/await 和 Promise 之後，其實有很多的玩法，邏輯的描述也更為多元和簡單，強烈建議一定要熟悉他。:-)