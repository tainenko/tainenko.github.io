---
layout: post
title:  "Essential Javascript Interview Questions"
author: tony
categories: [ Frontend, Interview ]
image: assets/images/js.jpg
tags: [frontend, interview, javascript, questions]
---
In software development interviews have different stages and go beyond the usual “where do you see yourself in five years?” cliche. In order to know if someone is right for the job you need to know how they think, not just what they know. Software development is a fickle business and you need to get all the insights you can from the person standing in front of you: how they think, how they approach problems, how they deal under pressure. In order to get there you need questions, good and, often enough, weird questions, to determine not only character but technique as well.  

## PART I: GENERAL QUESTIONS
1. What is JavaScript?
2. How do you organize your code?
3. What’s event bubbling?
4. What’s functional programming?
5. What is this in JavaScript?
6. When should you use classical inheritance?
7. What does unobtrusive mean in JavaScript?
8. Should a great JavaScript developer use frameworks?
9. What’s your biggest weakness as a developer?

## PART II: CURVEBALL QUESTIONS
1. Why is Math.max() smaller than Math.min()?
2. Why does 0.1 + 0.2 === 0.3 return false?
3. Why Does 018 Minus 017 Equal 3?

## PART III: COMMON QUESTIONS
4. How Does a Function Expression Differ from a Function Declaration?
    ```javascript
    // Function Declaration
    function sum(x, y) {
      return x + y;
    };
    
    // Function Expression: ES5
    var sum = function(x, y) {
      return x + y;
    };
    // Function Expression: ES6+
    const sum = (x, y) => { return x + y };
    ```
5. What are the differences between var, let and const?
6. What happens if you assign a variable without a keyword?
7. What’s the difference between Object Oriented Programming (OOP) and Functional Programming (FP)?
8. What’s the difference between imperative and declarative programming?
9. What is Prototype-Based Inheritance?
