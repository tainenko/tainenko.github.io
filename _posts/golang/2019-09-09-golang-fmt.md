---
layout: post
title:  "Go語言fmt包的Print方法詳解"
author: tony
categories: [ golang fmt ]
image: assets/images/golang/tutorial.png
tags: [golang]
---

Go語言的標準輸出流在打印到屏幕時有些參數跟別的語言（比如C#和Java）不同，下面是我整理的一些常用的格式化輸入操作。

# General
- %v 以默認的方式打印變量的值
- %T 打印變量的類型

# Integer
- %+d 帶符號的整型，fmt.Printf("%+d", 255)輸出+255
- %q 打印單引號
- %o 不帶零的八進制
- %#o 帶零的八進制
- %x 小寫的十六進制
- %X 大寫的十六進制
- %#x 帶0x的十六進制
- %U 打印Unicode字符
- %#U 打印帶字符的Unicode
- %b 打印整型的二進制
# Integer width
- %5d 表示該整型最大長度是5，下面這段代碼
```
  fmt.Printf("|%5d|", 1)
  fmt.Printf("|%5d|", 1234567)
```
輸出結果如下：
```
|    1|
|1234567|  
```
- %-5d則相反，打印結果會自動左對齊
- %05d會在數字前面補零。

# Float
- %f (=%.6f) 6位小數點
- %e (=%.6e) 6位小數點（科學計數法）
- %g 用最少的數字來表示
- %.3g 最多3位數字來表示
- %.3f 最多3位小數來表示
# String
- %s 正常輸出字符串
- %q 字符串帶雙引號，字符串中的引號帶轉義符
- %#q 字符串帶反引號，如果字符串內有反引號，就用雙引號代替
- %x 將字符串轉換為小寫的16進制格式
- %X 將字符串轉換為大寫的16進制格式
- % x 帶空格的16進制格式
# String Width (以5做例子）
- %5s 最小寬度為5
- %-5s 最小寬度為5（左對齊）
- %.5s 最大寬度為5
- %5.7s 最小寬度為5，最大寬度為7
- %-5.7s 最小寬度為5，最大寬度為7（左對齊）
- %5.3s 如果寬度大於3，則截斷
- %05s 如果寬度小於5，就會在字符串前面補零
# Struct
- %v 正常打印。比如：{sam {12345 67890}}
- %+v 帶字段名稱。比如：{name:sam phone:{mobile:12345 office:67890}
- %#v 用Go的語法打印。  
比如
```
main.People{name:”sam”, phone:main.Phone{mobile:”12345”, office:”67890”}}
Boolean
```
- %t 打印true或false

# Pointer
- %p 帶0x的指針
- %#p 不帶0x的指針

參考
fmt.Printf format reference (cheat sheet)