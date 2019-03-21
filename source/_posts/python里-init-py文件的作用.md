---
title: python里__init__.py文件的作用
categories: 未分类
tags:
  - 未分类
date: 2019-03-21 15:40:46
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍python模块下的\__init__.py的作用<!-- more -->
<The rest of contents | 余下全文>

# \__init__.py文件的意义

在python模块的每一个包中，都有一个__init__.py文件（这个文件定义了包的属性和方法）然后是一些模块文件和子目录，假如子目录中也有 __init__.py 那么它就是这个包的子包了。当你将一个包作为模块导入（比如从 xml 导入 dom ）的时候，实际上导入了它的\__init__.py 文件。

一个包是一个带有特殊文件\_\_init\_\_.py 的目录。\__init\_\_.py 文件定义了包的属性和方法。其实它可以什么也不定义；可以只是一个空文件，但是必须存在。如果 \_\_init\_\_.py 不存在，这个目录就仅仅是一个目录，而不是一个包，它就不能被导入或者包含其它的模块和嵌套包。

# \__init__.py里的内容

```
from .ws_classfication import Classfication_ws

__all__ = ['Classfication_ws']
```

第一行指的是从ws_classfication.py文件里面引入了Classfication_ws这个类

第二行\__all__方法是指将这个如果我们以后导入模块的时候，会引入东西

如果该文件里面什么都没有的话，那么我们引入该模块就不会有任何额外的操作

注意：这里使用.ws_classfication

# 使用模块引入

```
import graduation_project as gdp

classfication = gdp.Classfication_ws()
```

