---
layout: post
title:  "Introduction of IPMI Tools"
author: tony
categories: [ Linux ]
image: assets/images/Linux-has-you.png
tags: [ linux, ipmi]
---


ipmi介紹和使用

技術分享

IPMI 是什麽

IPMI 工作原理

IPMI 能幹嘛

IPMI Functionality

Side-Band and Out-of-Band

利用ipmi可以實現以下功能

IPMI 怎麽做

註意

服務器端 設置

客戶端 設置

本地操作系統裏操作

遠程操作

IPMI 是什麽?
The Intelligent Platform Management Interface (IPMI) specification is an Intel led standard which defines a set of common interfaces to a computer system which system administrators can use to monitor system health and manage the system. More than two hundred companies support IPMI. Dell, HP, Intel Corporation and NEC Corporation announced IPMI v1.0 on 1998-09-16, v1.5 on 2001-03-01, and v2.0 on 2004-02-14. The technology is now considered a de-facto standard.

IPMI是智能型平臺管理接口（Intelligent Platform Management Interface）的縮寫，是管理基於 Intel結構的企業系統中所使用的外圍設備采用的一種工業標準，該標準由英特爾、惠普、NEC、美國戴爾電腦和SuperMicro等公司制定。用戶可以利用IPMI監視服務器的物理健康特征，如溫度、電壓、風扇工作狀態、電源狀態等。而且更為重要的是IPMI是一個開放的免費標準，用戶無需為使用該標準而支付額外的費用。

自1998 年，IPMI論壇創建了IPMI標準依賴，其已經得到了170 多家供應商的支持，這使得其逐漸成為了一個完整地包括服務器和其他系統（如存儲設備、網絡和通信設備）的硬件管理規範，目前該標準最新版本為IPMI 2.0，該版本在原有基礎上有了不少的改進，包括可以通過串口、Modem以及Lan等遠程環境管理服務器系統（包括遠程開關機），以及在安全、VLAN 和刀片支持等方面的提高。

IPMI針對大量監控、控制和自動回復服務器的作業，提供了智能型的管理方式。此標準適用於不同的服務器拓樸學，以及Windows、Linux、 Solaris、Mac或是混合型的操作系統。此外，由於IPMI可在不同的屬性值下運作，即使服務器本身的運作不正常，或是由於任何原因而無法提供服務，IPMI仍可正常運作。

IPMI的核心是一個專用芯片/控制器(叫做服務器處理器或基板管理控制器(BMC))，其並不依賴於服務器的處理器、BIOS或操作系統來工作，可謂非常地獨立，是一個單獨在系統內運行的無代理管理子系統，只要有BMC與IPMI固件其便可開始工作，而BMC通常是一個安裝在服務器主板上的獨立的板卡，現在也有服務器主板提供對IPMI支持的。IPMI良好的自治特性便克服了以往基於操作系統的管理方式所受的限制，例如操作系統不響應或未加載的情況下其仍然可以進行開關機、信息提取等操作。

在工作時，所有的IPMI功能都是向BMC發送命令來完成的，命令使用IPMI規範中規定的指令，BMC接收並在系統事件日誌中記錄事件消息，維護描述系統中傳感器情況的傳感器數據記錄。在需要遠程訪問系統時，IPMI新的LAN上串行(SOL)特性很有用。SOL改變IPMI會話過程中本地串口傳送方向，從而提供對緊急管理服務、Windows專用管理控制臺或Linux串行控制臺的遠程訪問。BMC通過在LAN上改變傳送給串行端口的信息的方向來做到這點，提供了一種與廠商無關的遠程查看啟動、操作系統加載器或緊急管理控制臺來診斷和維修故障的標準方式。

IPMI 工作原理?
當需要對系統文本控制臺進行遠程訪問時，Serial Over LAN (SOL) 功能將非常有用。SOL 通過 IPMI 會話重定向本地串行接口，允許遠程訪問 Windows 的緊急事件管理控制臺 (EMS) 特殊管理控制臺 (SAC)，或訪問 LINUX 串行控制臺。這個過程的步驟是 IPMI 固件截取數據，然後通過局域網重新發送定向到串行端口的信息。 這就提供了遠程查看 BOOT、OS 加載器或緊急事件管理控制臺以診斷並修復服務器相關問題的標準方法，而無需考慮供應商。它允許在引導階段配置各種組件。

而在命令傳輸的安全性方面，用戶也無需擔心，IPMI增強的認證(基於安全哈希算法1和基於密鑰哈希消息認證)和加密(高級加密標準和Arcfour)功能有助於實現安全的遠程操作。對VLAN的支持更是為設置管理專用網絡提供了方便，並且可以以通道為基礎進行配置。

