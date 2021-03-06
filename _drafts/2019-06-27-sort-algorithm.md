---
layout: post
title:  "RPM包 - rpmbuild SPEC文件說明"
author: tony
categories: [ rpm ]
image: /assets/images/RPM-Commands-Linux.png
tags: [rpm,spec,linux]
---

為什麽要制作rpm包，以及如何使用.src.rpm文件生成rpm包。最後部分還看到.src.rpm的內容，實際上 就是由.tar.gz源碼、補丁軟件和.spec腳本組成的。由此知道，使用.spec生成rpm包是比較簡單的，因為.src.rpm通常都是由軟件開 發者或者第三方的專業制作人根據源碼調試好的，所以，只要處理好平台兼容性和相關的版本，不會遇到太大的問題。  
但我覺得單純明白用.spec生成rpm是不夠的。常見有兩個原因值得我們去了解用如何用源碼制作rpm：

1. 並不是所有的軟件都提供.rpm方式的。 
這是最常見的原因。負責任的開發者應提供rpm方式的二進制軟件包，以便用戶選擇使用。但也很常見就是軟件作者只是發布了源碼，最後一部分的編譯和安裝需要用戶自行解決。
2. 自行打包一些文件或自己開發了一套軟件  
如果您想在安裝的過程中就把一套額外的軟件部署完畢，那使用rpm方式通常是唯一的方法。而且rpm還有數據庫協助軟件升級、文件校驗等，結合yum升級方式，沒有理由不選擇rpm。

## 編寫spec腳本 
由前面的日志了解到，生成rpm除了源碼外，最重要的就是懂得編寫.spec腳本。rpm建包的原理其實並不覆雜，可以理解為按照標準的格式整理一些信息，包括：軟件基礎信息，以及安裝、卸載前後執行的腳本，對源碼包解壓、打補丁、編譯，安裝路徑和文件等。  
實際過程中，最關鍵的地方，是要清楚虛擬路徑的位置，以及宏的定義。 

## 關鍵字 
spec腳本包括很多關鍵字，主要有：   
- Name: 軟件包的名稱，後面可使用%{name}的方式引用  
- Summary: 軟件包的內容概要  
- Version: 軟件的實際版本號，例如：1.0.1等，後面可使用%{version}引用
- Release: 發布序列號，例如：1linuxing等，標明第幾次打包，後面可使用%{release}引用
- Group: 軟件分組，建議使用標準分組
- License: 軟件授權方式，通常就是GPL
- Source: 源代碼包，可以帶多個用Source1、Source2等源，後面也可以用%{source1}、%{source2}引用
- BuildRoot: 這個是安裝或編譯時使用的“虛擬目錄”，考慮到多用戶的環境，一般定義為：
    %{_tmppath}/%{name}-%{version}-%{release}-root  
    或  
    %{_tmppath}/%{name}-%{version}-%{release}-buildroot-%(%{__id_u} -n}  
該參數非常重要，因為在生成rpm的過程中，執行make install時就會把軟件安裝到上述的路徑中，在打包的時候，同樣依賴“虛擬目錄”為“根目錄”進行操作。
後面可使用$RPM_BUILD_ROOT 方式引用。  
- URL: 軟件的主頁
- Vendor: 發行商或打包組織的信息，例如RedFlag Co,Ltd
- Disstribution: 發行版標識
- Patch: 補丁源碼，可使用Patch1、Patch2等標識多個補丁，使用%patch0或%{patch0}引用
- Prefix: %{_prefix} 這個主要是為了解決今後安裝rpm包時，並不一定把軟件安裝到rpm中打包的目錄的情況。這樣，必須在這裏定義該標識，並在編寫%install腳本的時候引用，才能實現rpm安裝時重新指定位置的功能
- Prefix: %{_sysconfdir} 這個原因和上面的一樣，但由於%{_prefix}指/usr，而對於其他的文件，例如/etc下的配置文件，則需要用%{_sysconfdir}標識
- Build Arch: 指編譯的目標處理器架構，noarch標識不指定，但通常都是以/usr/lib/rpm/marcros中的內容為默認值
- Requires: 該rpm包所依賴的軟件包名稱，可以用>=或<=表示大於或小於某一特定版本，例如：   
libpng-devel >= 1.0.20 zlib   
※“>=”號兩邊需用空格隔開，而不同軟件名稱也用空格分開
還有例如PreReq、Requires(pre)、Requires(post)、Requires(preun)、Requires(postun)、BuildRequires等都是針對不同階段的依賴指定 
- Provides: 指明本軟件一些特定的功能，以便其他rpm識別
- Packager: 打包者的信息
- %description 軟件的詳細說明


