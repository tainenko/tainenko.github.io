---
layout: post
title:  "Frontend Interview Exercise"
author: tony
categories: [ frontend, interview ]
image: assets/images/javascript/javascript-interview-questions-and-answers.png
tags: [ frontend,css,javascript,interview]
comments: true
crosspost_to_medium: true
---
Front Interview Questions and Answers including javascript, css, vanilla.js and some situational problem.

# Question 1
Given a string and determine whether is a palindrome  

Example 1.  
**Input**: aabbaa  
**Output**: true  

Example 2.  
**Input**: abcde  
**Output**: false  

## Solution
```typescript
function isPalindrome(str: string): boolean{
     let re = /[^A-Za-z0-9]/g;
     str = str.toLowerCase().replace(re, '');
    for(let i=0,j=str.length;i<j;i++,j--){
        if(str[i]!==str[j]){
            return false;
        }
    }
    return true;
}
``` 

# Question 2
Please refactor the following CSS snippets
```css
.wrap .container .row{
    display: block;
    width: 100%;
    overflow: hidden;
    position: relative;
}
.wrap .container .row .column-1 .row{
    display: block;
    width: 100%;
    position: relative;
    border-bottom: 1px solid red;
}
.wrap .container .row .column-2 .container.flex{
    display: flex;
}
.wrap .container .row .column-3{
    font-size: 16px;
}
.wrap .container .row .column-3 .text {
    font-size: 16px;
    line-height: 20px;
}
.wrap .container .row .column-4 .darkContainer{
    background: rgba(0,0,0,0.5);
    display: block;
    width: 100%;
    position: relative;
}
```
## Solution
Just remove redundant values from css and alphabetize the properties.
```css
.wrap .container .row{
    display: block;
    overflow: hidden;
    position: relative;
    width: 100%;
}
.wrap .container .row .column-1 .row{
    border-bottom: 1px solid red;
}
.wrap .container .row .column-2 .container.flex{
    display: flex;
}
.wrap .container .row .column-3{
    font-size: 16px;
}
.wrap .container .row .column-3 .text {
    line-height: 20px;
}
.wrap .container .row .column-4 .darkContainer{
    background: rgba(0,0,0,0.5);
}
```
# Question 3
By using native-js (vanilla JS) and simple CSS, please try to render an UI looks like this image below:  
![East end](../../assets/images/javascript/eastend.png)

# Question 4
There are following data need to save in **client-side storage**:  
- User access token: **f706Ne%f|N]dy/[BisS^C2%J=/i8Ncx)#ZuyqDuGs**
- User age: ** 25 **
- User name:  ** George **
- Video autoplay toggle: true
- User search records: ["car", "android", "iphone" ...]

Please explain which client-side storage you will choose to store each item and __the reason__ compared with others.

## Solution
- Cookie: User access token
- Session storage: User age、 User name
- Local storage: video autoplay toggle、 user search records


# Question 4
We have 3 div elements, each of them has a click handler associated.
![3 Div elements](../../assets/images/javascript/three-rectangles-css-div.png)
```html
<div class="div-1">
    <p>Div 1</p>
    <div class="div-2">
    <p>Div 2</p>
        <div class="div-3">
            <p>Div 3</p>
        </div>
    </div>
</div>
```
Please write code for assigning these event handlers in a way, that when Div is clicked, following sequence is printed in console:  
div-2->div-3->div-1

## Solution
According to the description, the div component would look like below:
```javascript
//individual Div element
const DivElement=({content,className,onClick})=>{
    return(
        <div className={className} onClick={onClick}>
            <p>{content}</p>
            {this.props.children}
        </div>
    )
}
```
Overall structure would look like:
```javascript
const OverlapDiv=()=>{
    const onClick=(e)=>{
        for(let i in [2,3,1]){
            console.log(`Div${i} is clicked!`);
        }
    }
    return(
        <DivElement className="div-1" content="Div 1" onClick={onClick}>
                    <DivElement className="div-2" content="Div 2">
                                <DivElement className="div-3" content="Div 3"/>
                    </DivElement>
        </DivElement>
    )
}
```

```css
.div-1{
    position: relative;
}
.div-2{
    pointer-events: none;
    position: absolute;
    z-index: 1;
}
.div-3{
    pointer-events: none;
    position: absolute;
    z-index: 2;
}
```

# Question 5
What happens after the browser receives the first HTML response from the server until the full page is displayed and cn be interactedwith?  
__Please try to list the steps in order.__

## Solution
See ref. [https://vanseodesign.com/web-design/browser-requests/](https://vanseodesign.com/web-design/browser-requests/)
# Question 6
Please share with us one frontend trending topic you are researching recently, what it is about and why.(answers can be simple.)  

example:  
svelte, a new frontend framework which can be compared with react/vuejs/angular.  
I'd like to study why it can be faster than other esistingframework and the benefit to apply into my current projects.
