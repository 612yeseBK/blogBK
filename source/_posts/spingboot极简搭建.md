---
title: spingBoot极简搭建
categories: JavaWeb
tags:
  - springBoot
date: 2019-03-18 19:41:14
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何使用idea去快速构建springboot的文章<!-- more -->
<The rest of contents | 余下全文>

# 搭建环境

```
windows10
```



# 搭建过程

![1](/spingboot极简搭建/1.png)

![2](/spingboot极简搭建/2.png)

![3](/spingboot极简搭建/3.png)

![4](/spingboot极简搭建/4.png)

![5](/spingboot极简搭建/5.png)

由此可以搭建完成，目录结构如下

![6](/spingboot极简搭建/6.png)

# HelloWorld搭建

新建文件夹controller和文件UploadController.java

![7](/spingboot极简搭建/7.png)

在UploadController里写入如下代码

```
@RestController
public class UploadController {

    @RequestMapping("/")
    public String index(){
        return "Hello World!";
    }
}
```

![7-1](/spingboot极简搭建/7-1.png)

将配置文件的后缀改成yml

![8](/spingboot极简搭建/8.png)

添加端口配置

```
server:
  port: 8001
```

![9](/spingboot极简搭建/9.png)

启动程序，打开浏览器访问8001端口，可见如下页面

![10](/spingboot极简搭建/10.png)