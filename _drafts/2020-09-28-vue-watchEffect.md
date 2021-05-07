---
layout: post
title:  " Vue3 更多響應式 effect watch watchEffect"
author: tony
categories: [ vue3 ]
image: assets/images/vue/vue-computed.jpg
tags: [vue,frontend,vue3,v-bind]
comments: true
crosspost_to_medium: true
---
Side Effect 的定義是一個函數在運算的過程中，做了和本身運算返回值沒有關係的事，比如修改某個全域變數，修改傳入的參數，甚至是執行`console.log`都算是side effect

常見的Side Effect包括：
- 修改傳進來的參數
- 修改外部的狀態
- 發送 HTTP Request
- DB 查詢
- 印出 log
- 獲取 Input
- DOM 查詢
- 訪問系統狀態

簡單而言，只要是在運算的過程中，▋**改變了系統狀態或是和系統外部進行交互**，都可以歸類在side effect。

Vue3提供了和side effect有關的API：`effect`、`watch`和`watchEffect`，這些API主要的功用就是從組件裡把Side Effect抽離，讓組件的其他部份更純淬，避免Side Effect在前端的世界裡不可避免，你總是會遇上ajax渲染的需求。

# `effect`
`effect`函數是一個依賴收集函數，只要在函數的內部調用了響應式物件，該響應式物件就會把`effect`函數收集起來，之後只要響應式資料被更新了，就會執行一次`effect`函數。

> 別忘了，響應式物件就是`ref`和`reactive`的返回值

舉個例子
```html
<script>
import {ref} from 'vue'
export default {
  setup () {
    const count = ref(0)
  }
}
</script>

```
