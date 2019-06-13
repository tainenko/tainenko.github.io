---
layout: post
title:  "2019-06-14 F2E workshop Day6"
author: tony
categories: [ workshop, frontend ]
image: assets/images/f2e_workshop.png
tags: [workshop, frontend]
---
Day6討論內容：17直播面試題。async、await、promise、setTimeout執行順序複習。

### Problem1
給定兩組array，將array中的元素兩兩配對並輸出。
```javascript
input:
a=[2,5,8,1,5]
b=[4,8,2,0,9]

output:
[[2,4],[5,8],[8,2],[1,0],[5,9]]


a=[2,5,8,1,5,,,]
b=[4,8,2,0,9]
function problem1(...arr){
    return [...arr].reduce((total, current, index) => {
        current.forEach((item, i) => {
        		!!total[i] 
              ? total[i].push(item)
          		: total[i] = [item]
        })
      return total
    }, [])
}
```
延伸討論：
1. 如果兩組array的長度不相等？
2. input有三組或以上的array時怎麼處理。

### Problem2
輸入數字，將數字加上千分位符號後以字串形式輸出。
```javascript
input:int
output:string加千分位
ex.
input:123456
output:'123,456'

for(i=str.length;i>0;i--){
  if(i%3==){
     return `,${str[i-1]}`
}else{
return str[i-1];
}

//str.length>3&& str.from.map((item,index)=>index%3==0?`${item},`:item);

//TonyK
inter->array (['123','456'])->return array.join(',')
let sign='';
if(num<0){
    sign='-';
    num*=(-1);
  }

let res= new Array();

while(num>0){
  let temp=str(num%1000);
  res.splice(0,0,temp);
  num/=1000;
}
```
延伸討論：  
1. 輸入數字為負數時如何處理？

### Problem3
將Async函式以Promise重新改寫。
```javascript
async function async1() {
    console.log('async1 start');
    await async2();
    console.log('async1 end');           
}
async function async2() {
    console.log('async2');
}
	//sunc
  'async1 start'
  'async2'
  //async
  'async1 end'
  
//用promise重寫async1 & async2 
new Promise(function(resolve) {
     console.log('async1 start');
  async2();
  resolve();
}).then(function() {
    console.log('async1 end');
});
```

### Problem4. 寫出以下的輸出結果
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











  