## spec腳本主體 
spec腳本的主體中也包括了很多關鍵字和描述，下面會一一列舉。我會把一些特別需要留意的地方標註出來。
- %prep 預處理腳本  
%setup -n %{name}-%{version} 把源碼包解壓並放好  
通常是從/usr/src/asianux/SOURCES裏的包解壓到/usr/src/asianux/BUILD/%{name}-%{version}中。  
一般用%setup -c就可以了，但有兩種情況：一就是同時編譯多個源碼包，二就是源碼的tar包的名稱與解壓出來的目錄不一致，此時，就需要使用-n參數指定一下了。  
- %patch 打補丁  
通常補丁都會一起在源碼tar.gz包中，或放到SOURCES目錄下。一般參數為：  
%patch -p1 使用前面定義的Patch補丁進行，-p1是忽略patch的第一層目錄  
%Patch2 -p1 -b xxx.patch 打上指定的補丁，-b是指生成備份文件  
◎補充一下   
```bash
%setup 不加任何選項，僅將軟件包打開。  
%setup -n newdir 將軟件包解壓在newdir目錄。  
%setup -c 解壓縮之前先產生目錄。  
%setup -b num 將第num個source文件解壓縮。  
%setup -T 不使用default的解壓縮操作。  
%setup -T -b 0 將第0個源代碼文件解壓縮。  
%setup -c -n newdir 指定目錄名稱newdir，並在此目錄產生rpm套件。  
%patch 最簡單的補丁方式，自動指定patch level。  
%patch 0 使用第0個補丁文件，相當於%patch ?p 0。  
%patch -s 不顯示打補丁時的信息。  
%patch -T 將所有打補丁時產生的輸出文件刪除。  
```
- %configure 這個不是關鍵字，而是rpm定義的標準宏命令。意思是執行源代碼的configure配置  
在/usr/src/asianux/BUILD/%{name}-%{version}目錄中進行 ，使用標準寫法，會引用/usr/lib/rpm/marcros中定義的參數。  
另一種不標準的寫法是，可參考源碼中的參數自定義，例如：  
CFLAGS="$RPM_OPT_FLAGS" CXXFLAGS="$RPM_OPT_FLAGS" ./configure --prefix=%{_prefix}  
- %build 開始構建包  
在/usr/src/asianux/BUILD/%{name}-%{version}目錄中進行make的工作 ，常見寫法：  
make %{?_smp_mflags} OPTIMIZE="%{optflags}"  
都是一些優化參數，定義在/usr/lib/rpm/marcros中  
- %install 開始把軟件安裝到虛擬的根目錄中  
在/usr/src/asianux/BUILD/%{name}-%{version}目錄中進行make install的操作。這個很重要，因為如果這裏的路徑不對的話，則下面%file中尋找文件的時候就會失敗。 常見內容有：  
- %makeinstall 這不是關鍵字，而是rpm定義的標準宏命令。也可以使用非標準寫法：  
make DESTDIR=$RPM_BUILD_ROOT install    
或    
make prefix=$RPM_BUILD_ROOT install    
需要說明的是，這裏的%install主要就是為了後面的%file服務的。所以，還可以使用常規的系統命令：  
install -d $RPM_BUILD_ROOT/    
cp -a * $RPM_BUILD_ROOT/    

- %clean 清理臨時文件    
通常內容為：    
[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf "$RPM_BUILD_ROOT"    
rm -rf $RPM_BUILD_DIR/%{name}-%{version}    

※注意區分$RPM_BUILD_ROOT和$RPM_BUILD_DIR：    
$RPM_BUILD_ROOT是指開頭定義的BuildRoot，而$RPM_BUILD_DIR通常就是指/usr/src/asianux/BUILD，其中，前面的才是%file需要的。   
%pre rpm安裝前執行的腳本  
%post rpm安裝後執行的腳本  
%preun rpm卸載前執行的腳本  
%postun rpm卸載後執行的腳本  
 
%preun %postun 的區別是什麽呢？  
前者在升級的時候會執行，後者在升級rpm包的時候不會執行  

%files 定義那些文件或目錄會放入rpm中  
這裏會在虛擬根目錄下進行，千萬不要寫絕對路徑，而應用宏或變量表示相對路徑。 如果描述為目錄，表示目錄中除%exclude外的所有文件。  
%defattr (-,root,root) 指定包裝文件的屬性，分別是(mode,owner,group)，-表示默認值，對文本文件是0644，可執行文件是0755  

%exclude 列出不想打包到rpm中的文件  
※小心，如果%exclude指定的文件不存在，也會出錯的。   
%changelog 變更日志  

※特別需要註意的是：%install部分使用的是絕對路徑，而%file部分使用則是相對路徑，雖然其描述的是同一個地方。千萬不要寫錯。  


就是%file中必須明白，用的是相對目錄 引用  
%files   
%defattr(-,root,root)   
%{_bindir}   
%{_libdir}   
%{_datadir}   
%exclude %{_libdir}/debug  

制作補丁   
詳細看參考： [原]使用diff同patch工具   
如何編寫%file段   
由於必須在%file中包括所有套件中的文件，所以，我們需要清楚編譯完的套件到底包括那些文件？  
常見的做法是，人工模擬一次編譯的過程：  
 這樣，整個套件的內容就會被放到/usr/local/xxx中，可根據情況編寫%file和%exclude段。  

※當然，這個只能對源碼按GNU方式編寫，並使用GNU autotool創建的包有效，若自定義Makefile則不能一概而論。   
關於rpm中的執行腳本   
如果正在制作的rpm包是準備作為放到系統安裝光盤中的話，則需要考慮rpm中定義的腳本是否有問題。由於系統在安裝的時候只是依賴於一個小環境進行，而該環境與實際安裝完的環境有很大的區別，所以，大部分的腳本在該安裝環境中都是無法生效，甚至會帶來麻煩的。  
所以，對於這樣的，需要放到安裝光盤中的套件，不加入執行腳本是較佳的方法。  
另外，為提供操作中可參考的信息，rpm還提供了一種信號機制：不同的操作會返回不同的信息，並放到默認變量$1中。  
0代表卸載、1代表安裝、2代表升級  
Hello[^2]