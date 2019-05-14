---
layout: post
title:  "Design pattern with Javascript"
author: tony
categories: [ workshop, javascript ]
image: assets/images/design_pattern_js.png
tags: [ workshop, frontend, javascript, design pattern ]
---

理解 JavaScript 中的設計模式
本文幫助你了解 JavaScript 中的常用的幾種設計模式。  

當你開始一個新項目時，你不會立即開始編碼。 首先必須定義項目的目的和範圍，然後列出項目功能或項目說明書。 在你可以開始編碼或者你正在處理更覆雜的項目之後，你應該選擇最適合你項目的設計模式。

什麽是設計模式？
在軟件工程中，設計模式是軟件設計中常見問題可重用的解決方案。設計模式代表著經驗豐富的軟件開發人員使用的最佳實踐。設計模式可以被認為是編程模板。

為什麽使用設計模式 ？
許多程序員要麽認為設計模式是浪費時間，要麽他們不知道如何恰當地應用它們。 但是使用適當的設計模式可以幫助你編寫更好，更易理解的代碼，並且代碼可以輕松維護，因為它更容易理解。

最重要的是，設計模式為軟件開發人員提供了一些溝通上的便利。 它們會立即向學習你代碼的人顯示你的代碼的意圖。

例如，如果你在項目中使用裝飾者模式，那麽新程序員將立即知道該代碼正在做什麽，並且他們可以更專註於解決業務問題，而無需花費精力去理解你的代碼正在做什麽。

現在我們知道了什麽是設計模式，以及它們為什麽重要，讓我們深入研究 JavaScript 中使用的各種設計模式。

模塊模式（Module Pattern）
模塊是一段獨立的代碼，因此我們可以在不影響其他代碼的情況下單獨更新模塊。 模塊還允許我們為變量創建單獨的作用域來避免命名空間的汙染。 當它們與其他代碼段分離時，我們也可以在其他項目中重用模塊。

模塊是任何現代 JavaScript 應用程序不可或缺的一部分，有助於保持代碼清潔，分離和組織。 有許多方法可以在JavaScript 中創建模塊，其中一種是模塊模式。

Bit之類的平台可以幫助將模塊和組件轉換為共享的構建塊，可以與任何項目共享，發現和開發。 通過零重構，它是一種快速且可擴展的方式來共享和重用代碼。

與其他編程語言不同，JavaScript 沒有訪問修飾符的特性，也就是說，你不能將變量聲明為私有（private）或公開（public)。 因此模塊模式也常常被用於模擬封裝的概念。

此模式使用IIFE（立即調用的函數表達式），閉包和函數作用域來模擬此概念。 例如：

JavaScript 代碼:
const myModule = (function() {
  
  const privateVariable = 'Hello World';
  
  function privateMethod() {
    console.log(privateVariable);
  }
 
  return {
    publicMethod: function() {
      privateMethod();
    }
  }
 
})();
 
myModule.publicMethod();
由於上面的代碼是IIFE，代碼會立即執行，返回的對象被分配給 myModule 變量。 由於閉包，即使在IIFE完成之後，返回的對象仍然可以訪問 IIFE 內定義的函數和變量。

因此，在 IIFE 中定義的變量和函數對外部作用域來說基本上是隱藏的，因此它們對 myModule 變量是私有的。

執行代碼後，myModule 變量如下所示：

JavaScript 代碼:
const myModule = {
  publicMethod: function() {
    privateMethod();
  }
};
因此，我們可以調用 publicMethod()，轉而調用 privateMethod()。例如：

JavaScript 代碼:
// Prints 'Hello World'
module.publicMethod();
暴露模塊模式（Revealing Module Pattern）
暴露模塊模式是 Christian Heilmann 對模塊模式略微的改進版本。 模塊模式的問題是我們必須創建新的公開函數來調用私有函數和變量。

在暴露模塊模式中，我們將返回的對象的屬性映射到我們想要公開的私有函數。 這就是為什麽它被稱為暴露模塊模式的原因。 例如：

