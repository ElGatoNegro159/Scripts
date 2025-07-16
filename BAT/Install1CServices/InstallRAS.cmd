chcp 1251
@echo off
set PlatformVersion=8.3.26.1521
set SrvUserName=.\usr1cv8
rem Актуальный пароль сохранён в безопасном хранилище
rem set SrvUserPwd="Pass123"
set CtrlPort=1540
set AgentName=localhost
set RASPort=1545
set SrvcName=ras1cv83
set BinPath="\"C:\Program Files\1cv8\%PlatformVersion%\bin\ras.exe\" cluster --service --port=%RASPort% %AgentName%:%CtrlPort%"
set Desctiption="1C:Enterprise Remote Administration Server 8.3 (%PlatformVersion%) Port %RASPort%"
sc stop %SrvcName%
sc delete %SrvcName%
sc create %SrvcName% binPath=%BinPath% start=auto obj=%SrvUserName% displayname=%Desctiption%
