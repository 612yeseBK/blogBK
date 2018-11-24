---
title: ubuntu安装tensorflow_gpu-1.9之三cudnn7.3
categories: tensorflow安装
tags:
  - cudnn
date: 2018-11-23 09:21:43
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何在ubuntu系统里面安装cudnn的文章<!-- more -->
<The rest of contents | 余下全文>

# **下载cudnn**

首先到官网下载[cuDNN5.1](https://developer.nvidia.com/cudnn) （ https://developer.nvidia.com/cudnn ），需要注册为开发者才能下载，而且直接下载可能速度非常慢，如果有别人已经下载过的，应该是可以直接拿过来用

我的是7.3的，有需要可以直接用

链接：https://pan.baidu.com/s/1EdlVmSal4vE8L_EwrJUxZg 
提取码：bqqi 

# **解压配置**

下载完成之后解压：

```
tar xvzf cudnn-8.0-linux-x64-v5.1.tgz 
```

移动文件到cuda文件夹里

```
sudo cp cuda/include/cudnn.h /usr/local/cuda/include

sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
```

修改文件访问权限

```
sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn* 
```

这里不做测试