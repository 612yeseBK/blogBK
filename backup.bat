@echo off
echo "begin to backup"
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins
cd ..\blogBK
echo begin to commit to github
git add .
git commit -m "backup commit"
git push origin master
cd ..\blog
echo Success:we have finished the bat
echo press any key to exit...
pause>nul