chcp 1251
@echo off
set PlatformVersion=8.3.26.1521
set SrvUserName=.\usr1cv8
rem Актуальный пароль сохранён в безопасном хранилище
rem set SrvUserPwd="Pass123"
set serverPort=1540
set regPort=1541
set range=1560:1591
set srvcName=srv1cv83_%serverPort%
set ServerFilesDirectory=C:\Program Files\1cv8\srvinfo_%serverPort%
rem set BinPath="\"C:\Program Files\1cv8\%PlatformVersion%\bin\ragent.exe\" -srvc -agent -port %serverPort% -regport %regPort% -range %range% -debug -http -d \"%ServerFilesDirectory%\""
set BinPath="\"C:\Program Files\1cv8\%PlatformVersion%\bin\ragent.exe\" -srvc -agent -port %serverPort% -regport %regPort% -range %range% -d \"%ServerFilesDirectory%\""
set Desctiption="1C:Enterprise 8.3 (%PlatformVersion%) Server Agent (port %serverPort%)"
sc stop %srvcName%
sc delete %srvcName%
sc create %srvcName% binPath= %BinPath% start=auto obj=%SrvUserName% displayname=%Desctiption%

pause