IPMI 能幹嘛?
IPMI Functionality?
An IPMI sub-system operates independently of the operating system and allows administrators to manage a system remotely even in the absence of an operating system or the system management software, or even if the monitored system is powered off, but connected to a power source. IPMI can also function after the operating system has started, and exposes management data and structures to the system management software. IPMI prescribes only the structure and format of the interfaces as a standard, while detailed implementations may vary. An implementation of IPMI version 1.5 can send out alerts via a direct serial connection or side-band local area network (LAN) connection to a remote client. IPMI uses what is called a side-band LAN connection, which utilizes the board Network Management Interface (NIC). This solution is less expensive of a dedicated LAN connection but also has limited bandwidth. Systems compliant with IPMI version 2.0 can also send alerts via serial over LAN. System administrators can then use IPMI messaging to query platform status, to review hardware logs, or to issue other requests from a remote console through the same connections. The standard also defines an alerting mechanism for the system to send a simple network management protocol (SNMP) platform event trap (PET).

Side-Band and Out-of-Band?
IPMI implements what is often called a “side-band” management LAN connection. This connection utilizes a System Management Bus (SMBUS) interface between the BMC and the boardNetwork Interface Controller (NIC). This solution has the advantage of reduced costs but also provides limited bandwidth – sufficient for text console redirection but not for video redirection. In other words, when a remote computer is down the system administrator can access it through IPMI and utilize a text console. This will be sufficient for a few vital functions, such as checking the event log, accessing the BIOS setup and perform power on, power off or power cycle. However, more advanced functions, such as remote re-installation of an operating system, may require an Out-of-band management approach utilizing a dedicated LAN Connection.

利用ipmi可以實現以下功能?
1.可以在服務器通電（沒有啟動操作系統）情況下，對它進行遠程管理：開機，關機，重啟

2.基於文本的控制臺重定向，可以遠程查看和修改bios設置，系統啟動過程，登入系統等

3.可以遠程通過sol連接服務器，解決ssh服務無法訪問，遠程安裝系統，查看系統啟動故障等問題

4.可以通過系統的串行端口進行訪問

5.故障日誌記錄和 SNMP 警報發送，訪問系統事件日誌 (System Event Log ,SEL) 和傳感器狀況

IPMI 怎麽做?
測試環境：dell r410服務器，支持ipmi 2.0，第一個網卡接交換機

Dell的BMC可以通過主板集成的第一塊網卡實現網絡管理，ipmi設置的IP需要單獨占用。

Dell服務器在1850/2850系列中，實現了IPMI v1.5規範，也就是能夠通過ipmi指令來關閉和重啟服務器，但是不能ipmi控制臺登錄。Dell服務器在1950/2950之後，實現了IPMI v2.0規範，才能將控制臺重定向到ipmi，這樣可以遠程連接服務器，就像連接了鍵盤和顯示器。

在激活IPMI Over LAN 時會提示BMC Management traffic will not function properly if the LAN on Motherboad (LOM) is teamed with any network adapter add-in-cards，這表明如果主板上網卡和附加網卡 bonding時，IPMI功能將失效。

服務器端 設置?
1.ipmi配置SOL (Serial Over LAN) ）: Remember to make sure that your Base management controller has IPMI 2.0 functionality.
當開機自檢到以下屏幕的時候，按 ctrl-E進入ipmi的配置：
技術分享
進入IPMI界面：
技術分享
進入 LAN Parameters ，配置 nic selection 為 Share：
技術分享
設置ipv4為靜態， 設置ip。如果不需要通過外網來管理，可以不設置網關：
技術分享
設置用戶名和密碼，這裏我設置為ADMIN和password：
技術分享

2.配置bios的console redirection：
開機按了f2 後，自檢後會出現如下界面，
技術分享
再按f2，選擇 Serial Communication,
技術分享
選擇 "Serial Communication"後，配置如下：
技術分享
And then modify the field labeled "Serial Communication" to be "On with Console Redirection via COM2". This will pipe all the console traffic to COM2, which is connected to the BMC.

註意?
Failsafe baud rate 設置為115200後，grub和kernel等相關的速度設置要一致，不然可能會顯示亂碼。
Remote Terminal Type設置為VT100/VT220後，client需保持一致。
Redirection After Boot設置為Enabled，以便能通過sol控制操作系統。
Instead of using "VT100/VT220" as your terminal type, you may select "ANSI", the output will not be as pretty though, since ANSI doesn‘t support some of the characters represented in the console.
Once your settings are configured press "Enter", then "Escape". Save the changes to the BIOS and Reboot.

