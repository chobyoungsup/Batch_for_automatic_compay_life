@echo off setlocal 
@cls title 고정 IP 및 DNS 설정 프로그램 
echo ===============================================
echo 고정 IP 및 DNS 설정하기
echo.
echo *** 랜선이 연결된 상태에서 설정하세요.***
echo ===============================================
set /p inputIP = 사용할 IP를 입력해주세요.: 
echo. 
echo ... 네트워크 설정 중입니다..
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
echo. 
pause