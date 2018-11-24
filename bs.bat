@echo off
echo 一键部署博客
hexo clean && hexo generate && hexo deploy
echo 按任意键退出....
pause>nul