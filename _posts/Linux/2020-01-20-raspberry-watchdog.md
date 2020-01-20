---
layout: post
title:  "Setting up the Raspberry Pi Watchdog!"
author: tony
categories: [ Raspberry ]
image: assets/images/watchdog.jpg
tags: [ raspberry,watchdog]
---
介紹如何啟用樹莓派的硬體看門狗功能，讓它在系統當機時可以自動重新開機。

樹莓派（Raspberry Pi）是一個價格低、功能強大的迷你電腦，結合各種感測器（sensors）之後，即可收集各類的感測資料，非常適合應用於現今的物聯網。

不過通常一般的感測器應用中，資料的收集與環境狀況的監控都是長期性的，而且通常管理者都不會一直待在感測器旁邊，如果負責收集資料的樹莓派突然當機（不論是因為硬體或是軟體等問題），又無法經由網路遠端連線進去看狀況時，唯一的解決辦法就是讓管理者跑到樹莓派旁邊手動重開機，這樣的問題通常在物聯網的應用中是很常見的。

為了避免這種當機後，手動重開機的麻煩，樹莓派的硬體上內建了一個看門狗（watchdog）的功能，它可以自動監控系統的運行狀況，當它發現系統卡在某個工作一直沒辦法跳出時，就會自動將系統重新開機。

# 看門狗運作原理
看門狗的運作原理是在硬體上實作一個倒數計時器（countdown timer），當這個計時器數到零時，就會將系統重新開機，而在正常的系統運行時，系統上的軟體會定期重設這個計時器，讓它在正常的狀況下永遠不會數到零（重開機），如果系統發生問題時（當機），軟體就會無法重設這個計時器，最後當計時器數到零的時候，就會自動重新開機了。

# 如何啟用
要使用樹莓派的硬體看門狗，首先啟用 bcm2835_wdt 這個核心模組:
```bash
modprobe bcm2835_wdt
```
設定開機後自動載入watchdog
```bash
echo "bcm2835_wdt" | sudo tee -a /etc/modules
```

> watchdog模組在Raspi3B+已經更名，如果出現以下錯誤訊息，請確認watchdog模組名稱是否正確。  
> pi@raspberrypi:~ $ sudo modprobe bcm2708_wdog  
modprobe: FATAL: Module bcm2708_wdog not found in directory /lib/modules/4.19.66-v7+

# 安裝 watchdog 監控 Daemon
啟用 Linux 的核心模組之後，我們還會需要一個軟體的監控程式來配合才能組成完整的看門狗功能，最簡單的方式就是直接使用 watchdog 這個監控 Daemon，它只要透過 apt 安裝一下就可以立即使用了：
```bash
sudo apt-get install watchdog
```

安裝好之後，我們還需要編輯看門狗的設定檔 /etc/watchdog.conf ，移除以下行的註解符號 "#"：
```bash
watchdog-device = /dev/watchdog
…..
max-load-1 = 24
max-load-5 = 18
max-load-15 = 12
```
接著設定想要監控的系統狀態，您可以自由選擇要監控哪一些。

## 系統負載（loading）
您可以設定系統負載的上限值，當 watchdog 發現系統負載超過這個上限值的時候，就會讓系統重新啟動。

```bash
max-load-1 = 24
max-load-5 = 18
max-load-15 = 12
```
這裡的數值是 /etc/watchdog.conf 的預設值，正常來說如果系統真的當機的話，系統的負載慧遠超過 25，這裡所設定的數值在系統正常的狀況下是不會重新啟動的。當然您可以依照自己的狀況來調整這個上限值。

## CPU 溫度
監控樹莓派的 CPU 溫度，當溫度太高時，則關機：
```bash
temperature-device = /sys/class/thermal/thermal_zone0/temp
max-temperature = 80000
```
/sys/class/thermal/thermal_zone0/temp 中儲存的數值是控樹莓派的 CPU 溫度，單位是攝氏千分之一度，我們這裡設定讓 CPU 在超過攝氏 80ᵒC 時重新啟動。而 watchdog 再溫度達到這個數值的 90%、95% 與 98% 時，也會先發出警告。

## 記憶體
監控記憶體的使用量，當虛擬記憶體（virtual memory）太少時，則重新啟動：
```bash
min-memory = 1
```
這裡的記憶體單位是 pages，您可以用 getconf 查看自己系統的 page size 是多大：

getconf PAGESIZE
或是

getconf PAGE_SIZE
輸出會類似這樣
4096

以這個例子來說，一張 page 的大小就是 4096 bytes。

## 網路
監控某個 IP 位址：
```bash
ping = 172.31.14.1
```
亦可用廣播位址監控整個 subnet 上的主機（這個要小心使用）：

ping = 172.26.1.255
監控網路卡式否有流量：

interface = eth0
## 檔案
監控檔案是否可以正常存取，如果無法存取檔案，則重新啟動：
```bash
file = /var/log/messages
```
watchdog 會使用 stat 檢查檔案，如果傳回錯誤的話並不會重新啟動，如果 stat 在呼叫時卡住，超過一分鐘之後 watchdog 才會將系統重新啟動，這個狀況通常會發生 NFS 掛載的檔案系統上。

## 管理者 Email
設定管理者的 Email，讓系統重新啟動或是關機前，以 Email 通知管理者：
```bash
admin = admin@gtwang.org
```
## 即時監控模式
在負載量比較大的系統中，watchdog 很容易被作業系統搬到記憶體的交換空間（swap），如果來不及搬回記憶體時，很容易造成系統不必要的重新啟動，如果想避免這樣的狀況，可以啟用即時監控模式（realtime），讓 watchdog 常駐在記憶體中：
```bash
realtime = yes
```
# 開機自動啟動看門狗
先啟動 watchdog 常駐程式進行測試：
```bash
sudo service watchdog start
```
當確認設定沒問題之後，就可以讓 watchdog 在開機時就自動啟動：
```bash
sudo update-rc.d watchdog defaults
```
# 當機測試
安裝好看門狗之後，可以用這個 fork-bombs 測試一下，執行這個指令之後，它會不停重複 fork 出新的行程，造成系統當機：

```bash
:(){ :|:& };:
```
正常來說，執行這個指令稿之後，系統就會馬上當住，您可以透過這個方式測試看門狗是否會讓系統重新啟動。

> 請不要在一般的 Linux 主機上執行 fork-bombs，它會造成系統當機！

正常在執行 fork-bombs 之後，系統負載會在幾秒之內迅速上升，然後重新開機，這是 /var/log/daemon.log：
```bash
Feb 16 14:14:56 raspberrypi watchdog[3818]: loadavg 88 18 6 is higher than the given threshold 24 18 12!
Feb 16 14:14:56 raspberrypi watchdog[3818]: /usr/lib/sendmail does not exist or is not executable (errno = 2)
Feb 16 14:14:56 raspberrypi watchdog[3818]: shutting down the system because of error -3
```

# Reference
1. [RPi3B+ and watchdog...](https://www.raspberrypi.org/forums/viewtopic.php?t=210974)
2. [Setting up the Raspberry Pi Watchdog 設定樹莓派看門狗](https://tw.wuchipc.com/2017/04/29/setting-raspberry-pi-watchdog-%E8%A8%AD%E5%AE%9A%E6%A8%B9%E8%8E%93%E6%B4%BE%E7%9C%8B%E9%96%80%E7%8B%97/)
3. [樹莓派硬體看門狗（Watchdog）：當機時自動重新開機](https://blog.gtwang.org/iot/raspberry-pi-hardware-watchdog/)
