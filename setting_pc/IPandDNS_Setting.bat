@echo off
@echo off setlocal 
@cls 
title ���� IP �� DNS ���� ���α׷� (by heejaen)
color 1f
mode con cols=70 lines=25
echo   ===============================================================
echo.
echo                   ȸ�� �� ���� IP �� DNS �����ϱ� 
echo.
echo   ===============================================================
echo     *** ��Ʈ��ũ�� ����� ���¿��� �����ϼ��� ***
echo     *** ȸ�翡 �´� subnetmask, gw, dns ���� �� ����ϼ��� ***
echo   ===============================================================
echo.
set /p inputIP =* ����� IP�� �Է����ּ��� : 
echo. 
echo ... ��Ʈ��ũ ���� ���Դϴ�...
:: ��Ʈ��ũ�̸� ã�� 
for /f "tokens=2 delims==" %%a in ('wmic nic where "NetConnectionStatus=2 and AdapterTypeId=0" get NetConnectionId /format:list') do set netId=%%a 
:: IP ���� �Է¹��� IP x.x.x.x���� " . "���� �����ϰ�, 
:: ȸ�� IP ��å�� ���� 3��°�� ����Ʈ���̰� �����. 
for /f "tokens=1,2,3,4 delims=." %%i in ("%inputIP%") do netsh interface ip set address "%netID%" static %inputIP% 255.255.255.0 %%i.%%j.%%k.2 
:: ����DNS 
netsh interface ip set dns "%netID%" static 8.8.8.8 primary 
netsh interface ip add dns "%netID%" 1.1.1.1 index=2 
echo. 
echo ... IP �� DNS ������ �Ϸ�Ǿ����ϴ�... 
echo. pause