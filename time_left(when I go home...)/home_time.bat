@echo off
setlocal
:: 현재 시간 : %time%
:: 현재 날짜 : %date%
:: 현재 시간의 형식 08:20:31.06 > 시간:분:초 > 초는 필요없으니까, 시/분만 꺼내온다.

set /a current_h=%time:~0,2%
set /a current_m=%time:~3,2%
echo 현재시간 : %current_h%시 %current_m%분
::for /f "tokens=1,2 delims=:" %%i in ("%time%") do set current_h=%%i 
::for /f "tokens=1,2 delims=:" %%i in ("%time%") do set current_m=%%j
::echo 현재시간 : %current_h%시 %current_m%분

:: 퇴근 시간 : 17:30이면 만약 퇴근 시간이  18:00이면 바꾸면 된다...
set leave_h=17
set leave_m=30
echo 퇴근시간 : %leave_h%시 %leave_m%분


set /a mid_h=%leave_h%-%current_h%
set /a mid_m=%leave_m%-%current_m%

echo.
if %mid_m% lss 0 (
  set /a mid_m=%mid_m%+60
  set /a mid_h=%mid_h%-1
)

if %mid_h% lss 0 (
  echo 퇴근할 시간이 지났습니다.
) else (
  echo 남은 시간은 %mid_h%시간 %mid_m%분입니다.
  )
)
pause