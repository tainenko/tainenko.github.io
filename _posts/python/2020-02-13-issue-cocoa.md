---
layout: post
title:  '[Issue]  Could not find the Qt platform plugin "cocoa" in ""'
author: tony
categories: [ python ]
image: assets/images/python/qt-opencv.jpg
tags: [python, opencv,mac]
---
純粹記錄執行Opencv的程式碼時所遇到的問題，今天在MacOS的環境測試相關程式碼時，terminal拋出下面這條錯誤訊息:
```bash
qt.qpa.plugin: Could not find the Qt platform plugin "cocoa" in ""
This application failed to start because no Qt platform plugin could be initialized. Reinstalling the application may fix this problem.

[1]    2682 abort      python
```
trace後發現問題出在cv2.imread的function。

網路上的建議解法有：
1. reinstall qt
    ```bash
    brew reinstall qt
    ```
    重新安裝後仍然出現錯誤。
2. 安裝 opencv-python-headless
    ```bash
    pip install opencv-python-headless
    ```
    安裝後成功解決問題。
