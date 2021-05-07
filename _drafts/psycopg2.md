---
layout: post
title:  "MacOS安裝psycopg2"
author: tony
categories: [python]
image: assets/images/progresql.png
tags: [python,macos,psycopg2,progresql]
---
mac 安装及使用psycopg2小结
2016.06.02 20:58:56
字数 317
阅读 2445
学习了下python调用PostgreSQL数据库，PostgreSQL介绍网址如下
https://www.postgresql.org/docs/9.4/static/app-psql.html
psycopg2库下载地址如下：
https://pypi.python.org/pypi/psycopg2
下载解压后terminal cd到解压目录下输入

sudo python setup.py install
后会报错 Error: pg_config executable not found

参考http://blog.csdn.net/muzilanlan/article/details/50421693解决方法

安装postgresql， 输入
brew install postgresql 
mac系统下默认下载路径是 /usr/local/Cellar/postgresql/9.X.X/bin
其中9.X.X根据下载的版本不一样 可以利用下图中Finder中的前往文件夹功能找到postgresql文件目录，确认下本机中的上述目录


1.png
修改.bash_profile
.bash_profile 如果存在 则目录可以在terminal中输入cd~到主目录 输入pwd查询到具体地址利用上述前往文件夹的方法找到，利用vim或者sublime打开
添加

PATH="/usr/local/Cellar/postgresql/9.X.X/bin:${PATH}"
export PATH
保存，若没有该文件，可以建立一个加入上述代码

回到安装目录输入
sudo python setup.py install
可以成功安装

psycopg2使用语法比较简单，需要注意连接数据库

DB = psycopg2.connect("dbname=forum")
参数需要输入dbname =

sql的关键字需要大写，例如

c = DB.cursor()
c.execute("SELECT a,b FROM xxx ORDER BY a DESC;")
cursor.execute("select name, weight from players,(select avg(weight) as av from players) as subq where weight < av;")

MacOS安裝psycopg2出現error
解法1 安裝prestgresql
brew install postgresql
which -a pg_config
# 路徑自行代換成pg_config的路徑
export PATH=/path/to/postgresql/bin/:$PATH
brew unlink postgresql && brew link postgresql
解法2 you could also try to link against brew’s openssl:
xcode-select --install
env LDFLAGS="-I/usr/local/opt/openssl/include -L/usr/local/opt/openssl/lib"
解法3 安裝另一個library: psycopg2-binary
pip install psycopg2-binary
親測解法2有效，因為不想更動Pipfile的dependency，所以不採用解法3