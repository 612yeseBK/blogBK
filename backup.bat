@echo off
setlocal enabledelayedexpansion
echo "begin to backup"
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins
cd ..\blogBK
echo begin to commit to github
git add .
git commit -m "backup commit"
git push origin master
cd ..\blog
set "t=备份完成，请按任意键退出......"
call :loop
echo.
pause>nul 
goto :eof

:loop
if not "!t!"=="" (
>"!t!_",set /p "=   "<nul
findstr /a:02 .* "!t!_*" 2>nul
::ping -n 1 127.1>nul
del "!t!_"
)
goto :eof