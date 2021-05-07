---
layout: post
title:  " vue3 事件監聽 v-on"
author: tony
categories: [ vue3 ]
image: assets/images/vue/v-for.png
tags: [vue,frontend,vue3,v-on,event-handling]
comments: true
crosspost_to_medium: true
---
我們可以使用 `v-on` 指令去監聽 DOM 事件，並且在事件被觸發時執行我們定義的 Javscript 函數

# `v-on` 語法
```
v-on:事件名稱="函數名稱"
```
`v-on`也可縮寫成`@`
```
@事件名稱="函數名稱"
```

# 範例
這是一個onclick事件的範例，我們在button上使用`v-on`監聽 DOM 的click事件，每當按鈕被點擊便會觸發事件，進而執行我們定義的函數onClick。

此處我們定義的onClick函數的功能就是把 count 加一，因此每點擊一次就會更新count的值，頁面也會響應式的重新渲染。
```
<template >
    <p>{{ count }}</p>
    <button @click="onClick">點擊後加1</button>
</template>

<script>
import {ref} from 'vue'
export default {
  setup () {
    const count=ref(0)
    function onClick(){
      count.value++
    }
    return {count,onClick}
  }
}
</script>
```
# 傳參數給事件函數
我們稍微修改一下上面的計數器，讓它可以接受一個參數，讓計數器的增加數量由傳入的參數來決定，而不是每點擊一次就加1。

傳參數的方法很簡單，只要在`v-on`的函數名稱呼叫時也帶參數就可以了。
```
<template >
    <p>{{ count }}</p>
    <button @click="onClick(2)">點擊後加2</button>
    <button @click="onClick(5)">點擊後加5</button>
</template>

<script>
import {ref} from 'vue'
export default {
  setup () {
    const count=ref(0)
    function onClick(num){
      count.value+=num
    }
    return {count,onClick}
  }
}
</script>
```
# DOM事件
有的時候，我們會需要原始的 DOM 事件來處理一些情境，遇到這種情況，你可以傳入一個代表 DOM 事件的特殊參數 `$event`
```
<template >
    <button @click="onSubmit($event)">Submit</button>
</template>

<script>
export default {
  setup () {
    function onSubmit(event){
        if(event){
            // 現在我們可以操作DOM的原生事件
            event.preventDefault()
        }   
        // 做點什麼

    }
    return {onSubmit}
  }
}
</script>
```
# 綁定多個函數
`v-on`可以同時綁定多個函數在一個事件上，只要用書寫時用`,`將函數隔開。
```
<template >
    <p>{{ count1 }}</p>
    <p>{{ count2 }}</p>
    <button @click="onClick1,onClick2">點擊後加1和2</button>
</template>

<script>
import {ref} from 'vue'
export default {
  setup () {
    const count1=ref(0)
    const count2=ref(0)
    const 
    function onClick1(){
      count1.value+=1
    }
    function onClick2(){
      count2.value+=2
    }
    return {count1,count2,onClick}
  }
}
</script>
```
# 事件修改器
在前端開發的過程中，我們時常會去呼叫 DOM事件 去阻止一些預設的行為，例如 阻止表單提交`event.preventDefault()` 或 阻止冒泡`event.stopPropagation()`。

雖然可以在觸發的事件函數裡處理這些事情，也不是什麼難事，但是Vue提供了一個更方便的事件修改器，讓開發人員可以在`v-on`綁定時就修改事件的預設行為。

- `.stop`
- `.prevent`
- `.capture`
- `.self`
- `.once`
- `.passive`

``` html
<!-- 阻止冒泡事件 -->
<a @click.stop="doThis"></a>

<!-- 停止submit事件的預設提交 -->
<form @submit.prevent="onSubmit"></form>

<!-- 你可以用連鎖的方式使用多個事件修改器 -->
<a @click.stop.prevent="doThat"></a>

<!-- 為事件添加補獲的監聽器 -->
<!-- Javscript的事件傳遞是先補獲再冒泡 -->
<div @click.capture="doThis">...</div>

<!-- 只有自身的事件才會觸發(意即無視冒泡和補獲事件) -->
<div @click.self="doThat">...</div>

<!-- click事件只會觸發一次 -->
<a @click.once="doThis"></a>

<!-- 無視`event.preventDefault()` ，仍然執行預設行為               -->
<div @scroll.passive="onScroll">...</div>
```

# 更多的事件修改器
Vue同時提供了許多好用的事件修改器和`v-on`搭配，例如：
## 鍵盤修改器
當對應的按鍵被按下時才會觸發事件，例如：

```
<!-- 只有按下 `enter` 鍵時才會觸發 submit -->
<input @keyup.enter="submit" />
```
以下是Vue所提供的常用鍵關鍵字
- `.enter`
- `.tab`
- `.delete` 
- `.esc`
- `.space`
- `.up`
- `.down`
- `.left`
- `.right`
## 滑鼠鍵
- `.left` 左鍵
- `.right` 右鍵
- `.middle` 中鍵

# 小結
在本章中，你學到了
- `v-on` 處理 DOM事件
- 事件修改器，修改預設的 DOM 事件行為
- 鍵盤與滑鼠的事件監聽
