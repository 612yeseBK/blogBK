@echo off
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins
cd ..
cd blogBK
echo ��ʼ�ύ��Զ�ֿ̲�
pause
git add .
git commit -m "backup commit"
git push origin master
echo �ű����Զ�����һ�������ļ����ϴ����ҵ�git����
echo �Ѿ�ִ����ϣ���������˳�....
pause>nul