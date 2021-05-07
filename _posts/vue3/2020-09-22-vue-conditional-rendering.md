---
layout: post
title:  " vue 條件式渲染 v-if v-else v-else-if"
author: tony
categories: [ vue3 ]
image: assets/images/vue/vue-conditional-rendering.jpg
tags: [vue,frontend,vue3,v-bind]
comments: true
crosspost_to_medium: true
---
我們在前面的章節裡學會了怎麼把數據綁定到HTML元素上，動態的生成我們所想要的頁面。但我們不會總是希望將所有的內容都呈現到網頁上，在某些情況我們會想要根據某些條件，將HTML元素隱藏、顯示、插入或移除。

# v-if 條件渲染 
Vue 提供了 `v-if` 指令可用於條件渲染，當`v-if`後面跟隨的表達式為Truthy時會將該元素插入DOM，反之若表達式為Falsy時則會將該元素自DOM裡頭移除。

## 語法
```html
<h1 v-if="isOK">當變數isOK為Truthy時，你才看得見我</h1>
```
> Javascript中對於Truthy的定義是：該數值在邏輯判斷時與true等價，但是數值並非boolean的true。  
> 所有值都是Truthy，除非它們是 false、0、""、null、undefined 或 NaN 。  
> 常會搞混的同學可以將上面六個Falsy背起來。

## 條件渲染多個元素
如果要使用一個`v-if`去控制多個元素的渲染，可以用`<template>`將多個元素包裏起來，`<template>`是一個不可見的包裏元素，並不會出現在渲染結果裡。
```html
<template v-if="isTechJob">
    <li>前端工程師</li>
    <li>後端工程師</li>
    <li>DBA</li>
    <li>IT工程師</li>
</template>
```
## v-else-if 和 v-else
`v-else-if`和`v-else`指令可以讓我們有更多的判斷條件去選擇要渲染的元素。

要注意的是兩者使用時都必須跟隨在`v-if`或`v-else-if`其後，否則將失去作用。
```html
<div v-if="ok">
現在OK
</div>
<div v-else>
現在不OK
</div>
```

```html
<div v-if="color === 'red'">
紅色
</div>
<div v-else-if="color === 'blue'">
藍色
</div>
<div v-else-if="color === 'green'">
綠色
</div>
<div v-else>
不紅、不藍、不綠
有可能是黑色的？
</div>
```

## 範例
以下是一個點擊按鈕後會切換輸入欄的範例，網頁渲染後如圖所示：

```html
<template>
  <div id="app">
    <template v-if="data.type==='username'">
      <label>Username：</label>
      <input type="text" placeholder="請輸入Username...">
    </template>
    <template v-else>
      <label>Eamil：</label>
      <input type="text" placeholder="請輸入email...">
    </template>
    <button @click="handleToggleClick">切換輸入類型</button>
  </div>
</template>

<script>
import {reactive} from 'vue';
export default {
  setup () {
    const data=reactive({type:'username'})
    const handleToggleClick=()=>{
      console.log(data.type);
      if(data.type === 'username'){
        data.type = 'email'
      } else{
        data.type = 'username'
      }}
    return {data,handleToggleClick}
  }
}
</script>
```


# 參考文獻
1. [MDN Truthy（真值）](https://developer.mozilla.org/zh-CN/docs/Glossary/Truthy)
