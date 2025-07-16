chcp 1251
@echo off
set oproxyPort=1542
set crserverName=localhost
set crserverPort=2542
set oproxyName="oproxy_%oproxyPort%_%crserverPort%"
set oproxyConfigPath="C:/oproxy_configs/%oproxyName%.os"

rem oproxy remove-daemon --daemon-name %oproxyName%
oproxy create-daemon --daemon-name %oproxyName% --proxy-port %oproxyPort% --storage-server %crserverName% --storage-port %crserverPort% --check-file %oproxyConfigPath%

pause