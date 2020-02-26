---
layout: post
title:  "Answers of Front-end Job Interview Coding Questions"
author: tony
categories: [ workshop, frontend ]
image: assets/images/javascript/interview-questions.jpg
tags: [workshop, frontend, 17 Media, interview, questions]
---
Try to answer the front-end job interview coding questions. The original questions could be found in the link below.

[Coding Questions](https://h5bp.org/Front-end-Developer-Interview-Questions/questions/coding-questions/)

# Questions
Question: What is the value of `foo`?
```javascript
var foo = 10 + '20';
```

Question: What will be the output of the code below?
```javascript
console.log(0.1 + 0.2 == 0.3);
```

Question: How would you make this work?
```javascript
add(2, 5); // 7
add(2)(5); // 7
```

Question: What value is returned from the following statement?
```javascript
"i'm a lasagna hog".split("").reverse().join("");
```

Question: What is the value of `window.foo`?
```javascript
( window.foo || ( window.foo = "bar" ) );
```

Question: What is the outcome of the two alerts below?
```javascript
var foo = "Hello";
(function() {
  var bar = " World";
  alert(foo + bar);
})();
alert(foo + bar);
```

Question: What is the value of `foo.length`?
```javascript
var foo = [];
foo.push(1);
foo.push(2);
```

Question: What is the value of `foo.x`?
```javascript
var foo = {n: 1};
var bar = foo;
foo.x = foo = {n: 2};
```

Question: What does the following code print?
```javascript
console.log('one');
setTimeout(function() {
  console.log('two');
}, 0);
Promise.resolve().then(function() {
  console.log('three');
})
console.log('four');
```

Question: What is the difference between these four promises?
```javascript
doSomething().then(function () {
  return doSomethingElse();
});

doSomething().then(function () {
  doSomethingElse();
});

doSomething().then(doSomethingElse());

doSomething().then(doSomethingElse);
```

Question: What will the code below output to the console and why?
```javascript
(function(){
  var a = b = 3;
})();

console.log("a defined? " + (typeof a !== 'undefined'));
console.log("b defined? " + (typeof b !== 'undefined'));
```

Question: Consider the two functions below. Will they both return the same thing? Why or why not?
```javascript
function foo1()
{
  return {
      bar: "hello"
  };
}

function foo2()
{
  return
  {
      bar: "hello"
  };
}
```

# Answers
Question: What is the value of `foo`?
```javascript
var foo = 10 + '20';
//foo would be '1020'

```

Question: What will be the output of the code below?
```javascript
console.log(0.1 + 0.2 == 0.3);
// false
// because of the float inaccuracy.
```

Question: How would you make this work?
```javascript
add(2, 5); // 7
add(2)(5); // 7
```

```javascript

````

Question: What value is returned from the following statement?
```javascript
"i'm a lasagna hog".split("").reverse().join("");
// After split("") ["i","'","m"," ","a"," ","l","a","s","a","g","n","a"," ","h","o","g"]
// After reverse() ['g', 'o', 'h', ' ', 'a', 'n', 'g', 'a', 's', 'a', 'l', ' ', 'a', ' ', 'm', "'", 'i']
// After join("") "goh angasal a m'i"
// The effect of three steps equal to reverse a string.
```

Question: What is the value of `window.foo`?
```javascript
( window.foo || ( window.foo = "bar" ) );
// window.foo == "bar"
```

Question: What is the outcome of the two alerts below?
```javascript
var foo = "Hello";
(function() {
  var bar = " World";
  alert(foo + bar);
})();
alert(foo + bar);
```

Question: What is the value of `foo.length`?
```javascript
var foo = [];
foo.push(1);
foo.push(2);
// foo == [1,2]
// foo.length == 2
```

Question: What is the value of `foo.x`?
```javascript
var foo = {n: 1};
var bar = foo;
foo.x = foo = {n: 2};
```

Question: What does the following code print?
```javascript
console.log('one');
setTimeout(function() {
  console.log('two');
}, 0);
Promise.resolve().then(function() {
  console.log('three');
})
console.log('four');

// one
// three
// four
// two
```

Question: What is the difference between these four promises?
```javascript
doSomething().then(function () {
  return doSomethingElse();
});

doSomething().then(function () {
  doSomethingElse();
});

doSomething().then(doSomethingElse());

doSomething().then(doSomethingElse);
```

Question: What will the code below output to the console and why?
```javascript
(function(){
  var a = b = 3;
})();

console.log("a defined? " + (typeof a !== 'undefined'));
console.log("b defined? " + (typeof b !== 'undefined'));
```

Question: Consider the two functions below. Will they both return the same thing? Why or why not?
```javascript
function foo1()
{
  return {
      bar: "hello"
  };
}

function foo2()
{
  return
  {
      bar: "hello"
  };
}
```
