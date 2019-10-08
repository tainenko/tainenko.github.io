---
layout: post
title:  "Markdown 錨點語法"
author: tony
categories: [markdown]
image: assets/images/11.jpg
tags: [markdown]
---
Markdown 錨點語法
# 規則
任意 1-6 個 # 標註的標題都會被添加上同名的錨點鏈接

	[標題1](#標題1) 
	[標題2](#標題2) 
	[標題3](#標題3) 

	# 標題1
	## 標題2
	### 標題3
錨點跳轉的標識名稱，可使用任意字符，大寫字母要轉換成小寫

	[Github標題1](#github標題1)

	### Github標題1
多單詞錨點的空格用 - 代替

	[Github 標題2 Test](#github-標題2-test)

	### Github 標題2 Test
多級序號需要去除 .

	[2.3. Github 標題](#23-github-標題)

	### 2.3. Github 標題
注意
> 非英文的錨點字符，在單擊跳轉時，在瀏覽器的 url 中會按照規則進行 encode 和 decode