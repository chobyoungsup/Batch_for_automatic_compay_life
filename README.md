# Batch_for_automatic_compay_life 배치파일로 회사 생활 자동화

#### These are `batch files` for automated company work. <br> 자동화된 회사업무를 하기위한 배치파일 입니다.

***
### CONTEXT
   
#### 1. Backup Eventlog (filename: backup_eventlog\backup_eventlog.bat) 
```
      - 컴퓨터 이벤트로그 백업하는 배치파일이다. 
        (Batch file for backup computer eventlog)
      - batch file을 스케줄 등록도 해야 자동으로 백업 설정이 된다.
      - 설정방법 : https://jennana.tistory.com/87?category=928016 
```
#### 2. Setting static IP and DNS (filename : setting_pc\IPandDNS_Setting.bat)
```
      - 고정 IP와 DNS 주소를 설정해주는 배치파일이다.
        (Batch file for setting static IP and DNS address)
        * batch script 내에서 for문(tokens, delims), netsh, wimc를 이용하였다.
      - 자세한 문법 설명 : https://jennana.tistory.com/119?category=928016 
```
#### 3. Name Setting (filename : setting_pc\Name(PC,User,Department)_setting.bat)
```
      - PC 이름, 계정명, 부서명을 설정해주는 배치파일이다. 
        (Batch file for setting Computername, Username, Departmentname)
      - 윈도우 환경변수 정리한 내용 : https://jennana.tistory.com/154?category=928016
```
#### 4. Set Booting File and Program  (filenaem : when_boot_pc\start.bat)
```
      - 컴퓨터 부팅 시 자동으로 원한는 프로그램이 실행되도록 하는 배치파일이다. 
        (Batch file for executing programs or files which I want when the computer booting)
      - 사용방법: 
         1) 해당 batch파일 내 프로그램 또는 파일을 원하는 것으로 수정한다.
         2) 운영체제에 맞는 위치에 넣어준다.
           [윈도우7] C:\Users\%username%\Roaming\Microsoft\Windows\Start Menu\programs\Startup
           [윈도우10] C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp
      - 자세한 설정방법 : https://jennana.tistory.com/124?category=928016
```
#### 5. Calculate left Time (filename : time_left(when I go home...)\home_time.bat)
```
      - 퇴근시간까지 얼마나 남았는지 확인하는 배치파일. 
        (Batch file for checking how much time is left unil work time)
```
###### ... 계속해서 업데이트할 예정입니다 ...
***
