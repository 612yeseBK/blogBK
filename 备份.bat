@echo off
echo ��ʼ���ݲ���
xcopy . ..\blogBK /s /e /y /EXCLUDE:.\exclude.ins
cd ..
cd blogBK
echo ��ʼ��ӵ�Զ�ֿ̲�
git add .
git commit -m "backup commit"
git push origin master
echo ����Դ�뱸�����
echo ��������˳�......
pause>nul