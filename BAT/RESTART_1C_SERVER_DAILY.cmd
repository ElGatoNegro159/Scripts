chcp 65001
@echo off

rem Задержка после остановки служб
set agentStopTimeout=60
rem Задержка после завершения процессов
set agentStartTimeout=60

rem Имя агента сервера 1С
set srvcAgentName="srv1cv83_1540"
rem Имя агента сервера администрирования 1С
set srvcRASName="ras1cv83"
rem Имя агента КИП 1С
set srvcAgentETPName="1C_AgentETP_x86-64"


echo "Остановка служб"
echo %time%
net stop %srvcAgentName%
net stop %srvcRASName%
net stop %srvcAgentETPName%


timeout %agentStopTimeout%

echo "Принудительное завершение процессов"
echo %time%
TASKKILL /F /FI "USERNAME eq usr1cv8" /IM ragent.exe
TASKKILL /F /FI "USERNAME eq usr1cv8" /IM rmngr.exe
TASKKILL /F /FI "USERNAME eq usr1cv8" /IM rphost.exe
TASKKILL /F /FI "USERNAME eq usr1cv8" /IM 1cv8*
TASKKILL /F /IM AgentETP.exe



timeout %agentStartTimeout%

echo "Запуск служб"
echo %time%
net start %srvcAgentName%
net start %srvcRASName%
net start %srvcAgentETPName%

echo "Перезапуск завершен"
