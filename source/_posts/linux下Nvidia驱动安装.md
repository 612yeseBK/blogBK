---
title: linux下Nvidia驱动安装
categories: tools
tags:
  - linux
  - nvidia
date: 2018-11-21 16:04:37
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何在linux下安装Nvidia驱动的文章<!-- more -->
<The rest of contents | 余下全文>

# **查看版本驱动** 

点击查看驱动：[**NVIDIA驱动**](http://www.nvidia.com/Download/index.aspx?lang=en-us) 

![驱动选择1](/linux下Nvidia驱动安装/驱动选择1.png)

![驱动选择2](/linux下Nvidia驱动安装/驱动选择2.png)

一般会下载到downloads文件夹下

**下载完成之后：**

**卸载原先的所有驱动：**

```
sudo apt-get remove --purge nvidia* 

sudo nvidia-uninstall 
```

关闭nouveau

这个服务是开源的驱动，会和nvidia的驱动冲突，需要提前关闭

```
sudo gedit /etc/modprobe.d/blacklist.conf 
```

在最后一行添加： 

```
blacklist nouveau
```

保存退出，之后，执行命令：

```
sudo update-initramfs -u
```

电脑重启之后执行

```
lsmod | grep nouveau  #没有输出，即说明安装成功
```

然后关闭图形界面

```
sudo service lightdm stop

sudo ./NVIDIA-Linux-x86_64-410.78.run -no-x-check -no-nouveau-check -no-opengl-files
```

这里的-no-opengl-files参数一定要带上，不然进入之后会反复登录，黑屏或者屏幕显示异常，如果出现上述情况，删掉驱动重装。

# 安装过程中的密钥选项

关于密钥的那个需要着重提示一下 参考链接：[驱动安装](https://www.cnblogs.com/marky/p/8243607.html)

安装提示 “sign  the kernel module”  

安装过程中提示是否sign the kernel module（为内核模块签名），这里要选择是。接下来会继续问使用已有的密钥给模块签名还是重新生成。

这里选在重新生成密钥。继续下去之后，密钥会在/usr/share/nvidia/下生成一个nvidia\*.der（公钥）文件和nvidia*.key（私钥）文件，当提示是否删除已生成的密钥文件时，选择否，

因为之后要用到这两个文件。继续安装程序到最后会提示无法启动模块。这是因为生成的密钥还没有添加到内核的信任库中

待安装结束后，添加密钥到内核的信任列表中 

```
sudo mokutil --import /usr/share/nvidia/nvida*.der
```

接下来提示输入密码，再次输入密码，这里的密码下面要用

然后  sudo  reboot

重启进入boot loader之后，由于进行了添加密钥操作，会触发shim，这时不能直接进入 boot,选择第二个 “ reroll the mok ” 会要求输入上一步输入的密码来导入密钥。按步骤操作， 如果不小心进入boot,
再次执行 sudo mokutil ...

安装完成后，可以用

```
nvidia-smi
```

查看驱动安装情况

![驱动安装后3](/linux下Nvidia驱动安装/驱动安装后3.png)