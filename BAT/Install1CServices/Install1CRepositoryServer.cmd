chcp 1251
@echo off
set PlatformVersion=8.3.26.1521
set SrvUserName=.\usr1cv8
rem Актуальный пароль сохранён в безопасном хранилище
rem set SrvUserPwd="Pass123"
set crserverPort=2542
set SrvcName="crserver_%crserverPort%"
set PathToRepo="C:\1C_Repository\%crserverPort%"
set BinPath="\"C:\Program Files\1cv8\%PlatformVersion%\bin\crserver.exe\" -srvc -port %crserverPort% -d \"%PathToRepo%\""
set Desctiption="1C:Enterprise 8.3 (%PlatformVersion%) Configuration Repository Server (port %crserverPort%)"
sc stop %SrvcName%
sc delete %SrvcName%
sc create %SrvcName% binPath= %BinPath% start=auto obj=%SrvUserName% displayname=%Desctiption%

pause