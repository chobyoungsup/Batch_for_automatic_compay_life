@echo off
@echo off setlocal 
@cls
title PC�̸�, ��ǻ�� ������, �μ��� ���� �����ϴ� ���α׷��Դϴ�.(by heejaena)
color 1f
mode con cols=75 lines=30
for /f "tokens=2 delims==" %%z in ('wmic computersystem get workgroup /format:list') do set Ndepart=%%z
echo   ====================================================================  
echo.
echo.             PC�̸�, ��ǻ�� ������, �μ��� ���� �����ϱ�
echo. 
echo   ====================================================================  
echo.
echo    - ���� ���� �̸� : %username%
echo    - ���� PC �̸�  :  %computername%
echo    - ���� �μ� �̸� : %Ndepart%
echo.
echo  �� �� �Է� �� ������ ���� 60�� �� ��ǻ�Ͱ� ��������˴ϴ�.
echo     ���Ḧ ���߰� �ʹٸ�, cmd â���� shutdown -a�� �Է��ϼ���.
echo.
echo   ====================================================================  
echo.
echo   * ���� ������ �̸��� �Է��� �ּ���.
echo.
CD C:\Windows\System32
set /p Uname= - ���� �̸� : 
set /p Cname= - PC �̸� : 
set /p Cdepartment= - �μ� �̸� : 
echo.
echo  ... ������ �Դϴ� ...
echo.
::��ü �����̸�
wmic UserAccount where Name="%username%" set FullName="%Uname%"
::���� �̸�
wmic UserAccount where Name="%username%" rename name="%Uname%"
::��ǻ�� �̸�
wmic computersystem where name="%computername%" call rename name="%Cname%"
::�μ���
wmic computersystem where name="%computername%" call joindomainorworkgroup name="%Cdepartment%"
::�ý��� ȯ�� ������ �� �ٲ㼭 ������ �����ϱ�
setx /m computername %Cname%
for /f "tokens=2 delims==" %%z in ('wmic computersystem get workgroup /format:list') do set Ndepart2=%%z
echo - �ٲ� ���� �̸� : %username%
echo - �ٲ� PC �̸� : %computername%
echo - �ٲ� �μ� �̸� : %Ndepart2%
echo.
echo �� ��ǻ�͸� ���� �� ������ؾ� ����� ����˴ϴ�...
echo    60�� �Ŀ� ��ǻ�Ͱ� ����˴ϴ�. (���Ḧ ���߰� �ʹٸ�, cmdâ���� shutdown -a�� �Է��ϼ���.)
timeout /t 5
echo.
::��ǻ�� ���� ����
shutdown /r /f /t 55 
GOTO _MENU