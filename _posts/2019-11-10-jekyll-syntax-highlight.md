---
layout: post
title:  "Add Syntax Highlighting to your Jekyll site with Rouge"
author: tony
categories: [ jekyll ]
image: assets/images/jekyll.jpg
tags: [jekyll, rouge, kramdown, syntax highlight]
---
整理文章時發現Jekyll解析markdown時並沒有把code block做出syntax highlight的效果，程式碼看起來不舒服。  

上網找了在Jekyll加上syntax highlight的教程，蠻簡單的，只需要幾個步驟：
1. 本地端安裝 **kramown** 和 **rouge** :
    ```bash
    gem install kramdown rouge
    ```
1. 編輯 _config.yml，加上 Syntax 設定如下：
    ```yaml
    # Syntax
    markdown: kramdown
    highlighter: rouge
    ```
3. 產生你想要的 highlight 風格 css檔案: 
    rouge1.11支援的theme有以下幾種   
    base16, base16.dark, base16.monokai, base16.monokai.light, base16.solarized, base16.solarized.dark, colorful, github, gruvbox, gruvbox.light, molokai, monokai, monokai.sublime, thankful_eyes  
    
    舉例來說，我們可以用以下指令產生 molokai 的 css檔案：
    ```bash
    rougify style monokai > assets/css/syntax.css
    ```
    filepath可以改成你自己存放 css 的路徑，一般 jekyll 的 css 都存放在 assets/css/ 底下。  
4. 在 html template 中引用新增的 stylesheet。 (通常加在 \<head>\</head> ) 裡面。  
    我自己的主題，是在 _layouts/default.html 的 head 新增如下：
    ```html
    <head>
   
    <!-- Syntax Highlighting -->
    <link href="/assets/css/syntax.css" rel="stylesheet" >

    </head>
    ```
做完上述的調整便可以將所有的變動push到github，等待github編釋新的頁面，重新整理瀏覽器後就可以看到 syntax highlight 的效果出現在文章裡頭。

Ref.  
[Add Syntax Highlighting to your Jekyll site with Rouge](https://bnhr.xyz/2017/03/25/add-syntax-highlighting-to-your-jekyll-site-with-rouge.html)  
[Kramdown/Rouge doesn't highlight syntax?](https://stackoverflow.com/questions/43905103/kramdown-rouge-doesnt-highlight-syntax)  