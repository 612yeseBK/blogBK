---
title: linux与windows双系统安装
categories: tools
tags:
  - linux
date: 2018-11-21 15:30:31
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何使用安装linux与windows双系统<!-- more -->
<The rest of contents | 余下全文>



参考链接： [双系统安装](https://www.bilibili.com/video/av22847796/?p=5)

# 保留硬盘分区用以安装linux

右键我的电脑，选择“管理”

![分区开辟1](/linux与windows双系统安装/分区开辟1.png)

然后进入之后点击磁盘管理，在里面选择一部分空间作为空白卷，用来安装linux系统

![分区开辟2](/linux与windows双系统安装/分区开辟2.png)

我的是一个已经安装好的150g的分区，正常删除的情况下显示的是未分配

这个150G分区就是我的linux系统安装的地方

# 制作启动盘

去linux官网下载合适版本的linux系统，我下载的是16.04版本的系统

链接：https://pan.baidu.com/s/1fcbjT93pGFRNOp7WFy004A 
提取码：bmnb 
然后我们需要一个空U盘作为启动盘，注意保存好u盘里面的资料

使用软件usbwriter进行制作

链接：https://pan.baidu.com/s/1dLlruwtTYSnzFQn9F9I8Xg 
提取码：7hyk 
![启动盘制作3](/linux与windows双系统安装/启动盘制作3.png)

第一个选项框选择ubuntu的镜像文件

第二个选择你要用作启动盘的u盘

点击write，等待几分钟可制作完成

# 进入bios安装系统

插入制作好的启动盘，重启电脑，并进入bios界面，我的是hp电脑，hp电脑进入的具体做法是，一直按f10，然后找到启动顺序，将usb/u盘启动放到操作系统管理员前面，然后按f10保存退出，然后正常启动，就可以进入安装界面

注意：如果你是双显卡的设备，在选择的时候需要先点击e键，进入编辑界面

参考链接 ： [安装卡死解决](https://blog.csdn.net/mmz_xiaokong/article/details/79416156)

![防止卡死5](/linux与windows双系统安装/防止卡死5.jpg)

![防止卡死4](/linux与windows双系统安装/防止卡死4.jpg)

在quiet splash 后面加（先打空格）nomodeset，然后按F10保存启动即可！！！  

由于那个是临时改动，所以还需要一步，安装好，进入之后打开终端：

```
sudo vi /etc/default/grub 或 sudo gedit /etc/default/grub
# 编辑打开的文件，找到GRUB_CMDLINE_LINUX_DEFAULT那一行，在后面加上(在quiet splash后打一个空格) nomodeset（保险起见，nomodeset后面加多一个空格），保存，

#然后在终端输入 
sudo update-grub 

#之后重启即可
reboot
```

  

# 安装时的几个选项

语言选择中文

![安装选项8](/linux与windows双系统安装/安装选项8.jpg)

安装类型选择其他选项

![安装选项6](/linux与windows双系统安装/安装选项6.jpg)

下面要选择我们之前切割出来的分区，分区状态时空闲，不要选择你使用过的分区，挂载点选择   /

![安装选项7](/linux与windows双系统安装/安装选项7.jpg)

点击继续

![安装选项9](/linux与windows双系统安装/安装选项9.jpg)

设置好用户名和密码

![安装选项10](/linux与windows双系统安装/安装选项10.jpg)

等待安装完成即可