JavaScript 代碼:
const myRevealingModule = (function() {
  
  let privateVar = 'Peter';
  const publicVar  = 'Hello World';
 
  function privateFunction() {
    console.log('Name: '+ privateVar);
  }
  
  function publicSetName(name) {
    privateVar = name;
  }
 
  function publicGetName() {
    privateFunction();
  }
 
  /** reveal methods and variables by assigning them to object     properties */
 
return {
    setName: publicSetName,
    greeting: publicVar,
    getName: publicGetName
  };
})();
 
myRevealingModule.setName('Mark');
 
// prints Name: Mark
myRevealingModule.getName();
這種模式使我們更容易理解我們可以公開訪問哪些函數和變量，這有助於代碼的可讀性。

代碼執行後，myRevealingModule 如下所示：

JavaScript 代碼:
const myRevealingModule = {
  setName: publicSetName,
  greeting: publicVar,
  getName: publicGetName
};
我們可以調用 myRevealingModule.setName('Mark')，來引用內部的 publicSetName ，以及調用myRevealingModule.getName() ，來引用內部的 publicGetName 。例如：

JavaScript 代碼:
myRevealingModule.setName('Mark');
 
// prints Name: Mark
myRevealingModule.getName();
暴露模塊模式相較於模塊模式的優點：
我們可以修改 return 語句中的一行代碼，來將成員從 public(公開) 更改為 private(私有) ，反之亦然。
返回的對象不包含函數定義，所有右側表達式都在 IIFE 中定義，使代碼清晰易讀。
ES6 模塊（ES6 Modules）
在ES6之前，JavaScript 沒有內置的模塊系統，所以開發人員必須依賴第三方庫或模塊模式來實現模塊化。但是在 ES6 中，JavaScript 擁有了原生的模塊系統。

ES6 模塊存儲在單獨的文件中。每個文件只能有一個模塊。默認情況下，模塊中的所有內容都是私有的。函數、變量和類使用 export 關鍵字來向外公開。模塊內的代碼總是在 嚴格模式(strict mode) 下運行。

導出模塊
導出函數和變量聲明有兩種方法：

1) 通過在函數和變量聲明前添加 export 關鍵字。例如：
JavaScript 代碼:
// utils.js
export const greeting = 'Hello World';
 
export function sum(num1, num2) {
  console.log('Sum:', num1, num2);
  return num1 + num2;
}
 
export function subtract(num1, num2) {
  console.log('Subtract:', num1, num2);
  return num1 - num2;
}
 
// This is a private function
 
function privateLog() {
  console.log('Private Function');
}
2) 通過在代碼末尾添加 export 關鍵字，並包含我們要導出的函數和變量的名稱。例如：
JavaScript 代碼:
// utils.js
function multiply(num1, num2) {
  console.log('Multiply:', num1, num2);
  return num1 * num2;
}
function divide(num1, num2) {
  console.log('Divide:', num1, num2);
  return num1 / num2;
}
// This is a private function
function privateLog() {
  console.log('Private Function');
}
export {multiply, divide};
導入模塊
與導出模塊類似，有兩種方法可以使用 import 關鍵字導入模塊。 例如：

1) 一次導入多個項目
JavaScript 代碼:
// main.js
 
// importing multiple items
import { sum, multiply } from './utils.js';
 
console.log(sum(3, 7));
console.log(multiply(3, 7));
導入所有模塊
JavaScript 代碼:
// main.js
 
// importing all of module
import * as utils from './utils.js';
 
console.log(utils.sum(3, 7));
console.log(utils.multiply(3, 7));
導入/導出模塊可以使用別名
如果要避免命名沖突，可以在導出和導入時使用別名。例如：

1）重命名導出
JavaScript 代碼:
// utils.js
 
function sum(num1, num2) {
  console.log('Sum:', num1, num2);
  return num1 + num2;
}
 
function multiply(num1, num2) {
  console.log('Multiply:', num1, num2);
  return num1 * num2;
}
 
