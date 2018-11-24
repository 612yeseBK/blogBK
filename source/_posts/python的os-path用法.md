---
title: python的os.path用法
categories: tools
tags:
  - python本身
date: 2018-11-21 10:01:51
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何python里面的os模块的路径获取方法的文章<!-- more -->
<The rest of contents | 余下全文>

# **\__file__**

\__file__本身是一个str，会给出当前项目文件的绝对路径

```
print(os.path.abspath(__file__))
print(__file__)
print(type(__file__))
```

输出结果：

```
E:\machinelearning\自然语言处理\项目\word2vec\法院实际文书处理\解析法院xml.py

E:/machinelearning/自然语言处理/项目/word2vec/法院实际文书处理/解析法院xml.py

<class 'str'>
```

os.path.abspath()会给出你的系统默认的文件路径方式

\__file__给出的是python内部默认的文件路径方式

上述两个说法是我猜的

# **os.path.abspath()**

**os.path.abspath("test.xml")该函数会获得当前文件夹下test.xml文件的规范化绝对路径**

以下是一些例子

```
os.path.abspath('test.csv') 

 'C:\\Python25\\test.csv'    

os.path.abspath('c:\\test.csv') 

 'c:\\test.csv'    

os.path.abspath('../csv\\test.csv') 

 'C:\\csv\\test.csv'  
```

特殊：`os.path.abspath(".")`会获取当前文件夹的路径

`os.path.abspath("__file__")`会获取项目文件的绝对路径

# **os.path.join()**

os.path.join()函数中可以传入多个路径：

- 会从第一个以”/”开头的参数开始拼接，之前的参数全部丢弃。
- 以上一种情况为先。在上一种情况确保情况下，若出现”./”开头的参数，会从”./”开头的参数的上一个参数开始拼接。

以下是一些案例

```
import os

print("1:",os.path.join('aaaa','/bbbb','ccccc.txt'))

print("2:",os.path.join('/aaaa','/bbbb','/ccccc.txt'))

print("3:",os.path.join('aaaa','./bbb','ccccc.txt'))
```

输出结果：

```
1: /bbbb\ccccc.txt
2: /ccccc.txt
3: aaaa\./bbb\ccccc.txt
```

**这里就是需要找到一个路径，所以前面的路径要放弃，之后拼接的被认为是文件名。**

# **os.path.dirname()**

os.path.dirname(filepath)会给出文件的当前文件夹的路径

**注意：传入的是文件路径**

示例：

```
print(os.path.dirname(__file__))
```

输出结果：

```
E:/machinelearning/自然语言处理/项目/word2vec/法院实际文书处理
```

# **os.listdir()**

os.listdir(dirpath)会给出dirpath文件夹下的所有文件文件名，**但不是路径名**

示例：

```
filedir = os.path.join(os.path.abspath("."), "法院文书")

lists = os.listdir(filedir)

for file in lists:
    print("====", file)
```

输出结果：

```
==== ﹙2014﹚腊民一初字第139号.xml
==== （2011）会民一初字第522号.xml
==== （2011）吉民初字第355号.xml
==== （2011）江法民初字第0622606057号.xml
==== （2011）江法民初字第06226号.xml
==== （2011）湖吴民初字第1078号.xml
==== （2011）红民初字第690号.xml
==== （2011）解民初字第1575号.xml
==== （2011）辉民初字第710-1号.xml
==== （2011）金东民初字第792号.xml
==== （2011）金民二初字第5486号.xml
==== （2011）金民初字第01366号.xml
```

# **os.path.split()**

os.path.split(filepath)会将传入的文件路径名分成两部分，文件当前文件夹的路径名以及文件名，也就是dirname和basename

示例：

```
temppath = os.path.abspath(__file__)
print(temppath)
twoele = os.path.split(temppath)
print(twoele[0])
print(twoele[1])
```

输出结果：

```
E:\machinelearning\自然语言处理\项目\word2vec\法院实际文书处理\解析法院xml.py
E:\machinelearning\自然语言处理\项目\word2vec\法院实际文书处理
解析法院xml.py
```

