layout: post
title:  "F2E interview questions"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.png
tags: [workshop, frontend, interview, questions]
---

根據Stack Overflow 2018年年度調查報告，JavaScript已經連續6年保持最常用的編程語言的記錄。對於一個全棧工程師，JavaScript可以說是一項必備語言，在面試中總會被問到。我整理了一下FullStack.Cafe上所有常見的JavaScript面試問題供大家參考：

Q1: JavaScript中類型轉換是怎樣的？
> 話題: JavaScript 難度: ⭐

在JavaScript中，在兩個不同類型之間的轉換叫做coercion。在JavaScript中有兩種形式：顯示轉換和隱式轉換。

下面是一個顯示轉換的例子：    
```javascript
var a = "42";
var b = Number( a );
a;              // "42"
b;              // 42 -- the number!
```

下面是一個隱式轉換的例子：
```javascript
var a = "42";
var b = a * 1;  // "42" implicitly coerced to 42 here
a;              // "42"
b;              // 42 -- the number!
```
來源: FullStack.Cafe

Q2: JavaScript中的作用域是怎樣的？
> 話題: JavaScript 難度: ⭐

在JavaScript中，每一個函數都有各自的作用域(scope)。作用域可以理解為是一個變量的集合以及相應的如何訪問它的規則。只有在函數內部的變量才可以訪問到該函數域的變量。

在同一個作用域內部，變量名必須要唯一。作用域可以嵌套。在最內部的作用域中，可以訪問任何外部的作用域中的變量。

Q3: 請解釋JavaScript中的相等判斷
> 話題: JavaScript 難度: ⭐

JavaScript中的相等判斷有嚴格判斷和帶隱式轉換的判斷兩種：

嚴格判斷(strict comparision): 比如===，比較的時候不會隱式轉換類型；  
抽象判斷(abstract comparasion)：比如==，比較的時候會隱式轉換類型。
```javascript
var a = "42";
var b = 42;

a == b;         // true
a === b;        // false
```

一些簡單的規則：  
如果兩邊都是布爾類型的值，使用===;  
如果兩邊是0,"",[]，使用===;  
所有其它類型，使用==是安全的。而且在很多情況下會簡化代碼、增加可讀性。  
Q4: 請解釋什麽叫做回調函數並提供一個簡單的例子
> 話題: JavaScript 難度: ⭐⭐

回調函數是一個函數，它被作為參數傳入另一個函數，當某些操作結束後，該函數被調用。下面是一個簡單的例子，當數組被修改後，調用回調函數打印一行日志。
```javascript
function modifyArray(arr, callback) {
  // do something to arr here
  arr.push(100);
  // then execute the callback function that was passed
  callback();
}

var arr = [1, 2, 3, 4, 5];
modifyArray(arr, function() {
  console.log("array has been modified", arr);
});
```

Q5: "use strict"到底有何用處？
> 話題: JavaScript 難度: ⭐⭐

use strict放在文件的頂部或則函數的第一行來啟動更加嚴格的檢查來避免失誤引起的錯誤。比如，下面的代碼會拋出錯誤：
```javascript
function doSomething(val) {
  "use strict";
  x = val + 10;
}
```
因為x沒有定義，如果使用了use strict，x是不會被當做全局的變量來看待。下面的代碼修覆了這個BUG：
```javascript
function doSomething(val) {
  "use strict";
  var x = val + 10;
}
```

Q6: 請解釋Null和Undefined
> 話題: JavaScript 難度: ⭐⭐

JavaScript和TypeScript有兩個最基本的類型null和undefined。它們的含義是不同的：

如果還沒有被初始化，則是undefined;  
如果不可用，則可以用null來表示；  

Q7: 請實現如下函數  
> 話題: JavaScript 難度: ⭐⭐
```javascript
var addSix = createBase(6);
addSix(10); // returns 16
addSix(21); // returns 27
```
addSix是一個函數，也就是說createBase函數的返回是一個函數。  
```javascript
function createBase(baseNumber) {
  return function(N) {
    // we are referencing baseNumber here even though it was declared
    // outside of this function. Closures allow us to do this in JavaScript
    return baseNumber + N;
  }
}
var addSix = createBase(6);
addSix(10);
addSix(21);
```

Q8: 請解釋JavaScript中的值和類型
> 話題: JavaScript 難度: ⭐⭐

下面是JavaScript內置的可用類型：

string  
number  
boolean  
null和undefined  
object  
symbol (ES6的新語法)  

Q9: 請解釋事件冒泡以及如何阻止它？  
> 話題: JavaScript 難度: ⭐⭐

