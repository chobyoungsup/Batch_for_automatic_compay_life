@echo off
@echo off setlocal 
@cls
title PC이름, 컴퓨터 계정명, 부서명 새로 설정하는 프로그램입니다.(by heejaena)
color 1f
mode con cols=75 lines=30
for /f "tokens=2 delims==" %%z in ('wmic computersystem get workgroup /format:list') do set Ndepart=%%z
echo   ====================================================================  
echo.
echo.             PC이름, 컴퓨터 계정명, 부서명 새로 설정하기
echo. 
echo   ====================================================================  
echo.
echo    - 현재 계정 이름 : %username%
echo    - 현재 PC 이름  :  %computername%
echo    - 현재 부서 이름 : %Ndepart%
echo.
echo  ※ 값 입력 후 적용을 위해 60초 후 컴퓨터가 강제종료됩니다.
echo     종료를 멈추고 싶다면, cmd 창에서 shutdown -a를 입력하세요.
echo.
echo   ====================================================================  
echo.
echo   * 새로 설정할 이름을 입력해 주세요.
echo.
CD C:\Windows\System32
set /p Uname= - 계정 이름 : 
set /p Cname= - PC 이름 : 
set /p Cdepartment= - 부서 이름 : 
echo.
echo  ... 설정중 입니다 ...
echo.
::전체 계정이름
wmic UserAccount where Name="%username%" set FullName="%Uname%"
::계정 이름
wmic UserAccount where Name="%username%" rename name="%Uname%"
::컴퓨터 이름
wmic computersystem where name="%computername%" call rename name="%Cname%"
::부서명
wmic computersystem where name="%computername%" call joindomainorworkgroup name="%Cdepartment%"
::시스템 환경 변수만 안 바꿔서 강제로 지정하기
setx /m computername %Cname%
for /f "tokens=2 delims==" %%z in ('wmic computersystem get workgroup /format:list') do set Ndepart2=%%z
echo - 바뀐 계정 이름 : %username%
echo - 바뀐 PC 이름 : %computername%
echo - 바뀐 부서 이름 : %Ndepart2%
echo.
echo ※ 컴퓨터를 종료 후 재부팅해야 제대로 적용됩니다...
echo    60초 후에 컴퓨터가 종료됩니다. (종료를 멈추고 싶다면, cmd창에서 shutdown -a를 입력하세요.)
timeout /t 5
echo.
::컴퓨터 강제 종료
shutdown /r /f /t 55 
GOTO _MENU