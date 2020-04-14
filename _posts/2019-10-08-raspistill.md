---
layout: post
title: "Raspberry pi camera tutorial"
author: tony
categories: [ raspberry pi, camera]
image: assets/images/pi_camera.jpg
tags: [raspberry pi]
---
# 目錄

[作用](#作用)  
[使用格式](#使用格式)  
[圖像參數與命令](#圖像參數與命令)  
[預覽參數與命令](#預覽參數與命令)  
[圖像參數與命令2](#圖像參數與命令2)  
[提示](#提示)  
[預覽參數與命令2](#預覽參數與命令2)  
[raspivid](#raspivid)  
[raspiyuv](#raspiyuv)  
[raspistill](#raspistill)  
# 作用
運行raspberry pi的camera module，並且可以儲存照片。

# 使用格式
```bash
raspistill [options]
```

# 圖像參數與命令
|||
:---|:---
-?,  --help             | 幫助文檔
-w,  --width            | 設置圖像寬度 <尺寸>
-h, --height            | 設置圖像高度 <尺寸>
-q, --quality           | 設置jpeg品質 <0到100>
-r, --raw               | 增加raw原始拜爾數據到JPEG元數據
-o, --output            | 輸出文件名 <文件名>，如果要寫到stdout，使用`-o -`，如果不特別指定，圖像文件不會被保存
-l, --latest            | 鏈接最近的完整圖像到指定文件 <文件名>
-v, --verbose           | 在運行攝像頭時輸出詳細信息
-t, --timeout           | 拍照和關閉時的延時指定，未指定時默認是5s
-th, --thumb            | 設置預覽圖（小圖）參數（包括X、Y、品質）或者不設置
-d, --demo              | 運行一個demo模式（cycle through range of camera options, no capture），括號裏的我可以理解成循環測試模式嗎？
-e, --encoding          | 編碼來輸出指定格式文件 （jpg, bmp, gif, png）
-x, --exif              | 將可交換圖像文件應用到捕獲中（格式：`key=value`）或者不設置
-tl, --timelapse        | 間隔拍攝，每<ms>拍攝一張圖片
-fp, --fullpreview      | 用靜態捕捉分辨率運行預覽（可能會減小預覽幀率）
-k, --keypress          | 按鍵觸發，按`ENTER`鍵拍照，按`X`然後`ENTER`鍵退出
-s, -signal             | 信號觸發，等待另一個進程信號來拍攝一張照片
-g, -gl                 | 繪制預覽到文本，而不是使用視頻渲染組件（啥意思？）
-gc, --glcapture        | 捕獲GL幀buffer而不是攝像機圖像
-set, --settings        | 檢索攝像機設置值然後寫出到stdout
-cs, --camselect        | 選擇攝像頭設備 <數字>，默認0
-bm, --burst            | 運行burst capture mode
# 預覽參數與命令
|||
:---|:---
-p, --preview           | 預覽窗口大小設置 <x,y,w,h>
-f, --fullscreen        | 全屏幕預覽模式
-op, --opacity          | 預覽窗口透明度 （0-255）
-n, --nopreview         | 不顯示預覽窗口
# 圖像參數與命令2
|||
:---|:---
-sh, --sharpness        | 設置圖像銳度 （-100 到 100）
-co, --contrast         | 設置圖像對比度 （-100 到 100）
-br, --brightness       | 設置圖像亮度 （0 到 100）
-sa, --saturation       | 設置圖像飽和度 （-100 到 100）
-ISO, --ISO             | 設置攝像頭感光度
-vs, --vstab            | Turn on video stabilisation 開啟攝像頭防抖模式（是這個意思嗎？）
-ev, --ev               | 設置EV補償
-ex, --exposure         | 設置曝光模式（參見提示）
-awb, --awb             | 設置AWB模式（參見提示）
-ifx, --imxfx           | 設置圖像效應（參見提示）
-cfx, --colfx           | 設置色彩效應（參見提示）
-mm, --metering         | 設置測光模式（參見提示）
-rot, --rotation        | 設置圖像旋轉 （0到359）
-hf, --hflip            | 設置水平翻轉 horizontal flip
-vf, --vflip            | 設置垂直翻轉 vertical flip
-roi, --roi             | 設置interest區域 （啥叫interset?）
--ss, --shutter         | 設置快門速度，微秒
--awbg, --awbgains      | 設置AWB閾值， AWB模式必須關閉
--drc, --drc            | 設置DRC水平
# 提示

|曝光模式選項||
:---|:---
auto | 自動曝光模式
night | 夜間拍攝模式
nightpreview | 夜間預覽拍攝模式
backlight | 逆光拍攝模式
spotlight | 聚光燈拍攝模式
sports | 運動拍攝模式
snow | 雪景拍攝模式
beach | 海灘拍攝模式
verylong | 長時間曝光拍攝模式
fixedfps | 幀約束拍攝模式
antishake | 防抖模式
fireworks | 煙火拍攝模式

|自動白平衡選項||
:---|:---
off | 關閉白平衡測算
auto | 自動模式（默認）
sun | 日光模式
cloud | 多雲模式
shade | 陰影模式
tungsten | 鎢燈模式
fluorescent | 熒光燈模式
incandescent | 白熾燈模式
flash | 閃光模式
horizon | 地平線模式


|圖像特效選項||
:---|:---
none | 無特效（默認）
negative | 反色圖像
solarise | 曝光過度圖像
posterize | 色調圖像
whiteboard | 白板特效
blackboard | 黑板特效
sketch | 素描風格特效
denoise | 降噪圖像
emboss | 浮雕圖像
oilpaint | 油畫風格特效
hatch | 草圖特效
gpen | 馬克筆特效
pastel | 柔化風格特效
watercolour | 水彩風格特效
film | 膠片顆粒風格特效
blur | 模糊圖像
saturation | 色彩飽和圖像
colourswap | 暫未可用
washedout | 暫未可用
posterise | 暫未可用
colourpoint | 暫未可用
colourbalance | 暫未可用
cartoon | 暫未可用


|測光模式選項||
:---|:---
average | 全畫面平衡測光
spot | 點測光
backlit | 模擬背光圖像
matrix | 陣列測光

# 預覽參數與命令2
|||
:---|:---
-gs, -glscene           | GL屏幕尺寸等參數
-gw, -glwin             | GL窗口參數

# raspivid
采集視頻信息，需要時會再補充翻譯

# raspiyuv
采集YUV格式的原始圖像，需要時會補充翻譯
