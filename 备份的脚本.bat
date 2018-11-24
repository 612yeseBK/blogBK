@echo off
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins
cd ..
cd blogBK
echo 开始提交到远程仓库
pause
git add .
git commit -m "backup commit"
git push origin master
echo 脚本会自动生成一个备份文件并上传至我的git里面
echo 已经执行完毕，按任意键退出....
pause>nul