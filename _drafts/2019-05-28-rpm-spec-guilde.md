---
layout: post
title:  "RPM包rpmbuild SPEC文件說明"
author: tony
categories: [ rpm ]
image: /assets/images/climb-the-treeRPM-Commands-Linux.png
tags: [rpm, spec, linux, guilde]
---
RPM的功能，就是把程式用 RPM 封裝成一個軟體，然後再透過 RPM 的方式安裝到Linux平台。

## RPM Build 資料夾結構
RPM Package 的目錄結構如下:
- BUILD : RPM 安裝過程自動建立的檔案，包括configure、make．
- RPMS : 最後建立成功的RPM Package
- SOURCES : 要安裝的檔案，需用 tar ball 的方式封裝(如 example.tar)
- SPECS : RPM 建立規格檔
- SRPMS : source RPM ，意即原始檔案。

每個目錄都會放RPM 指定的內容，資料夾的結構不存在時，執行rpmbuild -bb ${package}會自動建立資料夾目錄。

## RPM Build 前置作業
```bash
mkdir -p /home/software/myrpm : 先建立我的RPM Builder 資料夾
cd /home/software/myrpm
mkdir RPMS SOURCES SPECS SRPMS BUILD : 建立RPM相關資料夾
```
## 建立安裝檔
接著將我要安裝的檔案放置在 SOURCE 裡
```bash
cd /home/software/myrpm/SOURCES
mkdir mypackage-1.0 : 建立 package 的資料夾與版號
cd mypackage-1.0
vim mytest : 建立一個要安裝的檔案，內容就輸入:
echo "Auto install New File , sucess!"
用 Tar -zcvf 打包安裝檔
cd /home/software/myrpm/SOURCES :回到SOURCE打包 tar 檔
tar -zcvf mypackage.tar.gz mypackage-1.0
```

結果如下
```bash
[puritys]SOURCES$ tar -zcvf mypackage.tar.gz mypackage-1.0
mypackage-1.0/
mypackage-1.0/mytest
[puritys]SOURCES$ ls
mypackage-1.0  mypackage.tar.gz
[puritys]SOURCES$

```

 
## 建立安裝規格檔 (SPEC)
```bash
cd /home/software/myrpm/SPECS : 進入SPEC目錄
```

vim example.spec :內容如下
```bash
#宏變數，宣告格式如右: %define variable value
#使用宏變數時需要用分號開頭，並以大括號包覆　ex. %{variable}
%define _topdir /home/software/myrpm/
%define Version 1.0
%define RPM_BUILD_ROOT _topdir
%define Name mypackage
%define BuildRoot /tmp/%{Name}-buildroot
#RPM相關資料
Summary:        My First RPM Package
Name:           %{Name} # Package 名稱
Version:        %{Version} #版號
Release:        1
Vendor:         no <cxxand@gmail.com> 
Packager:       myName <mail@gmail.com> #開發者資料
License:        GPL
Group:          develope
Source :        mypackage.tar.gz #tar ball檔案
BuildRoot:      %{BuildRoot} # RPM Build 的暫存目錄
 
%description
其他相關說明
 
%prep
%setup -q
 
%build
 
%install
#設定安裝的實際路徑與檔案
install -d %{BuildRoot}/home/mypackage/
cp mytest %{BuildRoot}/home/mypackage/
 
%files
#安裝時:設定預設的檔案權限
%defattr(755,root,root)
#安裝時:設定檔案的屬性 chmod,chown,chgrp
%attr(755,root,root) /home/mypackage/mytest
 
%clean
rm -rf %{BuildRoot}/  
```