ipmi的網絡需和服務器第一塊網卡即eth0通

3．配置操作系統：
vi /boot/grub/grub.conf
配置的結果為：

serial --unit=1 --speed=115200 --word=8 --parity=no --stop=1 terminal --timeout=3 console serial default=0 timeout=5 title CentOS (2.6.18-194.el5) root (hd0,0) kernel /vmlinuz-2.6.18-194.el5 ro root=LABEL=/ console=tty0 console=ttyS1,115200n8 initrd /initrd-2.6.18-194.el5.img
配置解釋如下:
在第一條Title的前面加入如下兩行，將grub重定向到com口，這樣到開始加載grub的時候，系統會顯示：Press any key to continue.按任意鍵後就可以進入grub的選擇菜單。

serial --unit=1 --speed=115200 --word=8 --parity=no --stop=1 terminal --timeout=5 serial console
註釋 splashimage，因為只能重定向文本內容

#splashimage=(hd0,0)/grub/splash.xpm.gz
註釋 hiddenmenu ，這樣如果有多個內核或者操作系統，就可以選擇grub了

#hiddenmenu
將參數console=tty1 console=ttyS1,115200傳遞到內核中就可以實現CONSOLE重定向到串口，就可以看到系統啟動過程了

kernel /vmlinuz-2.6.18-194.el5 ro root=/dev/VolGroup00/LogVol00 console=tty1 console=ttyS1,115200
註： kernel 這行如果不配置 console=tty1，在系統的啟動的時候即使接了顯示器也不會顯示內核啟動的過程。

vi /etc/inittab
#必須是文本才能重定向，所以不能選擇5 - X11

id:3:initdefault:
#為了顯示登陸系統的界面

7:2345:respawn:/sbin/agetty -h ttyS1 115200 vt100
vi /etc/securetty #為了能通過sol登入系統

ttyS1
客戶端 設置?
yum install -y OpenIPMI OpenIPMI-tools
mac下terminal 設置如下：註意： 將終端仿真程序窗口設置為 80x25。否則，屏幕可能會出現亂碼。
有時行顯示重疊，重新開一個tab，再連sol就會正常。
有些機器重啟後在以下界面會停留近10分鐘：

GRUB Loading stage2... Press any key to continue.
本地操作系統裏操作?
chkconfig ipmi on service ipmi start
使用 ipmitool 命令設置IPMI：

ipmitool -I open lan set 1 ipaddr 10.10.10.8 ipmitool -I open lan set 1 netmask 255.255.255.0 ipmitool -I open lan set 1 access on
如果需要設置網關：

ipmitool -I open lan set 1 defgw ipaddr 10.10.10.99
加強BMC安全，修改默認的SNMP通訊串：

ipmitool -I open lan set 1 snmp COMUNIATION
設置null用戶的密碼：

ipmitool -I open lan set 1 password PASSWD
設置root用戶密碼：

ipmitool -I open user set password 2 PASSWD
檢查配置：

ipmitool -I open lan print 1
遠程操作?
檢查目標服務器是否啟動：開機，關機

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD power status
軟關機，相當於快速按下電源鍵：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD power soft
硬關機，相當於按下電源鍵幾秒鐘：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD power off
啟動系統：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD power on
軟重啟：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD power cycle
硬重啟（這跟人為的按電源鍵硬重啟或者非正常掉電一樣,可能會造成硬盤的raid丟失或者數據的丟失）：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD power reset
顯示系統日誌(sel, system event log)：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD sel list
修改密碼：

ipmitool -I lan -H 10.10.10.8 -U ADMIN -P PASSWORD user set password 2 NEWPASSWORD
console重定向，按~.退出：

ipmitool -I lanplus -U ADMIN -P PASSWORD -H 10.10.10.8 sol activate
Note: Sometimes you‘ll find that when you exit the console, the BMC will still believe that the session is connected, and so when you try to connect again, it will say console redirection is already open. To fix this, type "sol deactivate" instead of "sol activate". This will disconnect the previously connected session and you‘ll be free to issue your command again (sol activate), and you should be able to connect without any problem.

其他命令見help：

ipmitool --help
#如果不用ipmi sol來實現遠程管理，還可以用終端服務器解決方案：終端服務器有許多COM口，可以同時連接多個服務器（或者網絡設備如思科路由器）的CONSOLE，以實現集中式管理。



ipmi介紹和使用