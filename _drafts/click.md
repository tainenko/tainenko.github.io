使用 click 构造漂亮的Python命令行程序 
Posted on 03/27/2018 by Ein Verne | View revision history
Click 是 Python 下一款命令行库，可以用来快速轻松实现Python命令行程序。之前也介绍过一个 argparse ，但是要比 click 复杂很多，至少从代码上看。但是 click 其实也说了1 argparse 在标准库中，click 是依赖于 optparse 的，至于不基于 argparse 是因为 argparse 不支持嵌套，并且在 POSIX 兼容上有问题。

Click 被设计用来快速构建命令行程序，因此缺乏一些扩展性，比如他不允许高度定制help介绍。Click 是用来支持 Flask 开发框架的。

官网地址: http://click.pocoo.org

基本使用
# hello.py
import click
@click.command()
@click.option('--count', default=1, help='Number of greetings.')
@click.option('--name', prompt='Your name',
              help='The person to greet.')
def hello(count, name):
    """Simple program that greets NAME for a total of COUNT times."""
    for x in range(count):
        click.echo('Hello %s!' % name)

if __name__ == '__main__':
    hello()
然后可以这样运行该脚本 python hello.py --count=3，并且 Click 还会自动生成 help 信息。

Option 参数
Click 使用基本可以归纳为

使用 @click.command() 装饰一个函数，使之成为命令行接口；
使用 @click.option() 等装饰函数，为其添加命令行选项等。
最基础的用法， option 接受一个变量

@click.command()
@click.option('--n', default=1)
def hello(n):
    click.echo('hello' * n)
使用 --n=2 输出两遍

接受多个变量，需要使用 nargs 指定数量

@click.command()
@click.option('--pos', nargs=2, type=float)
def cal(pos):
    click.echo('%s / %s' % pos)
使用 --pos 5.0 4.0

如果参数是固定的几个值，可以使用可选项

@click.command()
@click.option('--hash-type', type=click.Choice(['md5', 'sha1']))
def digest(hash_type):
    click.echo(hash_type)
使用 --hash-type=md5 参数只能为 md5 或者 sha1，否则报错。

option 还有其他一些参数，比如 prompt 当用户忘记该参数时，将错误报出来，hide_input 可以隐藏输入，常用于密码输入，confirmation_prompt 验证输入等等。

Click 封装了

@click.password_option()
@click.confirmation_option(prompt='Are you sure you want to drop the db?')
argument 参数
和 Option 一样，Argument 最基础的应用就是传递一个简单变量值

@click.command()
@click.argument('input', type=click.File('rb'))
@click.argument('output', type=click.File('wb'))
def inout(input, output):
    while True:
        chunk = input.read(1024)
        if not chunk:
            break
        output.write(chunk)
reference
http://click.pocoo.org/5/options/
http://click.pocoo.org/5/arguments/
http://click.pocoo.org/6/why/ ↩


写 Python 的经常要写一些命令行工具，虽然标准库提供有命令行解析工具 Argparse，但是写起来非常麻烦，我很少会使用它。命令行工具中用起来最爽的就是 Click，它是 Flask 的团队 pallets 的开源项目。Click 只要很少的代码就可以优雅地创造一个命令行工具，它致力于将创建命令行工具的过程变的快速而有趣。

百闻不如一试

安装
pip install Click
使用
创建 click_demo.py ，写一个最简单的函数

import click

@click.command()
def hello():
    click.echo('Hello World!')

if __name__ == '__main__':
    hello()
运行：

python click_demo.py
Hello World!
装饰器 click.command() 使函数秒变命令行工具，echo 函数的作用等同于 print 函数。

参数
装饰器 click.option()可以给命令行函数指定参数

import click

@click.command()
@click.option("--count", default=1, help="打印次数", type=int)
def hello(count):
    """
    这是一个简单示例
    """
    for i in range(count):
        click.echo('Hello World!')

if __name__ == '__main__':
    hello()
--count：count是参数的名字
default ： 参数的默认值
type：给参数指定类型
help： 说明文档
执行脚本的时候后面加上参数 --help 就可以查看说明文档。

$ python click_demo.py --help

Usage: click_demo.py [OPTIONS]

  这是一个简单示例

Options:
  --count INTEGER  打印次数
  --help        Show this message and exit.
指定参数：

>python click_demo.py --count 3

Hello World!
Hello World!
Hello World!
prompt
有些命令行工具在运行的时候要求用户输入信息，可以给 option 装饰器指定 prompt 参数

import click

@click.command()
@click.option("--count", default=1, help="打印次数", type=int)
@click.option("--name", prompt="请输入名字", help="姓名")
def hello(count, name):
    """
    这是一个简单示例
    """
    for i in range(count):
        click.echo(f'Hello {name}!')

if __name__ == '__main__':
    hello()
$ python click_demo.py

请输入名字: lzjun
Hello lzjun!
Group
Click 很重要的一个特性就是它的分组功能，当一个命令行工具的逻辑已经非常复杂的时候，为了解耦，我们需要将不同的逻辑放在不同的命令中，这样既可以避免单个命令行工具函数臃肿。来看个例子：

# db.py
import click

@click.group()
def db():
    pass

@click.command()
@click.option("--name", help="用户名")
def add(name):
    """
    添加用户
    :param name:
    :return:
    """
    click.echo(f'add user {name}')

@click.command()
@click.option("--id", help="用户名")
def delete(id):
    """
    删除用户
    :param id:
    :return:
    """
    click.echo(f'delete user {id}')

db.add_command(delete)
db.add_command(add)

if __name__ == '__main__':
    db()

 
这是一个操作数据库DB的命令行工具，提供了添加用户和删除用户的命令行等其它操作，如果所有的业务逻辑全部写在一个函数，维护变得异常困难。

@click.group 装饰器把函数装饰成为一个Group对象，通过 Group 可以添加很多子命令。

python db.py  --help
Usage: db.py [OPTIONS] COMMAND [ARGS]...

Options:
  --help  Show this message and exit.

Commands:
  add     添加用户 :param name: :return:
  delete  删除用户 :param id: :return:

 
从帮助文档中我们看到 add 和 delete 就是两个子命令。 Flask 框架的 flask 命令也是一个 Group 命令。

$ flask
Usage: flask [OPTIONS] COMMAND [ARGS]...

  A general utility script for Flask applications.

  Provides commands from Flask, extensions, and the application. Loads the
  application defined in the FLASK_APP environment variable, or from a
  wsgi.py file. Setting the FLASK_ENV environment variable to 'development'
  will enable debug mode.

    $ export FLASK_APP=hello.py
    $ export FLASK_ENV=development
    $ flask run

Options:
  --version  Show the flask version
  --help     Show this message and exit.

Commands:
  add_user           添加账号 :param name: :param username: :param password:...
  init_invite_code   添加邀请码
  recommend_account  更新推荐账号
  routes             Show the routes for the app.
  run                Runs a development server.
  shell              Runs a shell in the app context.
提供了几个预定义的子命令和自定义的命令。