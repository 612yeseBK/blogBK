---
title: linux环境配置之sublime插件安装
categories: itools
tags:
  - linux
  - sublime
date: 2018-11-22 17:34:59
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍在ubuntu系统里面安装sublime插件的文章<!-- more -->
<The rest of contents | 余下全文>

# **安装sublime text3**

目前最简单的方法是通过ppa安装，打开终端，输入以下命令：

sudo add-apt-repository ppa:webupd8team/sublime-text-3

sudo apt-get update

sudo apt-get install sublime-text-installer

# **卸载 sublime**

sudo apt-get remove sublime-text-installer

# **启动sublime**

命令行输入：subl(不是1是L) 

可以启动sublime

# **激活sublime**

装完了以后可以激活它，在Help里输入license key

—– BEGIN LICENSE —–

Michael Barnes

Single User License

EA7E-821385

8A353C41 872A0D5C DF9B2950 AFF6F667

C458EA6D 8EA3C286 98D1D650 131A97AB

AA919AEC EF20E143 B361B1E7 4C8B7F04

B085E65E 2F5F5360 8489D422 FB8FC1AA

93F6323C FD7F7544 3F39C318 D95E6480

FCCC7561 8A4A1741 68FA4223 ADCEDE07

200C25BE DBBC4855 C4CFB774 C5EC138C

0FEC1CEF D9DCECEC D3A5DAD1 01316C36

—— END LICENSE ——

Key来自 <https://fatesinger.com/77763>

# **安装package control**

为了使用众多的 [插件](https://sublime.wbond.net/) 来扩展 Sublime 的功能，你需要安装一个叫做 **Package Control** 的插件管理器——这个东西你必须要手动安装。但是一旦你安装好了以后，你就可以使用 Package Control 来安装，移除或者升级所有的 ST3 插件了 

![sublime控制台](/linux环境配置之sublime插件安装/sublime控制台.png)

打开sublime的控制台，输入安装的命令

https://packagecontrol.io/installation

安装命令可以从上述链接里获得。

# **使用package control安装插件**

在preference>>package control里打开插件窗口，输入或找到 install package这一个选项，选中然后就可以选择需要的插件安装。

![pxinsatll](/linux环境配置之sublime插件安装/pxinsatll.png)

# **安装anaconda插件**

选中install package

输入anaconda，选择对应的安装

**注意：**如果出现安装失败，Package Control:Unableto download Emmet.Please view the console for more details 

我的问题解决是：

将downloader_precedence 参数改成

```
{
    "windows": ["wininet"],
    "osx": ["urllib"],
    "linux": ["curl", "wget", "urllib"]
}
```

也就是将"curl", "wget"往前移，我也不知道为什么，反正解决了

