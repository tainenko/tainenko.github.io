---
layout: post
title:  "How to solve .bash_profile not working in zsh"
author: tony
categories: [ OSX, zsh ]
image: assets/images/oh-my-zsh.png
tags: [zsh,bash_profile,oh-my-zsh]
---

# 問題描述
將OSX的terminal從bash轉換成zsh，並安裝 oh-my-zsh plugin後，發現 .bash_profile自定義的項目都失效。

# 問題分析
oh-my-zsh有自己的配置文件 .zshrc ，因此原本的 .bash_profile 的設定並沒有生效。

# 解決方法
在 ~/.zshrc 裡頭多加上一行 source ~/.bash_profile，讓原先的設定項目生效。
```bash
$ vi ~/.zshrc

# add in the content of .zshrc
source ~/.bash_profile

$ source ~/.zshrc
```