事件冒泡的概念是指：在最內層的元素上綁定的事件被觸發後，會按照嵌套的層次由內向外逐步觸發。因此，點擊某個孩子節點可能會觸發父節點的事件。  
一個阻止事件冒泡的辦法就是使用event.stopPropagation()，在IE<9的瀏覽器上使用event.cancelBubble。  
```javascript
function stopPropagation(evt) {
    if (typeof evt.stopPropagation === "function") {
        evt.stopPropagation();
    } else {
        evt.cancelBubble = true;
    }
}
```
來源：github.com/kennymkchan  

Q10. 請解釋JavaScript中的let關鍵字  
> 話題: JavaScript 難度: ⭐⭐

ES6允許你使用let關鍵字來申明塊作用域({...})的變量。  
來源: github.com/getify  

Q11: 如何檢查一個數字是否是整數？  
> 話題: JavaScript 難度: ⭐⭐  

一個最簡單的方法是判斷除以1的余數是否為0.
```javascript
function isInt(num) {
  return num % 1 === 0;
}

console.log(isInt(4)); // true
console.log(isInt(12.2)); // false
console.log(isInt(0.3)); // false
JavaScriptCopy
```
來源: coderbyte.com  

Q12: 什麽叫IIFEs(Immediately Invoked Function Expressions)?  
> 話題: JavaScript 難度: ⭐⭐

IIFE叫做立即執行表達式，顧名思義，該表達式一被創建就立即執行。    
```javascript
(function IIFE(){
    console.log( "Hello!" );
})();
// "Hello!"
```
該方法常用語避免汙染全局的命名空間，因為所以在IIFE中使用的變量外部都無法訪問。  
來源: stackoverflow.com

Q13: 如果比較JavaScript中的兩個對象？  
> 話題: JavaScript 難度: ⭐⭐

兩個非基本類型的值，比如對象(包括函數和數組)都是通過引用的形式來訪問。如果直接通過==和===來判斷，那麽只會簡單的判斷其引用地址是否相同，而不是它們實際對應的值。  
如果數組和字符串做比較，那麽數組會通過逗號拼接轉換為字符串。通過等號判斷的時候，兩個相同的數組不會相等，但是和相同數據的字符串比較反而相等。  
```javascript
var a = [1,2,3];
var b = [1,2,3];
var c = "1,2,3";

a == c;     // true
b == c;     // true
a == b;     // false
```
如果要深度比較，可以使用第三方庫，比如deep-equal或則你自己實現一個比較算法。  

Q14: 請解釋ES5和ES6的不同點
> 話題: JavaScript 難度: ⭐⭐⭐  
 
ECMAScript 5 (ES5): 第5個ECMAScript版本，於2009年標準化。該標準幾乎所有的瀏覽器都完全支持。  
ECMAScript 6 (ES6)/ECMAScript 2015 (ES2015): 第6個ECMAScript版本，於2015年標準化。目前各大瀏覽器還只是部分支持。  
接下來介紹它們主要的區別：  

箭頭函數和字符串嵌入：  
```javascript
const greetings = (name) => {
      return `hello ${name}`;
}
```

甚至：
```javascript
const greetings = name => `hello ${name}`;
```
常量聲明(Const): 如同其它編程語言中的常量一樣，但又有不同。這裏的const代表了constant reference。也就是說，你可以修改其指向的對象的值。但是你不能修改其reference的值。  
```javascript
const NAMES = [];
NAMES.push("Jim");
console.log(NAMES.length === 1); // true
NAMES = ["Steve", "John"]; // error
```
塊作用域變量：ES6中的新關鍵字let允許允許開發者將變量的作用域限定在塊級別。不會像var一樣變量提升。  
參數默認值：允許在函數定義的時候指定默認的值。    
```javascript
// Basic syntax 
function multiply (a, b = 2) {
     return a * b;
}
multiply(5); // 10
```
類定義和繼承  
ES6開始支持定義類(使用class關鍵字)，構造函數(使用constructor關鍵字)，和extend關鍵字來實現繼承。  

for-of操作  
for...of語句用來叠代訪問一個對象的所有屬性。  

Spread操作符：用於對象合並  
```javascript
const obj1 = { a: 1, b: 2 }
const obj2 = { a: 2, c: 3, d: 4}
const obj3 = {...obj1, ...obj2}
```

Promise: Promises提供了一個處理異步操作的方法。你可以用回調函數來實現，但是Promise更加簡潔和可讀。
```javascript
const isGreater = (a, b) => {
  return new Promise ((resolve, reject) => {
    if(a > b) {
      resolve(true)
    } else {
      reject(false)
    }
    })
}
isGreater(1, 2)
  .then(result => {
    console.log('greater')
  })
 .catch(result => {
    console.log('smaller')
 })
```
模塊的export和import。
```javascript
const myModule = { x: 1, y: () => { console.log('This is ES5') }}
export default myModule;
JavaScriptCopy
import myModule from './myModule';
```
來源: Bulby.io

