@echo off
setlocal
:: ���� �ð� : %time%
:: ���� ��¥ : %date%
:: ���� �ð��� ���� 08:20:31.06 > �ð�:��:�� > �ʴ� �ʿ�����ϱ�, ��/�и� �����´�.

set /a current_h=%time:~0,2%
set /a current_m=%time:~3,2%
echo ����ð� : %current_h%�� %current_m%��
::for /f "tokens=1,2 delims=:" %%i in ("%time%") do set current_h=%%i 
::for /f "tokens=1,2 delims=:" %%i in ("%time%") do set current_m=%%j
::echo ����ð� : %current_h%�� %current_m%��

:: ��� �ð� : 17:30�̸� ���� ��� �ð���  18:00�̸� �ٲٸ� �ȴ�...
set leave_h=17
set leave_m=30
echo ��ٽð� : %leave_h%�� %leave_m%��


set /a mid_h=%leave_h%-%current_h%
set /a mid_m=%leave_m%-%current_m%

echo.
if %mid_m% lss 0 (
  set /a mid_m=%mid_m%+60
  set /a mid_h=%mid_h%-1
)

if %mid_h% lss 0 (
  echo ����� �ð��� �������ϴ�.
) else (
  echo ���� �ð��� %mid_h%�ð� %mid_m%���Դϴ�.
  )
)
pause