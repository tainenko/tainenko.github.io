---
layout: post
title:  " Vue3 計算屬性 computed"
author: tony
categories: [ vue3 ]
image: assets/images/vue/vue-computed.jpg
tags: [vue,frontend,vue3,v-bind]
comments: true
crosspost_to_medium: true
---
根據官方文件，`computed` 設計的初衷是避免開發者在樣板區塊放入太多的邏輯。我們在管理數據時會希望資料來源一致，假如有兩個變數，變數2的數值是可以經由變數1推導得到，我們就該將它們簡化成一個變數加上一個`computed`物件，日後就不必維護兩個變數。

# 語法
`computed`接受一個函數參數，返回是一個`ref`的實例，預設是只讀的。
```javascript
const computedVariable = computed(()=>{//do somethind 
                                        return value
                                        })
```

# 範例
假設我們有一個會員資料頁面，其中一個欄位是出生年，同時要顯示民國年和西元年，我們當然可以儲存兩個值在後台，然後分別綁定到頁面上，不過這顯示不是一個很好的做法，因為要維護兩個變數。

因為西元年可以藉由民國年加上1911推導而來，因此我們可以使用`computed`函數從民國年去計算得到西元年。
```html
<script>
import {computed} from 'vue'
export default {
  setup () {
    const birth=ref(0)
    const birthInAD=computed(()=>birth+1911)
    return {birth,birthInAD}
  }
}
</script>
```

雖然`computed`函數返回的是一個`ref`物件，不過預設是不能修改，重新對`computed`的變數賦值會產生一個 Vue warning。
```html
<script>
import {computed} from 'vue'
export default {
  setup () {
    const birth=ref(0)
    const birthInAD=computed(()=>birth+1911)
    birthInAD.val = 2020
    console.log('民國出生年:',birth)
    console.log('西元出生年:',birthInAD)
    return {birth,birthInAD}
  }
}
</script>
```
輸出結果
```
[ Vue warn] : Computed property was assigned to but it has no setter.
民國出生年: 0
西元出生年: 1911
```

# getter & setter
為什麼`computed`函數的返回值預設會只讀，我們可以從上面的例子開始討論。

首先，我們呼叫了`computed`創立了一個birthInAD的變數，同時告訴了`coumputed`函數兩件事，第一、birthInAD的值是由birth變數推導而來，第二、推導的公式為 `birthInAD = birth+1911`。  

接著我們可能因為某種原因必須更新birthInAD的值，但是被拒絕了，為什麼呢？是不是因為我們建立了birthInAD和birth兩者的推導關係，如果只更新birthInAD的數值就會使得這個關係被破壞，很明顯不合理，因此我們必須要反推導birth的數值並且同時更新。

也就是說，原先我們建立的是單向的推導關係，現在要把關係變為雙向。
> 我們可以傳入一個擁有get和set屬性的物件給`computed`函數，創建一個可以重新賦值的computed物件
```html
<script>
import {computed, ref} from 'vue'
export default {
  setup () {
    const birth=ref(0)
    const birthInAD=computed({
    get:()=> birth + 1911
    set:(val)=>{birth.value = val - 1911}
    })
    birthInAD.val = 2020
    console.log('民國出生年:',birth)
    console.log('西元出生年:',birthInAD)
    // 輸出結果
    // 民國出生年: 89
    // 西元出生年: 2020
    return {birth,birthInAD}
  }
}
</script>
```


