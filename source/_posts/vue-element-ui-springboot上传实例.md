---
title: vue+element-ui+springboot上传实例
categories: JavaWeb
tags:
  - springBoot
date: 2019-03-18 19:40:17
typora-root-url: ./
---
<Excerpt in index | 首页摘要>摘要：这是一篇介绍如何使用xxx去xxxxx<!-- more -->
<The rest of contents | 余下全文>

参考来源：https://blog.csdn.net/TyCoding/article/details/82904715

# 前端代码

```
<el-upload
  class="upload-demo"
  action="http://127.0.0.1:8888/uploadFile/"
  name="file"
  :multiple="false"
  :limit=1
  :show-file-list="false"
>
<div class="classBox fucBox" @click="addArticle">
  <i class="el-icon-plus" style="font-size: 70px;margin-left: 14px;margin-top: 20px"></i>
  <p style="margin-top: 40px;margin-left: 12px">文书新增</p>
</div>
```

其中参数介绍：

参数**name** 表示当前组件上传的文件字段名，需要和后端的上传接口字段名相同 

参数**action** 表示此上传组件对应的上传接口，此时我们使用的是后端Controller定义的接口 

# 后端代码

```
    @CrossOrigin
    @RequestMapping(value = "/uploadFile")
    @ResponseBody
    public void uploadFile(@RequestParam("file") MultipartFile picture, HttpServletRequest request, HttpServletResponse response) {
//        String path = request.getSession().getServletContext().getRealPath("/upload");
        String path = "E:\\myspace\\毕业设计\\工程部分\\addDir";
        File filePath = new File(path);
        System.out.println("文件的保存路径：" + path);
        if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("目录不存在，创建目录:" + filePath);
            filePath.mkdir();
        }

        //获取原始文件名称(包含格式)
        String originalFileName = picture.getOriginalFilename();
        System.out.println("原始文件名称：" + originalFileName);

        //获取文件类型，以最后一个`.`为标识
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("文件类型：" + type);
        //获取文件名称（不包含格式）
        String name = originalFileName.substring(0, originalFileName.lastIndexOf("."));

        //设置文件新名称: 当前时间+文件名称（不包含格式）
        Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String date = sdf.format(d);
        String fileName = date + name + "." + type;
        System.out.println("新文件名称：" + fileName);

        //在指定路径下创建一个文件
        File targetFile = new File(path, fileName);

        //将文件保存到服务器指定位置
        try {
            picture.transferTo(targetFile);
            System.out.println("上传成功");
            //将文件在服务器的存储路径返回
            return;
        } catch (IOException e) {
            System.out.println("上传失败");
            e.printStackTrace();
            return;
        }
    }
}
```

注意：@CrossOrigin是为了解决跨域访问的问题

# 结果展示

![1](/vue-element-ui-springboot上传实例/1.png)

点击选择某一个文件即可实现上传。