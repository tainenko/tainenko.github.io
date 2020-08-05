---
layout: post
title:  " How to create a Vue 3 Project "
author: tony
categories: [ frontend ]
image: assets/images/vue/create-vue3.jpg
tags: [ vue3, frontend]
comments: true
crosspost_to_medium: true
---
踏入Vue 3的第一步，讓我們學習如何安裝、創建和配置一個Vue3的專案項目吧。
> 溫馨提醞：   
>在google以"Vue 3" "安裝"為關鍵字的搜尋結果大多是vue-cli3的安裝教學，千萬要小心圖文不符的教學文章。

# Vue3安裝方法
Vue3專案項目的安裝方法有三個：  
1. 直接從git clone一份已經配置好的repo
2. 從vue 2的專案項目升級至vue 3
3. 使用vue-cli(>=4.5.0)創建Vue 3專案

## 1. 直接從git clone一份已經配置好的repo
Vue 3官方團隊提供了一個專案項目 **vue-next-webpack-preview**，這為我們提供了一個包括Vue 3在內的最小Webpack配置。
```bash
$ git clone https://github.com/vuejs/vue-next-webpack-preview.git vue3-project
$ cd vue3-project
$ npm i
```
一旦 git clone結束和NPM dependencies也安裝好了之後，我們就可以移除src資料夾裡頭的範例文件，然後創建一個新的**main.js**文件，開發屬於我們自己的Vue 3項目。
```
$ rm -rf src/*
$ touch src/main.js
```

## 2. 從vue 2的專案項目升級至vue 3
第二種和第三種安裝方式，我們選擇用官方提供的腳手架工具 - @vue/cli。讀者們可以從官方的說明文件找到關於 @vue-cli 的詳盡說明。
[https://cli.vuejs.org/guide/](https://cli.vuejs.org/guide/)

> Node 版本需求  
> Vue CLI 需要 [Node.js](https://nodejs.org/) 版本為8.9以上(推薦8.11.0)，本示例教程已預設讀者都配置好了 Node.js 環境。

### 安裝 @vue-cli
首先，我們需要透過npm或yarn安裝 @vue-cli
```bash
$ npm install -g @vue/cli
# OR
$ yarn global add @vue/cli
```
安裝完成後，你應該在 command line 可以使用 **vue** 指令，你可以簡單地在cmd輸入 vue 後回車，如果 @vue-cli 確實有安裝成功，你應該會看到 vue 可用的指令幫助訊息。
```bash
Usage: upgrade [options] [plugin-name]

(experimental) upgrade vue cli service / plugins

Options:
  -t, --to <version>    Upgrade <package-name> to a version that is not latest
  -f, --from <version>  Skip probing installed plugin, assuming it is upgraded from the designated version
  -r, --registry <url>  Use specified npm registry when installing dependencies
  --all                 Upgrade all plugins
  --next                Also check for alpha / beta / rc versions when upgrading
  -h, --help            output usage information
```
你也可以透過以下指令確認當前系統所安裝的 @vue-cli 版本為何。
```
$ vue --version
```
假如你已經有一個Vue 2的專案項目，我們可以通過插件升級的方式將專案升級到 Vue 3，我們進入項目資料夾，並輸入以下指令：
```
# 實際操作時記得將your-project-name換成你的Vue 2項目名稱
$ cd your-project-name
$ vue add vue-next
```
執行上述指令後，會自動安裝 vue-cli-plugin-vue-next 的插件，該插件會完成以下操作：
- 安裝 Vue 3.0 依賴
- 更新 Vue 3.0 webpack loader 配置，使其能夠支持 .vue 文件構建
- 創建 Vue 3.0 的模板代碼
- 將專案裡的 Vue Router 和 Vuex 升級到 4.0 版本，如果未安裝則不會升級
- 自動生成 Vue Router 和 Vuex 的模板

完成上述操作後，專案正式升級到 Vue 3.0 ，注意 Vue 3尚未完成typescript的全面技持，使用typescript的讀者要再等等。

## 3. 使用Vue Cli創建Vue 3專案
若是尚未完成Vue Cli的安裝，麻煩回到上一步的Vue Cli安裝說明依序執行，Vue Cli在版本4.5.0之後才支持 Vue 3 專案的創建，首先我們必須確認系統的 Vue Cli 版本。
```
#需要>= 4.5.0
$ vue --version
```
如果版本不滿足的，可以使用以下指令升級 Vue Cli
```
$npm update -g @vue/cli
# OR
$yarn global upgrade --latest @vue/cli
```
### 使用 create 創建 Vue 3 專案
在 cmd line鍵入以下指令：
```
$ vue create vue3-project
```
你會看到在項目選單裡多了一個 Vue 3 preview的選項
```bash
Vue CLI v4.5.0
? Please pick a preset: (Use arrow keys)
  Default ([Vue 2] babel, eslint) 
❯ Default (Vue 3 Preview) ([Vue 3] babel, eslint) 
  Manually select features 
```
你也可以選擇第三個手動配置，為 Vue 專案添加更多配置。
```
Vue CLI v4.5.0
? Please pick a preset: Manually select features
? Check the features needed for your project: 
❯◉ Choose Vue version
 ◉ Babel
 ◉ TypeScript
 ◉ Progressive Web App (PWA) Support
 ◉ Router
 ◉ Vuex
 ◉ CSS Pre-processors
 ◉ Linter / Formatter
 ◉ Unit Testing
 ◉ E2E Testing
```
> 再次提醒： Vue 3 目前處於RC版本，相關配置是否完善需要留心官方的開發進度，目前已知typescript尚未全面支持，至少我在項目初始化後發現typescript的unit-test依賴有問題，已有人在issue區回報。

以上就是Vue 3專案的三種創建方法，
專案創建完全後就可以進入專案項目，開始 Vue3 的開發之旅。
```bash
$ cd vue3-project
$ npm run dev
```