export {sum as add, multiply};
2) 重命名導入
JavaScript 代碼:
// main.js
 
import { add, multiply as mult } from './utils.js';
 
console.log(add(3, 7));
console.log(mult(3, 7));
你可以查看 JavaScript 模塊簡史 和 ECMAScript 6 Modules(模塊)系統及語法詳解 來完整了解 JavaScript 模塊化進程和 ES6 Modules(模塊)的更多信息。

單例模式（Singleton Pattern）
Singleton(單例) 是一個只能實例化一次的對象。 如果不存在，則單例模式會創建類的新實例。 如果存在實例，則它只返回對該對象的引用。 對構造函數的任何重覆調用總是會獲取相同的對象。

JavaScript 一直支持單例模式。 我們只是不稱他們為單例，我們稱之為 對象字面量。 例如：

JavaScript 代碼:
const user = {
  name: 'Peter',
  age: 25,
  job: 'Teacher',
  greet: function() {
    console.log('Hello!');
  }
};
因為 JavaScript 中的每個對象占用一個唯一的內存位置，當我們調用 user 對象時，我們實際上是返回對該對象的引用。

如果我們嘗試將用戶變量覆制到另一個變量並修改該變量。 例如：

JavaScript 代碼:
const user1 = user;
user1.name = 'Mark';
我們會看到的結果是兩個對象都被修改，因為 JavaScript 中的對象是通過引用而不是通過值傳遞的。所以內存中只有一個對象。例如：

JavaScript 代碼:
// prints 'Mark'
console.log(user.name);
 
// prints 'Mark'
console.log(user1.name);
 
// prints true
console.log(user === user1);
可以使用構造函數實現單例模式。例如：

JavaScript 代碼:
let instance = null;
 
function User() {
  if(instance) {
    return instance;
  }
 
  instance = this;
  this.name = 'Peter';
  this.age = 25;
  
  return instance;
}
 
const user1 = new User();
const user2 = new User();
 
// prints true
console.log(user1 === user2); 
調用此構造函數時，它會檢查 instance 對象是否存在。 如果該對象不存在，則將該變量分配給 instance 變量。如果對象存在，它只返回該對象。

單例模式也可以使用模塊模式實現。 例如：

JavaScript 代碼:
const singleton = (function() {
  let instance;
  
  function init() {
    return {
      name: 'Peter',
      age: 24,
    };
  }
 
  return {
    getInstance: function() {
      if(!instance) {
        instance = init();
      }
      
      return instance;
    }
  }
})();
 
const instanceA = singleton.getInstance();
const instanceB = singleton.getInstance();
 
// prints true
console.log(instanceA === instanceB);
在上面的代碼中，我們通過調用 singleton.getInstance 方法創建一個新實例。 如果實例已存在，則此方法僅返回該實例，如果實例不存在，則通過調用 init() 函數創建新實例。

工廠模式（Factory Pattern）
工廠模式是一種使用工廠方法創建對象的設計模式，而不指定創建對象的確切的類或構造函數。

工廠模式用於在不公開實例化邏輯的情況下創建對象。當我們需要根據特定條件生成不同的對象時，可以使用此模式。例如：

JavaScript 代碼:
class Car{
  constructor(options) {
    this.doors = options.doors || 4;
    this.state = options.state || 'brand new';
    this.color = options.color || 'white';
  }
}
 
class Truck {
  constructor(options) {
    this.doors = options.doors || 4;
    this.state = options.state || 'used';
    this.color = options.color || 'black';
  }
}
 
class VehicleFactory {
  createVehicle(options) {
    if(options.vehicleType === 'car') {
      return new Car(options);
    } else if(options.vehicleType === 'truck') {
      return new Truck(options);
      }
  }
}
在這裏，我創建了一個 Car 和 Truck 類（帶有一些默認值），用於創建新的 car 和 truck 對象。 我已經定義了一個 VehicleFactory 類，用於根據 options 對象中收到的 vehicleType 屬性創建並返回一個新對象。

JavaScript 代碼:
const factory = new VehicleFactory();
 
