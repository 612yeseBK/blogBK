---
title: ubuntu安装tensorflow_gpu-1.9之五tensorflowGPU
categories: tensorflow安装
tags:
  - tensorflowgpu
date: 2018-11-23 09:22:39
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何在ubuntu系统里面安装tensorflow-gpu-1.9的文章<!-- more -->
<The rest of contents | 余下全文>

参考：https://blog.csdn.net/davidhopper/article/details/81206673

https://blog.ailemon.me/2017/06/06/install-tensorflow-gpu-on-ubuntu-linux/

# **激活anaconda子环境**

```
source activate tfgpu
```



# **升级更新pip**

如果本机未安装python和pip，则安装之

```
sudo apt-get install python-pip python-dev
```

更新pip

```
sudo pip install -U pip
```

升级pip并添加别的源

```
mkdir ~/.pip

vi ~/.pip/pip.conf
```

添加如下内容并保存退出

```
[global] index-url=http://mirrors.aliyun.com/pypi/simple/ 
[install] trusted-host=mirrors.aliyun.com 
```

# **安装tensorflow-gpu 1.9.0**

```
pip install tensorflow-gpu==1.9.0
```

测试tensorflowGPU是否使用了GPU

import tensorflow as tf
tf.test.is_gpu_available()

如果输出true，则表示GPU正常运行了

\< < <True



下面是当时控制台的一些信息，记录一下，这个True字很令人开心