```bash
SPEC 說明
%prep : prepare的意思，安裝前執行的語法
%setup -q : 解開打包的 tar檔 (mypackage.tar.gz)
%install : 建立 RPM 時，執行的內容
install -d %{BuildRoot}/home/mypackage/ : 建立資料夾
cp mytest %{BuildRoot}/home/mypackage/ : 將檔案搬到指定的路徑
這裡的路徑，都要指定 RPM 建立的暫存根目錄 (BuildRoot)，根目錄後面就是直實的系統資料，未來安裝時會自動去掉前面的根目錄。
%files : 設定要搬移的檔案與權限
/home/mypackage/mytest :指定要安裝這個檔案
%clean : 時束後，清除沒用的檔案
```
## 建立自已的 PRM
cd /home/software/myrpm/SPECS
rpmbuild -bb example.spec
如果沒發生錯誤的話，檔案就會建立在 RPM/i386/mypackage-1.0-1.i386.rpm (OS版本不同，有可能出現 i686 之類的)

## 安裝我們建立的 RPM
```bash
cd /home/software/myrpm/
sudo rpm -ivh RPMS/i386/mypackage-1.0-1.i386.rpm
```

執行結果如下：
```bash
[puritys]myrpm$ sudo rpm -ivh RPMS/i386/mypackage-1.0-1.i386.rpm
Preparing...                ########################################### [100%]
   1:mypackage              ########################################### [100%]
 
```

測試看看是否正常安裝成功
```bash
cd /home/mypackage
sh mytest
[puritys]mypackage$ sh mytest
Auto install New File , sucess!
```


 
## 自動打包，建立RPM
上面的步驟還是有點多，要先打包tar ，然後再建立package，感覺就很怪，為什麼要做兩次，我就寫個 Shell script來簡化一下作業程序。

先在 /home/software/myrpm/ 建立一個 mkMyCron.sh 的 shell script
```bash
File:mkMyCron.sh
VERSION=1.0
ROOT=/home/software/myrpm
NAME=MyCron
SOURCE_DIR=$ROOT/SOURCES/$NAME-$VERSION
 
#自動建立 tar ball
mkdir $SOURCE_DIR
cp /etc/crontab $SOURCE_DIR/
cd SOURCES && tar -zcvf $ROOT/SOURCES/$NAME.tar.gz $NAME-$VERSION
cd ../
 
#建立 SPEC file
cat > SPECS/$NAME.spec << EOF
%define _topdir $ROOT
%define Version 1.0
%define RPM_BUILD_ROOT _topdir
%define Name $NAME
%define BuildRoot /tmp/%{Name}-buildroot
Summary:        My First RPM Package
Name:           %{Name}
Version:        %{Version}
Release:        1
Vendor:         no <cxxand@gmail.com>
Packager:       myName <mail@gmail.com>
License:        GPL
Group:          develope
Source :        $NAME.tar.gz
BuildRoot:      %{BuildRoot}
 
%description
其他相關說明
%prep
%setup -q
 
%build
 
%install
#設定安裝的實際路徑與檔案
install -d %{BuildRoot}/home/mycron/
cp crontab %{BuildRoot}/home/mycron/
 
%files
#安裝時:設定預設的檔案權限
%defattr(755,root,root)
#安裝時:設定檔案的屬性
/home/mycron/crontab
 
%clean
rm -rf %{BuildRoot}/
EOF
 
 
rpmbuild -bb SPECS/$NAME.spec
```
執行他，只要寫好script，一步就完成RPM Build囉!有空趕快把你的程式、設定檔建立成Package，以後安裝就方便多了。
```bash
sh mkMyCron.sh 
```
## RPM使用方式
- rpm -ivh example.rpm : 安裝
- rpm -e example : 刪除安裝檔，會自動移除相關的檔案
- rpm -qa | grep example : 查詢系統安裝的package
- rpm -qi rpmName：查詢 RPM Info
- rpm -q --filesbypkg rpmName： 搜尋 RPM 中安裝的所有檔案
- rpm -qid packagename ： 取得 RPM 說明
- rpm -qf filename： 查詢某個檔案所屬的 package 名稱

## RPM Reference
http://fedora.linuxsir.org/fedoradocs/rpm-guide/en/  
線上的tutorial ．寫的很詳盡。

http://www.logiqwest.com/TechnicalPapers/rpmScriptInstall.html  
這個也是英文的教學，不過範例算是很ok了.