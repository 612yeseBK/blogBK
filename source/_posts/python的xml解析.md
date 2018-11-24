---
title: python的xml解析
categories: tools
tags:
  - xml解析
date: 2018-11-20 21:30:32
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何使用python里面的dom去解析xml<!-- more -->
<The rest of contents | 余下全文>

```
import xml.dom.minidom as xmldom
import os

"""
Created by gaoyw on 2018/11/20
"""
'''
XML文件读取
<?xml version="1.0" encoding="utf-8"?>
<catalog>
    <maxid>4</maxid>
    <login username="pytest" passwd='123456'>dasdas
        <caption>Python</caption>
        <item id="4">
            <caption>测试</caption>
        </item>
    </login>
    <item id="2">
        <caption>Zope</caption>
    </item>
</catalog>

'''

xmlfilepath = os.path.abspath("test.xml") 
# 上述xml文件命名为test.xml放入执行文件的同一目录下
print ("xml文件路径：", xmlfilepath)

# 得到文档对象
domobj = xmldom.parse(xmlfilepath)
print("xmldom.parse获得的对象是:", type(domobj))
# 得到元素对象
elementobj = domobj.documentElement
print ("domobj.documentElement获得的对象是:", type(elementobj))

#获得子标签
subElementObj = elementobj.getElementsByTagName("login")
print ("getElementsByTagName获得的对象是:", type(subElementObj))

print ("login标签的数目是：",len(subElementObj))
# 获得标签属性值
print ("login标签中第一个标签的username的属性值是："+subElementObj[0].getAttribute("username"))
print ("login标签中第一个标签的passwd的属性值是："+subElementObj[0].getAttribute("passwd"))

#区分相同标签名的标签
subElementObj1 = elementobj.getElementsByTagName("caption")
print("caption标签共有%s个" % len(subElementObj1))
for i in range(len(subElementObj1)):
    print ("subElementObj1[i]:", type(subElementObj1[i]))
    print (subElementObj1[i].firstChild.data)  #显示标签对之间的数据
```

**上述的输出结果是：**

```
xml文件路径： E:\machinelearning\自然语言处理\项目\word2vec\xml解析\test.xml
xmldom.parse获得的对象是: <class 'xml.dom.minidom.Document'>
domobj.documentElement获得的对象是: <class 'xml.dom.minidom.Element'>
getElementsByTagName获得的对象是: <class 'xml.dom.minicompat.NodeList'>
login标签的数目是： 1
login标签中第一个标签的username的属性值是：pytest
login标签中第一个标签的passwd的属性值是：123456
caption标签共有3个
subElementObj1[i]: <class 'xml.dom.minidom.Element'>
Python
subElementObj1[i]: <class 'xml.dom.minidom.Element'>
测试
subElementObj1[i]: <class 'xml.dom.minidom.Element'>
Zope
```

