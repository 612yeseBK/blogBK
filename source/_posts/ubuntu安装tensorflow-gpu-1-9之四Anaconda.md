---
title: ubuntu安装tensorflow_gpu-1.9之四Anaconda
categories: tensorflow安装
tags:
  - anaconda
date: 2018-11-23 09:22:08
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何在ubuntu系统上安装anaconda的说明<!-- more -->
<The rest of contents | 余下全文>

# **下载anaconda**

网址：https://www.anaconda.com/download/#linux

我的百度网盘也有一份

链接：https://pan.baidu.com/s/1QGlqvmIYl-EhoIoCKSjwRw 
提取码：xvgj 

# **安装anaconda**

```
bash Anaconda3-4.3.1-Linux-x86.sh
```

在安装的过程中，会问你安装路径，直接回车默认就可以了。有个地方问你是否将anaconda安装路径加入到环境变量（.bashrc)中，输入yes，默认的是no 

如果没输入就要配置环境，根据提示，在终端输入

```
sudo gedit /etc/profile
```

打开profile文件。添加语句

```
export PATH=/home/{你的用户名}/anaconda3/bin:$PATH
```

保存，退出。 

重启才可以生效

# **创建子环境**

创建名为tfgpu，python版本3.5的子环境

```
conda create -n tfgpu pytohn==3.5
```

进入子环境

```
conda activate tfgpu
```