const car = factory.createVehicle({
  vehicleType: 'car',
  doors: 4,
  color: 'silver',
  state: 'Brand New'
});
 
const truck= factory.createVehicle({
  vehicleType: 'truck',
  doors: 2,
  color: 'white',
  state: 'used'
});
 
// Prints Car {doors: 4, state: "Brand New", color: "silver"}
console.log(car);
 
// Prints Truck {doors: 2, state: "used", color: "white"}
console.log(truck);
我創建了一個 VehicleFactory 類的新對象 factory 。之後，我們可以通過調用 factory.createVehicle 並，傳遞一個帶有 carType 屬性 options 對象，且值為 car 或 truck 的來創建一個新的 Car 或 Truck 對象。

裝飾者模式（Decorator Pattern）
裝飾者模式用於擴展對象的功能，而無需修改現有的類或構造函數。 此模式可用於向對象添加功能，而無需它們修改底層代碼。

這種模式的一個簡單例子是：

JavaScript 代碼:
function Car(name) {
  this.name = name;
 
  // Default values
  this.color = 'White';
}
 
// Creating a new Object to decorate
const tesla= new Car('Tesla Model 3');
 
// Decorating the object with new functionality
 
tesla.setColor = function(color) {
  this.color = color;
}
 
tesla.setPrice = function(price) {
  this.price = price;
}
 
tesla.setColor('black');
tesla.setPrice(49000);
 
// prints black
console.log(tesla.color);
這種模式的一個更實際的例子是：

比方說，汽車的成本取決於它的功能數量。 如果沒有裝飾者模式，我們必須為不同的功能組合創建不同的類，每個類都有一個成本方法來計算成本。 例如：

JavaScript 代碼:
class Car() {
}
 
class CarWithAC() {
}
 
class CarWithAutoTransmission {
}
 
class CarWithPowerLocks {
}
 
class CarWithACandPowerLocks {
}
但是使用裝飾者模式，我們可以創建一個基類 ·Car`，並使用裝飾者函數將不同配置的成本計算方法添加到其對象中。例如：

JavaScript 代碼:
class Car {
  constructor() {
    // Default Cost
    this.cost = function() {
      return 20000;
    }
  }
}
 
// Decorator function
function carWithAC(car) {
  car.hasAC = true;
  const prevCost = car.cost();
  car.cost = function() {
    return prevCost + 500;
  }
}
 
// Decorator function
function carWithAutoTransmission(car) {
  car.hasAutoTransmission = true;
   const prevCost = car.cost();
  car.cost = function() {
    return prevCost + 2000;
  }
}
 
// Decorator function
function carWithPowerLocks(car) {
  car.hasPowerLocks = true;
  const prevCost = car.cost();
  car.cost = function() {
    return prevCost + 500;
  }
}
首先，我們創建一個基類 Car，用於創建 Car 對象。 然後，然後我們為了不同的功能創建了裝飾者函數，並將 Car 對象作為參數傳遞。 然後我們覆蓋該對象的成本函數，該函數返回汽車的更新成本，並向該對象添加新屬性以指示添加了哪個特征。

要添加新功能，我們可以執行以下操作：

JavaScript 代碼:
const car = new Car();
console.log(car.cost());
 
carWithAC(car);
carWithAutoTransmission(car);
carWithPowerLocks(car);
最後，我們可以像這樣計算汽車的成本：

JavaScript 代碼:
// Calculating total cost of the car
console.log(car.cost());
結語
我們已經了解了JavaScript中使用的各種設計模式，但是這裏還一些沒有介紹的，可以用 JavaScript 實現的設計模式。

雖然了解各種設計模式很重要，但同樣重要的是不要過度使用它們。 在使用設計模式之前，你應該仔細考慮你所處的問題是否符合該設計模式。 要了解模式是否適合你的問題，你應該研究設計模式的思想，以及該設計模式的應用。

英文原文：https://blog.bitsrc.io/understanding-design-patterns-in-javascript-13345223f2dd