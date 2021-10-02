@echo off
@echo off setlocal 
@cls 
title 고정 IP 및 DNS 설정 프로그램 (by heejaen)
color 1f
mode con cols=70 lines=25
echo   ===============================================================
echo.
echo                   회사 내 고정 IP 및 DNS 설정하기 
echo.
echo   ===============================================================
echo     *** 네트워크가 연결된 상태에서 설정하세요 ***
echo     *** 회사에 맞는 subnetmask, gw, dns 설정 후 사용하세요 ***
echo   ===============================================================
echo.
set /p inputIP =* 사용할 IP를 입력해주세요 : 
echo. 
echo ... 네트워크 설정 중입니다...
:: 네트워크이름 찾기 
for /f "tokens=2 delims==" %%a in ('wmic nic where "NetConnectionStatus=2 and AdapterTypeId=0" get NetConnectionId /format:list') do set netId=%%a 
:: IP 설정 입력받은 IP x.x.x.x에서 " . "으로 구분하고, 
:: 회사 IP 정책에 따라 3번째가 게이트웨이가 변경됨. 
for /f "tokens=1,2,3,4 delims=." %%i in ("%inputIP%") do netsh interface ip set address "%netID%" static %inputIP% 255.255.255.0 %%i.%%j.%%k.2 
:: 고정DNS 
netsh interface ip set dns "%netID%" static 8.8.8.8 primary 
netsh interface ip add dns "%netID%" 1.1.1.1 index=2 
echo. 
echo ... IP 및 DNS 설정이 완료되었습니다... 
echo. pause