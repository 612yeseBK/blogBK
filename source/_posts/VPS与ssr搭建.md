---
title: VPS与ssr搭建
categories: tools
tags:
  - vps
  - ssr
date: 2018-11-20 18:45:19
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：[转载]这是一篇介绍如何利用远程虚拟主机去搭建ssr获得访问外网的能力<!-- more -->
<The rest of contents | 余下全文>

# 本文的来源

[用VPS搭建SSR服务器教程](https://www.baishitou.cn/1524.html)

点击上面链接可以查看原文

# **第一步：购买VPS服务器** 

VPS服务器需要选择国外的，首选国际知名的vultr，速度不错、稳定且性价比高，按小时计费，能够随时开通和删除服务器，新服务器即是新ip 

注册并邮件激活账号，充值后即可购买服务器。充值方式是paypal（首选）或支付宝 

建议选择最便宜的ipv4的服务器，我选了3.5$/month的那类，每月有500G流量。

**vultr实际上是折算成小时来计费的，比如服务器是5美元1个月，那么每小时收费为5/30/24=0.0069美元 会自动从账号中扣费，只要保证账号有钱即可。如果你部署的服务器实测后速度不理想，你可以把它删掉（destroy），重新换个地区的服务器来部署，方便且实用。因为新的服务器就是新的ip，所以当ip被封时这个方法很有用。当ip被封时，为了保证新开的服务器ip和原先的ip不一样，先开新服务器，开好后再删除旧服务器即可。** 

服务器搭建：

![pac教程01](/VPS与ssr搭建/pac教程01.png)

![pac教程02](/VPS与ssr搭建/pac教程02.png)

![pac教程04](/VPS与ssr搭建/pac教程04.png)

**选择vps操作系统时，不要选centos7系统！点击图中的CentOS几个字，会弹出centos6，然后选中centos6！entos7默认的防火墙可能会干扰ssr的正常连接！**

**完成购买后，找到系统的密码记下来，部署服务器时需要用到。vps系统（推荐centos6）的密码获取方法如下图** 

![pac教程05](/VPS与ssr搭建/pac教程05.png)

![pac教程06](/VPS与ssr搭建/pac教程06.png)

**删掉服务器步骤如下图**： 

![de2](/VPS与ssr搭建/de2.PNG)

![de5](/VPS与ssr搭建/de5.png)

# **第二步：部署VPS服务器** 

购买服务器后，需要部署一下。因为你买的是虚拟东西，而且又远在国外，我们需要一个叫Xshell的软件来远程部署。建议下载一个免费版本的xshell就行了

链接：https://pan.baidu.com/s/1Q2qq6xQH9pEnPJjXMPLwlA 
提取码：3vb1 

如果你是苹果电脑操作系统，更简单，无需下载xshell，系统可以直接连接VPS。打开**终端**（Terminal），输入ssh root@ip 其中“ip”替换成你VPS的ip, 按回车键，然后复制粘贴密码，按回车键即可登录。粘贴密码时有可能不显示密码，但不影响， [参考设置方法](http://www.cnblogs.com/ghj1976/archive/2013/04/19/3030159.html) 如果不能用MAC自带的终端连接的话，直接网上搜“MAC连接SSH的软件”，有很多，然后通过软件来连接vps服务器就行，具体操作方式参考windows xshell。 

**部署教程：** 

下载xshell软件并安装后，打开软件 

![xshell11](/VPS与ssr搭建/xshell11.png)

选择文件，新建 

![xshell12](/VPS与ssr搭建/xshell12.png)

随便取个名字，然后把你的服务器ip填上 

![xshell13](/VPS与ssr搭建/xshell13.png)

连接国外ip即服务器时，软件会先后提醒你输入用户名和密码，用户名默认都是root，密码是你购买的服务器系统的密码。

**如果xshell连不上服务器，没有弹出让你输入用户名和密码的输入框，表明你开到的ip是一个被封的ip，遇到这种情况，重新开新的服务器，直到能用xshell连上为止，耐心点哦！如果同一个地区开了多台服务器还是不行的话，可以换其它地区。**



![xshell14](/VPS与ssr搭建/xshell14.png)

![xshell2](/VPS与ssr搭建/xshell2.png)

连接成功后，会出现如上图所示，之后就可以复制粘贴代码部署了。 

将以下代码依次粘贴到shell打开的远程链接窗口里面

```
yum -y install wget
```



```
wget -N –no-check-certificate https://raw.githubusercontent.com/ToyoDAdoubi/doubi/master/ssr.sh && chmod +x ssr.sh && bash ssr.sh
```

复制上面的代码到VPS服务器里，按回车键，脚本会自动安装，以后只需要运行这个快捷命令就可以出现下图的界面进行设置，快捷管理命令为：

```
bash ssr.sh
```

![8](/VPS与ssr搭建/8.png)

如上图出现管理界面后，**输入数字1来安装SSR服务端**。如果输入1后不能进入下一步，那么请退出xshell，重新连接vps服务器，然后输入快捷管理命令bash ssr.sh 再尝试。 

![31](/VPS与ssr搭建/31.png)

根据上图提示，依次输入自己想设置的**端口和密码** (**密码建议用复杂点的字母组合，端口号为40-65535之间的数字**)，回车键用于确认

注：关于端口的设置，总的网络总端口有6万多个，理论上可以任意设置。但是有的地区需要设置特殊的端口才有效，一些特殊的端口比如80、143、443、1433、3306、3389、8080。

![32](/VPS与ssr搭建/32.png)

如上图，选择想设置的**加密方式**，比如10，按回车键确认

接下来是选择**协议插件**，如下图：

![11](/VPS与ssr搭建/11.png)

![41](/VPS与ssr搭建/41.PNG)

选择并确认后，会出现上图的界面，提示你是否选择兼容原版，这里的原版指的是SS客户端（SS客户端没有协议和混淆的选项），可以根据需求进行选择，演示选择y

之后进行混淆插件的设置。

**注意：如果协议是origin，那么混淆也必须是plain；如果协议不是origin，那么混淆可以是任意的。有的地区需要把混淆设置成plain才好用。因为混淆不总是有效果，要看各地区的策略，有时候不混淆（plain）让其看起来像随机数据更好。（特别注意：tls 1.2_ticket_auth容易受到干扰！请选择除tls开头以外的其它混淆！！！）**

![33](/VPS与ssr搭建/33.png)

进行混淆插件的设置后，会依次提示你对设备数、单线程限速和端口总限速进行设置，默认值是不进行限制，个人使用的话，选择默认即可，即直接敲回车键。

注意：关于限制设备数，这个协议必须是非原版且不兼容原版才有效，也就是必须使用SSR协议的情况下，才有效！

![14](/VPS与ssr搭建/14.png)

之后代码就正式自动部署了，到下图所示的位置，提示你下载文件，输入：y 

![15](/VPS与ssr搭建/15.png)

耐心等待一会，出现下面的界面即部署完成： 

![16](/VPS与ssr搭建/16.png)

![34](/VPS与ssr搭建/34.png)

根据上图就可以看到自己设置的SSR账号信息，包括IP、端口、密码、加密方式、协议插件、混淆插件，这些信息需要填入你的SSR客户端。如果之后想修改账号信息，直接输入快捷管理命令：bash ssr.sh 进入管理界面，选择相应的数字来进行一键修改。例如： 

![22](/VPS与ssr搭建/22.png)

![23](/VPS与ssr搭建/23.png)

**脚本演示结束。**

此脚本是开机自动启动，部署一次即可。最后可以重启服务器确保部署生效（一般情况不重启也可以）。重启需要在命令栏里输入reboot ，输入命令后稍微等待一会服务器就会自动重启，一般重启过程需要2～5分钟，重启过程中Xshell会自动断开连接，等VPS重启好后才可以用Xshell软件进行连接。如果部署过程中卡在某个位置超过10分钟，可以用xshell软件断开，然后重新连接你的ip，再复制代码进行部署

# **第三步：一键加速VPS服务器** 

此加速教程为谷歌BBR加速,Vultr的服务器框架可以装BBR加速，加速后对速度的提升很明显，所以推荐部署加速脚本。该加速方法是开机自动启动，部署一次就可以了。

按照第二步的步骤，连接服务器ip，登录成功后，在命令栏里粘贴以下代码：

【谷歌BBR加速教程】

```
yum -y install wget
```

```
wget –no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh chmod +x bbr.sh
```

```
./bbr.sh
```

把上面整个代码复制后粘贴进去，不动的时候按回车，然后耐心等待，最后重启vps服务器即可。

演示开始，如图：

复制并粘贴代码后，按回车键确认

![18](/VPS与ssr搭建/18.png)

![20](/VPS与ssr搭建/20.png)

部署到上图这个位置的时候，等待3～6分钟 

![21](/VPS与ssr搭建/21.png)

最后输入y重启服务器，如果输入y提示command not found ，接着输入reboot来重启服务器，确保加速生效，bbr加速脚本是开机自动启动，装一次就可以了。 

购买vps服务器后，ip有了，通过部署，端口、密码、加密方式、协议和混淆也有了，最后将这些信息填入SSR客户端就可以访问外网啦。

**有了账号后，打开SSR客户端，填上信息，这里以windows版的SSR客户端为例子**：

![42](/VPS与ssr搭建/42.PNG)

在对应的位置，填上服务器ip、服务器端口、密码、加密方式、协议和混淆，最后将浏览器的代理设置为（http）127.0.0.1和1080即可。账号的端口号就是你自己设置的，而要上网的浏览器的端口号是1080，固定的，谷歌浏览器可以通过 SwitchyOmega 插件来设置。

启动SSR客户端后，右键SSR客户端图标，选择第一个“系统代理模式”，里面有3个子选项，选择”全局模式“，之后就可以用浏览器设置好了的代理模式（http）127.0.0.1和1080翻墙，此模式下所有的网站都会走SSR代理。（适合新手）

![32225069-cfe6195a-be7e-11e7-99e0-e2fa98f93b1f](/VPS与ssr搭建/32225069-cfe6195a-be7e-11e7-99e0-e2fa98f93b1f.png)

以下是shadowSocketR的windows客户端下载链接：

链接：https://pan.baidu.com/s/1knC8BS7tRseMG1z3Xjx6hQ 
提取码：o95d 
