---
layout: post
title:  " vue 列表式渲染 v-for"
author: tony
categories: [ vue3 ]
image: assets/images/vue/v-for.png
tags: [vue,frontend,vue3,v-bind]
comments: true
crosspost_to_medium: true
---
`v-for`指令是提供了一個動態渲染 array 或是 Object的方法，我們可以在`<template>`區塊使用 `item in items`的語法來呼叫v-for進行動態渲染。

# v-for 語法
```
v-for="item in items"
```
其中 `items` 是我們在setup裡頭宣告的array，item代表在array裡頭的值，v-for會從頭到尾的根據array的內容生成html元素。
## 範例
###  程式碼
```
<template>
    <ul>
      <li v-for="city in cities">
        {{ city }}
      </li>
    </ul>
</template>
```
```
<script>
export default {
  setup () {
    const cities=ref(['Taipei','New Taipei City','Taoyuan','Kaohsiung'])
    return {cities}
  }
}
</script>
```

<ul id="array-rendering">
  <li v-for="item in items">
    {{ item.message }}
  </li>
</ul>

Vue.createApp({
  data() {
    return {
      items: [{ message: 'Foo' }, { message: 'Bar' }]
    }
  }
}).mount('#array-rendering')
### 結果
上述的html頁面渲染結果如下
- Taipei
- New Taipei City
- Taoyuan
- Kaohsiung

## 取得index
`v-for`的語法和javascript的for-loop一樣，當我們在遍歷過程中想要同時取得陣列中的值和指標時，只要這樣寫就可以了。
```
<template>
    <ul>
      <li v-for="city, index in cities">
        {{ index }} - {{ city }}
      </li>
    </ul>
</template>
```
### 結果
上述的html頁面渲染結果如下
- 0 - Taipei
- 1 - New Taipei City
- 2 - Taoyuan
- 3 - Kaohsiung

# 陣列內容更新
下列的方法會對陣列進行資料異動，不管我們在哪裡呼叫這些方法，vue只要觀測到了陣列的資料更新，便會進行重新渲染。
- push()
- pop()
- shift()
- unshift()
- splice()
- sort()
- reverse()

# 替換整個陣列
有些時候，你可能不想更動陣列中的資料，而是產生一個新的陣列再渲染，下列的方法會返回一個新的陣列，而不是修改原有的陣列。
- filter()
- concat() 
- slice()

例如，你只想渲染陣列中的偶數個內容，你可以這麼寫：
```
<template>
    <ul>
      <li v-for="city, index in even_cities">
        {{ index }} - {{ city }}
      </li>
    </ul>
</template>
```
```
<script>
export default {
  setup () {
    const cities=['Taipei','New Taipei City','Taoyuan','Kaohsiung']
    const even_cities=computed(cities.filter((item,index)=>{return index%2===0}))
    return {even_cities}
  }
}
</script>
```
## 不好的寫法
綜合使用`v-for`和`v-if`做列表式的條件渲染也可以出現上述結果，但是我們不推薦這麼做，因為效能不佳。

比較好的做法是用`computed`搭配方法去產生一個新的陣列。
```
<template>
    <ul>
      <li v-for="city, index in cites">
        <template v-if="index%2===0">
        {{ index }} - {{ city }}
        </template>
      </li>
    </ul>
</template>
```
```
<script>
export default {
  setup () {
    const cities=ref(['Taipei','New Taipei City','Taoyuan','Kaohsiung'])
    return {cities}
  }
}
</script>
```

# 用Range指定迴圈次數
`v-for`可以指定一個數字當作迴圈次數，以下是一個範例
v-for can also take an integer. In this case it will repeat the template that many times.

```
<div id="range" >
  <span v-for="n in 10">{{ n }}隻羊</span>
</div>
```
# 使用<template>標籤
和`v-if`類似，`v-for`同樣能夠使用在`<template>`標籤上同時渲染多個html元素。

範例如下
```
<ul>
  <template v-for="item in items">
    <li>{{ item.msg }}</li>
    <li class="divider" role="presentation"></li>
  </template>
</ul>
```

# 在`v-for`裡使用Object
## Object的v-for語法
類似陣列在`v-for`中的使用法式，Object在`v-for`裡的語法如下：
```
<div v-for="(value, key, index) in object">
  {{ index }}. {{ key }}: {{ value }}
</div>
```
## 範例
```
<ul id="v-for-object" class="demo">
  <li v-for="value,key in object">
     {{ key }} {{ value }}
  </li>
</ul>
```

```
<script>
export default {
  setup () {
      const object={								
            '中正區':100,
            '大同區':103,
            '中山區':104,
            '松山區':105,
            '大安區':106	
        }
    return {object}
    }
  }
</script>
```
渲染結果如下
```					
中正區　 100		
大同區　 103		
中山區　 104		
松山區　 105		
大安區　 106	
```
>注意：  
>Object的渲染順序是根據 Object.keys() 而來，並不能保證它的順序在不同的Javascript Engine都是相同的。


