---
title: ubuntu安装tensorflow_gpu-1.9之二cuda9.0
categories: tensorflow安装
tags:
  - cuda
date: 2018-11-23 09:21:12
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何在ubuntu系统上安装cuda9.0的文章<!-- more -->
<The rest of contents | 余下全文>

承接上文之一

首先下载cuda9.0，这里是官网连接 https://developer.nvidia.com/cuda-downloads

我的是9.0，给个网盘链接这儿

链接：https://pan.baidu.com/s/1z9jHGM0-6HQauRHRwniZpw 
提取码：luvf 

# **安装CUDA**

下载完之后就是安装cuda 以下命令执行(需要在cuda下载目录下)

```
sudo sh cuda_8.0.61_375.26_linux.run 
```

就进入安装了，开始的一大堆文字都是End User License Agreement，可以CTRL +C 跳过，然后输入accept表示接受协议

接下来就是安装的交互界面，根据提示一步一步进行就好。

在开始的

Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 367.48?

选择n，因为已经安装驱动了。

最终提示Incomplete installation!不是代表失败了，而是还有一些变量要添加

```
Using more to view the EULA.

End User License Agreement

--------------------------

Preface

-------

The following contains specific license terms and conditions

for four separate NVIDIA products. By accepting this

agreement, you agree to comply with all the terms and

conditions applicable to the specific product(s) included

herein.


NVIDIA CUDA Toolkit


Description

 

The NVIDIA CUDA Toolkit provides command-line and graphical

tools for building, debugging and optimizing the performance

of applications accelerated by NVIDIA GPUs, runtime and math

libraries, and documentation including programming guides,

user manuals, and API references. The NVIDIA CUDA Toolkit

License Agreement is available in Chapter 1.

 

Default Install Location of CUDA Toolkit

 

Windows platform:

 

Do you accept the previously read EULA?

accept/decline/quit: accept

 

Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 367.48?

(y)es/(n)o/(q)uit: n

 

Install the CUDA 8.0 Toolkit?

(y)es/(n)o/(q)uit: y

 

Enter Toolkit Location

 [ default is /usr/local/cuda-8.0 ]: 

 

Do you want to install a symbolic link at /usr/local/cuda?

(y)es/(n)o/(q)uit: y

 

Install the CUDA 8.0 Samples?

(y)es/(n)o/(q)uit: y



Enter CUDA Samples Location

 [ default is /home/kinny ]:

Installing the CUDA Toolkit in /usr/local/cuda-8.0 ...

Missing recommended library: libXmu.so

Installing the CUDA Samples in /home/kinny ...

Copying samples to /home/kinny/NVIDIA_CUDA-8.0_Samples now...

Finished copying samples.

===========

= Summary =

===========

Driver:   Not Selected

Toolkit:  Installed in /usr/local/cuda-8.0

Samples:  Installed in /home/kinny, but missing recommended libraries

Please make sure that

 -   PATH includes /usr/local/cuda-8.0/bin

 -   LD_LIBRARY_PATH includes /usr/local/cuda-8.0/lib64, or, add /usr/local/cuda-8.0/lib64 to /etc/ld.so.conf and run ldconfig as root

To uninstall the CUDA Toolkit, run the uninstall script in /usr/local/cuda-8.0/bin

Please see CUDA_Installation_Guide_Linux.pdf in /usr/local/cuda-8.0/doc/pdf for detailed information on setting up CUDA.

***WARNING: Incomplete installation! This installation did not install the CUDA Driver. A driver of version at least 361.00 is required for CUDA 8.0 functionality to work.

To install the driver using this installer, run the following command, replacing <CudaInstaller> with the name of this run file:

    sudo <CudaInstaller>.run -silent -driver

Logfile is /tmp/cuda_install_17494.log
```

# **配置变量**

进入.bashrc文件

```
sudo gedit ~/.bashrc
```

添加下面的变量进去

注意：变量里面cuda-xx按照实际安装的版本填

```
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}

export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

export CUDA_HOME=/usr/local/cuda
```

然后使之生效

```
source ~/.bashrc
```

输入下列命令查看结果

```
nvcc -V
```

