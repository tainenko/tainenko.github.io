---
layout: post
title:  " 如何使用Python的日誌模組提高生產力 "
author: tony
categories: [ python ]
image: assets/images/python/python-logging.jpeg
tags: [ python,logging]
comments: true
crosspost_to_medium: true
---
日誌記錄是程序員工具箱中非常有用的工具。它可以幫助您更好地理解程序的流程，並發現在開發過程中可能沒有想到的場景。

日誌為開發人員提供了一組額外的眼睛，可以不斷地查看應用程序所經過的流。它們可以存儲信息，比如哪個用戶或IP訪問了應用程序。如果發生錯誤，它們可以提供比Traceback更多的信息，告訴您程序在到達發生錯誤的代碼行之前的狀態。

通過從正確的位置記錄有用的數據，您不僅可以輕鬆地調試錯誤，還可以使用這些數據來分析應用程序的性能，以進行擴展計劃，或者查看使用模式以進行市場營銷計劃。

# Logging Module
Python中的日誌模塊是一個隨時可用的功能強大的模塊，旨在滿足初學者和企業團隊的需求。大多數第三方Python庫都使用它，因此您可以將日誌消息與這些庫中的日誌消息集成，從而為您的應用程序生成同質日誌。

在你的Python程序中添加日誌就像這樣簡單:
```
import logging
```
導入日誌模塊後，您可以使用稱為“日誌記錄器”的東西來記錄您想要查看的消息。默認情況下，有5個標準級別表示事件的嚴重性。每個都有一個相應的方法，可以用來記錄在該嚴重級別上的事件。根據嚴重程度的增加順序，已定義的級別如下:
- DEBUG
- INFO
- WARNING
- ERROR
- CRITICAL

日誌模塊為您提供了一個默認的日誌記錄器，允許您不需要進行太多配置就可以開始工作。每層對應的方法可以調用如下示例所示:

```python
import logging

logging.debug('This is a debug message')
logging.info('This is an info message')
logging.warning('This is a warning message')
logging.error('This is an error message')
logging.critical('This is a critical message')
```
上面程序的輸出是這樣的:
```bash
WARNING:root:This is a warning message
ERROR:root:This is an error message
CRITICAL:root:This is a critical message
```
輸出顯示了每個消息之前的嚴重性級別，以及根級別，根是日誌模塊為其默認日誌記錄器提供的名稱。這種格式顯示了由冒號(:)分隔的級別、名稱和消息，是默認的輸出格式，可以配置為包含時間戳、行號和其他詳細信息。

> 注意，debug()和info()消息沒有被記錄下來。這是因為，默認情況下，日誌模塊記錄的消息的嚴重性級別為警告或以上。

# 基本配置
基本配置

你可以使用basicConfig(**kwargs)方法來配置日誌，basicConfig()的一些常用參數如下:

- level:根日誌記錄器將被設置為指定的嚴重級別。
- filename: 指定文件。
- filemode: 如果給定文件名，則以這種模式打開文件。默認值是a，表示追加。
- format: 這是日誌消息的格式。

通過使用level參數，您可以設置要記錄的日誌消息的級別。這可以通過傳遞類中可用的一個常量來實現，這將允許在該級別或更高的級別上記錄所有日誌調用。

```python
import logging

logging.basicConfig(level=logging.DEBUG)
logging.debug('This will get logged')
```
輸出會像這樣
```bash
DEBUG:root:This will get logged
```
現在將記錄DEBUG級別或更高級別的所有事件。

通過使用basicConfig()的更多參數，可以進一步定制根日誌程序，您可以從[官方文件](https://docs.python.org/3/library/logging.html#logging.basicConfig) 裡找到這些參數與其說明。

# 環境參數控制
在生產環境中，我們通常不希望將日誌等級設置為低於警告。在開發期間，我們可能希望將其設置為INFO，有時還設置為DEBUG。

透過環境變量控制日誌等級會是一個好方法。
因此，讓我們編寫代碼，用環境參數來控制日誌等級，並且賦予其一個默認值"INFO"-

```python
import logging
import os
LOGLEVEL = os.getenv("LOGLEVEL","INFO").upper()
logging.basicConfig(level=LOGLEVEL)
```
如何，是不是很簡單？

現在我們有了一段代碼讀取一個名為LOGLEVEL的環境變數，並且用其決定日誌等級，當我處於開發環境時，我可以將該變數設置為 DEBUG ，以便調試程式碼的執行結果，最重要的是這個環境變數不在生產環境的機器上，因此程式碼是安全的，不會在部署時出現什麼問題。

