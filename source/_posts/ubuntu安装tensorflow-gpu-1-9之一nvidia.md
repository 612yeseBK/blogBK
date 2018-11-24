---
title: ubuntu安装tensorflow_gpu-1.9之一nvidia
categories: tensorflow安装
tags:
  - nvidia
date: 2018-11-23 09:19:39
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何在ubuntu上安装nvidia驱动的文章<!-- more -->
<The rest of contents | 余下全文>

上一篇文章说过了如何使用.run文件去安装nvidia驱动，但是我最后不知道是版本还是别的原因，tensorflow失败了，重装系统之后我选了使用apt-get的方式，这里记录一下。

# **禁用ubuntu自带的驱动**

打开下列配置文件

```
sudo gedit /etc/modprobe.d/blacklist-nouveau.conf 
```

添加如下内容并保存

```
blacklist nouveau               

options nouveau modeset=0 
```

输入下列命令

```
sudo update-initramfs -u 
```

重启系统，输入下列命令去确认nouveau已经被关闭

```
lsmod | grep nouveau 
```

如果终端里面没有任何别的输出，则已经确认关闭。



# **更新pip源**

依次输入以下命令

```
# 添加pip源
sudo add-apt-repository ppa:graphics-drivers/ppa 
# 使添加生效
sudo apt-get update 
```

# **选择适合的驱动**

以下命令查看所有能下载的驱动

```
sudo apt-cache search nvidia 
```

下列命令查看系统推荐的驱动

```
ubuntu-drivers devices 
```

找到里面recommend的那一个，记住序列比如我的是415

输入如下命令安装

```
sudo apt-get install nvidia-415 nvidia-settings nvidia-prime
```

 

注意：有点安装里面说明需要初入

```
sudo service lightdm stop
```

关闭lightdm服务，退出图形界面，

我这里没有退出也行，不过在安装的最后跳出设立密码，然后重启时输入密码生效，重启时，不要选continue to boot ，选择change secure state，然后输入密码生效

输入以下命令测试nvidia是否安装成功

```
nvidia-smi 
```

如果成功，会显示显卡的一些信息

# **循环登录的问题**

如果安装之后出现了循环登录的问题

我的具体做法是

在系统选择界面按e，将安装系统时临时添加的nomodeset去掉，并重新使他生效

进入后，将这个改变保存下来

```
sudo gedit /etc/default/grub
```

将splash后面的modeset删掉，保存退出

再使之生效即可

```
sudo update-grub
```

