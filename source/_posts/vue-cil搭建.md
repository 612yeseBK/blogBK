---
title: vue-cil搭建
categories: 前端
tags:
  - vue-cil
date: 2019-03-18 20:22:16
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何使用搭建vue-cil的文章<!-- more -->
<The rest of contents | 余下全文>

安装vue-cli

```
npm install -g vue-cli
```

创建项目

```
vue init webpack myproject
```

打开项目

我使用的是WebStrom工具打开

如下图是目录结构：

![1](/vue-cil搭建/1.png)

修改HelloWorld.vue文件如下：

```
<template>
  <div>
   hello world!
  </div>
</template>
```

![2](/vue-cil搭建/2.png)

运行程序

![2-1](/vue-cil搭建/2-1.png)

打开浏览器

![3](/vue-cil搭建/3.png)

引入第三方插件Element-UI

![1552912956348](/vue-cil搭建/1552912956348.png)

全局注册与引用

![5](/vue-cil搭建/5.png)

代码如下：

```
import Vue from 'vue'
import App from './App'
import router from './router'
import ElementUI from 'element-ui'
import 'element-ui/lib/theme-chalk/index.css'
import CollapseTransition from 'element-ui/lib/transitions/collapse-transition'

Vue.config.productionTip = false
Vue.use(ElementUI)
Vue.use(CollapseTransition)
/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
```



界面效果如下![6](/vue-cil搭建/6.png)

