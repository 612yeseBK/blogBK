@echo off
echo 开始备份博客
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins
cd ..
cd blogBK
echo 开始添加到远程仓库
git add .
git commit -m "backup commit"
git push origin master
echo 博客源码备份完毕
echo 按任意键退出......
pause>nul