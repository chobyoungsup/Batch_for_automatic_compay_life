set desDir=D:\backup\
set todayDate=%date:~0,4%%date:~5,2%%date:~8,2%

echo f | xcopy "C:\Windows\system32\winevt\Logs\Application.evtx" "%desDir%%todayDate%_Application.evtx"
echo f | xcopy "C:\Windows\system32\winevt\Logs\Security.evtx" "%desDir%%todayDate%_Security.evtx"
echo f | xcopy "C:\Windows\system32\winevt\Logs\System.evtx" "%desDir%%todayDate%_System.evtx"

set desDir=
set todayDate=

#add web work...