Q15: 請解釋undefined和not defined的區別
> 話題: JavaScript 難度: ⭐⭐⭐

在JavaScript中，如果你嘗試使用不存在的還未申明的變量，JavaScript會拋出錯誤var name is not defined。但是如果你用typeof來查看其類型，會返回undefined。

我們先來澄清一下聲明和定義的區別：var x是一個聲明，因為你並沒有定義其具體的值，你只是聲明其存在性。

var x; // declaring x
console.log(x); //output: undefined
JavaScriptCopy
var x = 1同時兼具聲明和定義，我們也可以叫它初始化。在JavaScript中，每一個變量和函數聲明都會被提升到頂部。

如果我們訪問一個聲明了但是未定義的變量，會返回undefined。

var x; // Declaration
if(typeof x === 'undefined') // Will return true
JavaScriptCopy
訪問一個未聲明未定義的變量，會返回not defined錯誤。

console.log(y);  // Output: ReferenceError: y is not defined
JavaScriptCopy
來源: stackoverflow.com

Q16: 匿名函數和命名函數的區別？
話題: JavaScript 難度: ⭐⭐⭐

var foo = function() { // anonymous function assigned to variable foo
    // ..
};

var x = function bar(){ // named function (bar) assigned to variable x
    // ..
};

foo(); // actual function execution
x();
JavaScriptCopy
譯者補充：匿名函數如果不賦值給某個變量，則無法被調用了；命名函數再次被賦值不是多此一舉麽。

Q17: JavaScript中閉包是什麽？請提供一個例子
話題: JavaScript 難度: ⭐⭐⭐⭐

閉包是一個定義在其它函數(父函數)裏面的函數，它擁有對父函數裏面變量的訪問權。閉包擁有如下三個作用域的訪問權：

自身的作用域
父作用域
全局作用域
var globalVar = "abc";

// Parent self invoking function
(function outerFunction (outerArg) { // begin of scope outerFunction
  // Variable declared in outerFunction function scope
  var outerFuncVar = 'x';
  // Closure self-invoking function
  (function innerFunction (innerArg) { // begin of scope innerFunction
    // variable declared in innerFunction function scope
    var innerFuncVar = "y";
    console.log(
      "outerArg = " + outerArg + "\n" +
      "outerFuncVar = " + outerFuncVar + "\n" +
      "innerArg = " + innerArg + "\n" +
      "innerFuncVar = " + innerFuncVar + "\n" +
      "globalVar = " + globalVar);
  // end of scope innerFunction
  })(5); // Pass 5 as parameter
// end of scope outerFunction
})(7); // Pass 7 as parameter
JavaScriptCopy
innerFunction是一個閉包，定義在outerFunction中，它可以訪問outerFunction作用域的所有變量。當然，它還可以訪問全局變量。

輸出結果如下：

outerArg = 7
outerFuncVar = x
innerArg = 5
innerFuncVar = y
globalVar = abc
JavaScriptCopy
來源: github.com/ganqqwerty

Q18: 在JavaScript中如何創建私有變量？
話題: JavaScript 難度: ⭐⭐⭐⭐

你可以通過在函數中聲明變量來創建私有變量。因為在函數中，外部無法直接訪問。

function func() {
  var priv = "secret code";
}

console.log(priv); // throws error
JavaScriptCopy
為了訪問該變量，可以構造一個幫助函數來返回該值。

function func() {
  var priv = "secret code";
  return function() {
    return priv;
  }
}

var getPriv = func();
console.log(getPriv()); // => secret code
JavaScriptCopy
來源:coderbyte.com

Q19: 請解釋原型模式(Prototype Design Pattern)
話題: JavaScript 難度: ⭐⭐⭐⭐

原型模式會創建一個新的對象，但不是創建一個未初始化的對象，而是通過拷貝原型鏈上的值或則被拷貝對象的值來完成初始化。傳統的語言很少使用原型模式，但是JavaScript作為一個基於原型的語言，使用原型模式來創建新的對象。

來源: dofactory.com

Q20: 判斷給定的字符串是否同態(isomorphic)
話題: JavaScript 難度: ⭐⭐⭐⭐

首先介紹什麽叫做同態：兩個字符串，如果A字符串中的每一個字符都可以在B字符串中找到唯一對應，並且順序一一對應；如果存在這樣的函數，那麽A和B同態。

paper和title同態
egg和sad不同態
dgg和add同態
isIsomorphic("egg", 'add'); // true
isIsomorphic("paper", 'title'); // true
isIsomorphic("kick", 'side'); // false

