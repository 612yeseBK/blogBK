@echo off
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins

echo 脚本会自动生成一个备份文件并上传至我的git里面
echo 已经执行完毕，按任意键退出....
pause>nul