```
(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ mkdir ~/.pip
(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ vi ~/.pip/pip.conf
(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ vim ~/.pip/pip.conf
The program 'vim' can be found in the following packages:

- vim
- vim-gnome
- vim-tiny
- vim-athena
- vim-athena-py2
- vim-gnome-py2
- vim-gtk
- vim-gtk-py2
- vim-gtk3
- vim-gtk3-py2
- vim-nox
- vim-nox-py2
  Try: sudo apt install <selected package>
  (tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ vi ~/.pip/pip.conf
  (tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ sudo gedit ~/.pip/pip.conf 

(gedit:9177): Gtk-WARNING **: Calling Inhibit failed: GDBus.Error:org.freedesktop.DBus.Error.ServiceUnknown: The name org.gnome.SessionManager was not provided by any .service files

** (gedit:9177): WARNING **: Set document metadata failed: Setting attribute metadata::gedit-spell-enabled not supported

** (gedit:9177): WARNING **: Set document metadata failed: Setting attribute metadata::gedit-encoding not supported

** (gedit:9177): WARNING **: Set document metadata failed: Setting attribute metadata::gedit-position not supported
(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ sudo pip install -U pip
sudo: pip: command not found
(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ sudo apt-get install python-pip python-dev
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following additional packages will be installed:
  libpython-all-dev libpython-dev libpython2.7-dev python-all python-all-dev python-pkg-resources python-setuptools python-wheel python2.7-dev
Suggested packages:
  python-setuptools-doc
The following NEW packages will be installed:
  libpython-all-dev libpython-dev libpython2.7-dev python-all python-all-dev python-dev python-pip python-pkg-resources python-setuptools python-wheel python2.7-dev
0 upgraded, 11 newly installed, 0 to remove and 3 not upgraded.
Need to get 28.6 MB of archives.
After this operation, 43.1 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:1 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 libpython2.7-dev amd64 2.7.12-1ubuntu0~16.04.4 [27.8 MB]
Get:2 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 libpython-dev amd64 2.7.12-1~16.04 [7,840 B]
Get:3 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 libpython-all-dev amd64 2.7.12-1~16.04 [1,006 B]
Get:4 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 python-all amd64 2.7.12-1~16.04 [996 B]
Get:5 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 python2.7-dev amd64 2.7.12-1ubuntu0~16.04.4 [276 kB]
Get:6 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 python-dev amd64 2.7.12-1~16.04 [1,186 B]
Get:7 http://mirrors.nju.edu.cn/ubuntu xenial-updates/main amd64 python-all-dev amd64 2.7.12-1~16.04 [1,016 B]
Get:8 http://mirrors.nju.edu.cn/ubuntu xenial-updates/universe amd64 python-pip all 8.1.1-2ubuntu0.4 [144 kB]
Get:9 http://mirrors.nju.edu.cn/ubuntu xenial/main amd64 python-pkg-resources all 20.7.0-1 [108 kB]
Get:10 http://mirrors.nju.edu.cn/ubuntu xenial/main amd64 python-setuptools all 20.7.0-1 [169 kB]
Get:11 http://mirrors.nju.edu.cn/ubuntu xenial/universe amd64 python-wheel all 0.29.0-1 [48.0 kB]
Fetched 28.6 MB in 3s (7,260 kB/s)       
Selecting previously unselected package libpython2.7-dev:amd64.
(Reading database ... 217001 files and directories currently installed.)
Preparing to unpack .../libpython2.7-dev_2.7.12-1ubuntu0~16.04.4_amd64.deb ...
Unpacking libpython2.7-dev:amd64 (2.7.12-1ubuntu0~16.04.4) ...
Selecting previously unselected package libpython-dev:amd64.
Preparing to unpack .../libpython-dev_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython-dev:amd64 (2.7.12-1~16.04) ...
Selecting previously unselected package libpython-all-dev:amd64.
Preparing to unpack .../libpython-all-dev_2.7.12-1~16.04_amd64.deb ...
Unpacking libpython-all-dev:amd64 (2.7.12-1~16.04) ...
Selecting previously unselected package python-all.
Preparing to unpack .../python-all_2.7.12-1~16.04_amd64.deb ...
Unpacking python-all (2.7.12-1~16.04) ...
Selecting previously unselected package python2.7-dev.
Preparing to unpack .../python2.7-dev_2.7.12-1ubuntu0~16.04.4_amd64.deb ...
Unpacking python2.7-dev (2.7.12-1ubuntu0~16.04.4) ...
Selecting previously unselected package python-dev.
Preparing to unpack .../python-dev_2.7.12-1~16.04_amd64.deb ...
Unpacking python-dev (2.7.12-1~16.04) ...
Selecting previously unselected package python-all-dev.
Preparing to unpack .../python-all-dev_2.7.12-1~16.04_amd64.deb ...
Unpacking python-all-dev (2.7.12-1~16.04) ...
Selecting previously unselected package python-pip.
Preparing to unpack .../python-pip_8.1.1-2ubuntu0.4_all.deb ...
Unpacking python-pip (8.1.1-2ubuntu0.4) ...
Selecting previously unselected package python-pkg-resources.
Preparing to unpack .../python-pkg-resources_20.7.0-1_all.deb ...
Unpacking python-pkg-resources (20.7.0-1) ...
Selecting previously unselected package python-setuptools.
Preparing to unpack .../python-setuptools_20.7.0-1_all.deb ...
Unpacking python-setuptools (20.7.0-1) ...
Selecting previously unselected package python-wheel.
Preparing to unpack .../python-wheel_0.29.0-1_all.deb ...
Unpacking python-wheel (0.29.0-1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libpython2.7-dev:amd64 (2.7.12-1ubuntu0~16.04.4) ...
Setting up libpython-dev:amd64 (2.7.12-1~16.04) ...
Setting up libpython-all-dev:amd64 (2.7.12-1~16.04) ...
Setting up python-all (2.7.12-1~16.04) ...
Setting up python2.7-dev (2.7.12-1ubuntu0~16.04.4) ...
Setting up python-dev (2.7.12-1~16.04) ...
Setting up python-all-dev (2.7.12-1~16.04) ...
Setting up python-pip (8.1.1-2ubuntu0.4) ...
Setting up python-pkg-resources (20.7.0-1) ...
Setting up python-setuptools (20.7.0-1) ...
Setting up python-wheel (0.29.0-1) ...

(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ pip install tensorflow-gpu==1.9.0
Looking in indexes: http://mirrors.aliyun.com/pypi/simple/
Collecting tensorflow-gpu==1.9.0
  Downloading http://mirrors.aliyun.com/pypi/packages/f1/3b/f24b243038db1c6c73acddd4c5f1497e2de596f381fe76d1f80204b0fa21/tensorflow_gpu-1.9.0-cp35-cp35m-manylinux1_x86_64.whl (229.6MB)
    100% |████████████████████████████████| 229.6MB 3.2MB/s 
Collecting protobuf>=3.4.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/bf/d4/db7296a1407cad69f043537ba1e05afab3646451a066ead7a314d8714388/protobuf-3.6.1-cp35-cp35m-manylinux1_x86_64.whl (1.1MB)
    100% |████████████████████████████████| 1.1MB 12.8MB/s 
Collecting grpcio>=1.8.6 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/90/b4/ce6b50cd30a07a13143eec055c9737573916327217fbe243e38856e2ab95/grpcio-1.16.1-cp35-cp35m-manylinux1_x86_64.whl (9.7MB)
    100% |████████████████████████████████| 9.7MB 7.4MB/s 
Collecting six>=1.10.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/67/4b/141a581104b1f6397bfa78ac9d43d8ad29a7ca43ea90a2d863fe3056e86a/six-1.11.0-py2.py3-none-any.whl
Collecting absl-py>=0.1.6 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/0c/63/f505d2d4c21db849cf80bad517f0065a30be6b006b0a5637f1b95584a305/absl-py-0.6.1.tar.gz (94kB)
    100% |████████████████████████████████| 102kB 10.5MB/s 
Collecting gast>=0.2.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/5c/78/ff794fcae2ce8aa6323e789d1f8b3b7765f601e7702726f430e814822b96/gast-0.2.0.tar.gz
Collecting numpy>=1.13.3 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/86/04/bd774106ae0ae1ada68c67efe89f1a16b2aa373cc2db15d974002a9f136d/numpy-1.15.4-cp35-cp35m-manylinux1_x86_64.whl (13.8MB)
    100% |████████████████████████████████| 13.8MB 2.7MB/s 
Collecting astor>=0.6.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/35/6b/11530768cac581a12952a2aad00e1526b89d242d0b9f59534ef6e6a1752f/astor-0.7.1-py2.py3-none-any.whl
Collecting setuptools<=39.1.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/8c/10/79282747f9169f21c053c562a0baa21815a8c7879be97abd930dbcf862e8/setuptools-39.1.0-py2.py3-none-any.whl (566kB)
    100% |████████████████████████████████| 573kB 13.8MB/s 
Collecting tensorboard<1.10.0,>=1.9.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/9e/1f/3da43860db614e294a034e42d4be5c8f7f0d2c75dc1c428c541116d8cdab/tensorboard-1.9.0-py3-none-any.whl (3.3MB)
    100% |████████████████████████████████| 3.3MB 9.3MB/s 
Requirement already satisfied: wheel>=0.26 in ./anaconda3/envs/tfgpu/lib/python3.5/site-packages (from tensorflow-gpu==1.9.0) (0.31.1)
Collecting termcolor>=1.1.0 (from tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/8a/48/a76be51647d0eb9f10e2a4511bf3ffb8cc1e6b14e9e4fab46173aa79f981/termcolor-1.1.0.tar.gz
Collecting werkzeug>=0.11.10 (from tensorboard<1.10.0,>=1.9.0->tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/20/c4/12e3e56473e52375aa29c4764e70d1b8f3efa6682bef8d0aae04fe335243/Werkzeug-0.14.1-py2.py3-none-any.whl (322kB)
    100% |████████████████████████████████| 327kB 9.1MB/s 
Collecting markdown>=2.6.8 (from tensorboard<1.10.0,>=1.9.0->tensorflow-gpu==1.9.0)
  Downloading http://mirrors.aliyun.com/pypi/packages/7a/6b/5600647404ba15545ec37d2f7f58844d690baf2f81f3a60b862e48f29287/Markdown-3.0.1-py2.py3-none-any.whl (89kB)
    100% |████████████████████████████████| 92kB 7.8MB/s 
Building wheels for collected packages: absl-py, gast, termcolor
  Running setup.py bdist_wheel for absl-py ... done
  Stored in directory: /home/gyw/.cache/pip/wheels/aa/4d/58/b32b9fecc4f448dce09a02441f823fe46f70cab32285304553
  Running setup.py bdist_wheel for gast ... done
  Stored in directory: /home/gyw/.cache/pip/wheels/17/0a/dc/bb6d7b129029482a8d55901d66b65e756a681f6a1da7297a9b
  Running setup.py bdist_wheel for termcolor ... done
  Stored in directory: /home/gyw/.cache/pip/wheels/65/c8/98/8361afe9bafba434b7acf14c08627560d63018272226ff3e10
Successfully built absl-py gast termcolor
Installing collected packages: setuptools, six, protobuf, grpcio, absl-py, gast, numpy, astor, werkzeug, markdown, tensorboard, termcolor, tensorflow-gpu
  Found existing installation: setuptools 40.2.0
    Uninstalling setuptools-40.2.0:
      Successfully uninstalled setuptools-40.2.0
Successfully installed absl-py-0.6.1 astor-0.7.1 gast-0.2.0 grpcio-1.16.1 markdown-3.0.1 numpy-1.15.4 protobuf-3.6.1 setuptools-39.1.0 six-1.11.0 tensorboard-1.9.0 tensorflow-gpu-1.9.0 termcolor-1.1.0 werkzeug-0.14.1
You are using pip version 10.0.1, however version 18.1 is available.
You should consider upgrading via the 'pip install --upgrade pip' command.
(tfgpu) gyw@gyw-HP-Pavilion-Notebook:~$ python
Python 3.5.6 |Anaconda, Inc.| (default, Aug 26 2018, 21:41:56) 
[GCC 7.3.0] on linux
Type "help", "copyright", "credits" or "license" for more information.

> > > import tensorflow as tf
> > > tf.test.is_gpu_available()
> > > 2018-11-23 16:29:05.273136: I tensorflow/core/platform/cpu_feature_guard.cc:141] Your CPU supports instructions that this TensorFlow binary was not compiled to use: AVX2 FMA
> > > 2018-11-23 16:29:05.600329: I tensorflow/stream_executor/cuda/cuda_gpu_executor.cc:897] successful NUMA node read from SysFS had negative value (-1), but there must be at least one NUMA node, so returning NUMA node zero
> > > 2018-11-23 16:29:05.601321: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1392] Found device 0 with properties: 
> > > name: GeForce GTX 1050 major: 6 minor: 1 memoryClockRate(GHz): 1.493
> > > pciBusID: 0000:01:00.0
> > > totalMemory: 1.95GiB freeMemory: 1.68GiB
> > > 2018-11-23 16:29:05.601373: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1471] Adding visible gpu devices: 0
> > > 2018-11-23 16:29:05.837880: I tensorflow/core/common_runtime/gpu/gpu_device.cc:952] Device interconnect StreamExecutor with strength 1 edge matrix:
> > > 2018-11-23 16:29:05.837934: I tensorflow/core/common_runtime/gpu/gpu_device.cc:958]      0 
> > > 2018-11-23 16:29:05.837942: I tensorflow/core/common_runtime/gpu/gpu_device.cc:971] 0:   N 
> > > 2018-11-23 16:29:05.838148: I tensorflow/core/common_runtime/gpu/gpu_device.cc:1084] Created TensorFlow device (/device:GPU:0 with 1440 MB memory) -> physical GPU (device: 0, name: GeForce GTX 1050, pci bus id: 0000:01:00.0, compute capability: 6.1)
> > > True


```