function isIsomorphic(firstString, secondString) {

  // Check if the same length. If not, they cannot be isomorphic
  if (firstString.length !== secondString.length) return false

  var letterMap = {};

  for (var i = 0; i < firstString.length; i++) {
    var letterA = firstString[i],
        letterB = secondString[i];

    // If the letter does not exist, create a map and map it to the value
    // of the second letter
    if (letterMap[letterA] === undefined) {
      letterMap[letterA] = letterB;
    } else if (letterMap[letterA] !== letterB) {
      // Eles if letterA already exists in the map, but it does not map to
      // letterB, that means that A is mapping to more than one letter.
      return false;
    }
  }
  // If after iterating through and conditions are satisfied, return true.
  // They are isomorphic
  return true;
}
JavaScriptCopy
來源: github.com/kennymkchan

Q21: Transpiling代表了什麽意思？
話題: JavaScript 難度: ⭐⭐⭐⭐

Transpiling是transforming + compiling的合成詞。對於一些新的語法，瀏覽器還不支持。最好的辦法就是將其變換到舊的等價的代碼，這個過程通常叫做transpiling。

典型的，你可以在build的過程中加入transpiler，就如同code linter和minifier一樣。

已經有很多知名的transpilers可供使用：

Babel: 將ES6編譯到ES5
Traceur：將ES6,ES7等編譯到ES5
來源: You Don't Know JS, Up &going

Q22: this關鍵字如何工作？請提供一些例子
話題: JavaScript 難度: ⭐⭐⭐⭐

在JavaScript中，this總是指向函數的“擁有者”(也就是指向該函數的對象)，或則擁有該函數的對象。

function foo() {
    console.log( this.bar );
}

var bar = "global";

var obj1 = {
    bar: "obj1",
    foo: foo
};

var obj2 = {
    bar: "obj2"
};

foo();          // "global"
obj1.foo();     // "obj1"
foo.call( obj2 );  // "obj2"
new foo();       // undefined
JavaScriptCopy
來源: quirksmode.org

Q23: 如何為Array對象添加你自定義的函數，使得如下代碼可以正常工作。
話題: JavaScript 難度: ⭐⭐⭐⭐

var arr = [1, 2, 3, 4, 5];
var avg = arr.average();
console.log(avg);
JavaScriptCopy
JavaScript是一個基於原型的語言。也就是說對象之間通過原型鏈接，並繼承其函數。為了給Array對象添加函數，我們可以修改其原型定義Array prorotype。

Array.prototype.average = function() {
  // calculate sum
  var sum = this.reduce(function(prev, cur) { return prev + cur; });
  // return sum divided by number of elements
  return sum / this.length;
}

var arr = [1, 2, 3, 4, 5];
var avg = arr.average();
console.log(avg); // => 3
JavaScriptCopy
來源: coderbyte.com

Q24: JavaScript中提升(hoisting)是什麽意思？
話題: JavaScript 難度: ⭐⭐⭐⭐

提升(hoisting)是指JavaScript的解釋器將所有的變量和函數聲明都提升到該作用域的頂部，有兩種提升類型：

變量提升
函數提升
在一個作用域中通過聲明的變量和函數在整個作用域中都可以使用。

var a = 2;
foo();                 // works because `foo()`
                         // declaration is "hoisted"

function foo() {
    a = 3;
    console.log( a );   // 3
    var a;             // declaration is "hoisted"
                         // to the top of `foo()`
}

console.log( a );   // 2
JavaScriptCopy
雖然foo()函數在後面定義，但是在前面也可以調用。

Q25: 如下代碼會返回什麽結果？
話題: JavaScript 難度: ⭐⭐⭐⭐

0.1 + 0.2 === 0.3
JavaScriptCopy
不要驚訝，其結果是false。因為浮點數在系統內的精確度問題，0.1+0.2的結果並不是0.3，而是0.30000000000000004。 要避免這個問題的方法是指定返回結果的小數位數。

來源: coderbyte.com

Q26: 請描述一下揭示模式(Revealing Module Pattern)
話題: JavaScript 難度: ⭐⭐⭐⭐⭐

Module pattern的一個變種是Revealing Module Pattern。該設計模式的目的是做到很好的代碼隔離，只是將需要對外公開的變量和函數暴露出來。一個直接的實現如下所示：

var Exposer = (function() {
  var privateVariable = 10;

  var privateMethod = function() {
    console.log('Inside a private method!');
    privateVariable++;
  }

  var methodToExpose = function() {
    console.log('This is a method I want to expose!');
  }

  var otherMethodIWantToExpose = function() {
    privateMethod();
  }

  return {
      first: methodToExpose,
      second: otherMethodIWantToExpose
  };
})();

Exposer.first();        // Output: This is a method I want to expose!
Exposer.second();       // Output: Inside a private method!
Exposer.methodToExpose; // undefined
JavaScriptCopy
來源: scotch.io

譯者按： 從各個平台精選整理出26道由淺入深的題目助你面試

原文: Top 26 JavaScript Interview Questions I Wish I Knew
譯者: Fundebug