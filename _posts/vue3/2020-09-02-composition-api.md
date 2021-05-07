---
layout: post
title:  " Vue3: Composition api "
author: tony
categories: [ vue3 tutorial ]
image: assets/images/vue/banner-composition-api.jpg
tags: [ vue,frontend,javascript,composition api]
comments: true
crosspost_to_medium: true
---
首先，我們先來看一下 Vue2 的 Options Api 於大規模網路應用程序中的侷限性，它主要存在著以下三個缺點：
- 大型組件很難維護
- 組件邏輯複用困難
- 對Typescript的支持有限

這是因為 Options Api是通過組件選項(data, methods, lifecycle等)撰寫的，而不是透過邏輯組織程序，隨著更多的組件選項添加以及程序庫的增長，一個帶有許多特性的大型組件在 Options API 的架構下，程序會散落在組件各處，變得十分笨拙且難以閱讀。

因此，為了解決上述問題， Vue3 引入了一個新的程序編寫方式： Composition API
![comparion-options-composition-api](../../assets/images/vue/comparision-option-api-composition-api.png)

對於初學者來說，原來很明確的程序編寫方式，現在全部都存放在 `stepup()` 一個方法裡頭，會不會更混亂？  
答案是肯定的，這也是作者在設計 Vue3 時的一個取捨。
> 他們相信：  
> 1.提高上限的收益大於降低下限的損失;  
> 2.通過良好的文件和社群的指導，可以高效地解決程序組織問題；

# 引進 Composition API後的改變
在 Vue3 初期並不會有什麼變化， Vue3 依然支援 Options Api的寫法，但是如果你是 Vue2 的開發者，我依然鼓勵迎接 Composition API 的懷抱。

以下的項目在Composition Api裡仍維持現狀：
- Vue CLI
- 模板語法
- 物件的格式
- 響應式系統
- 計算屬性、觀察者和組件生命週期的概命
- 單組件檔案的格式

# Vue實例生命週期
Vue的生命週期在這裡不會詳盡的介紹，對於生命週期只要先有一個觀念，實例化的組件的數據和組件是分開管理的，一直到Mounted的階段Vue才會呼叫瀏覽器渲染畫面，後面的章節我們會在學習Vue的過程中，逐一介紹每個生命週期階段做的哪些事。
![lifecycle](../../assets/images/vue/vue-lifecycle.png)
## 生命週期鉤子
Vue3 重命名了生命週期鉤子相關的API名稱，現在必須在生命週期鉤子加上 `on` 的前綴來訪問組件的生命週期鉤子。
下表展示了生命週期鉤子是如何在`setup()`內部調用的，順帶一提，由於`setup()`本身就是圍繞在beforeCreate和created之間運行的，因此你不需要再顯式調用這兩個生命週期鉤子。
Options API	    ->  Hook inside `setup`  
beforeCreate    ->  Not needed  
created	        ->  Not needed  
beforeMount	    ->  onBeforeMount  
mounted	        ->  onMounted  
beforeUpdate    ->  onBeforeUpdate  
updated	        ->  onUpdated  
beforeUnmount   ->  onBeforeUnmount  
unmounted       ->  onUnmounted  
errorCaptured   ->  onErrorCaptured  
renderTracked   ->  onRenderTracked  
renderTriggered ->  onRenderTriggered  

# Composition Api 語法
## setup() 函數
在 Vue3 的 Composition Api 裡，我們主要在 [setup()](https://vue-composition-api-rfc.netlify.com/api.html#setup) 函數裡書寫組件的邏輯。

`setup` 函數有兩個參數，分別是：
– props
– context

> this 關鍵字在 setup 函數裡無法發揮作用。
> 因此`this.$attrs`, `this.$slots`, `this.$emit`, `this.$parent`, `this.$root`. 在 Vue3 裡是以 `context` 的參數來傳遞，使用時需要呼叫 context.attrs, context.slots, context.emit, context.parent, context.root

以下是一個setup()語法的例子。
```
//Hello.vue
<template>
    <h1>{{speech}}</h1>
</template>
<script>
import { ref, computed } from '@vue/composition-api';
export default {
  props: {
    name: String
  },
  setup(props,context) {
    console.log(props.name);
    // context.attrs 對應 this.$attrs
    // context.slots 對應 this.$slots
    // context.emit  對應 this.$emit
    // context.parent 對應 this.$parent
    // context.root 對應 this.$root
    const speech = computed(() => "Welcome " + props.name + '!');
    // 若變數想要在template或style區塊的使用，需要在setup函數裡return
    return {
      speech
    };
  }
};
</script>
```

更多的語法或是生命週期函數，例如 ref, watcher, lifecycle hooks，我們會在後續的章節介紹。
# 小結
在本章裡，你學到了
- Vue3 的 Composition Api
- 組件的生命週期
- setup函數


# Reference
1. [Vue 3 Composition API examples](https://github.com/ShetlandJ/Vue3Todo)

