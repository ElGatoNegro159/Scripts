
chcp 65001
@echo off

rem Задержка после остановки служб
set agentStopTimeout=10

rem Имя службы Sentinel LDK
set hasplms="hasplms"

echo "Остановка служб"
echo %time%
net stop %hasplms%

timeout %agentStopTimeout%

echo "Запуск служб"
echo %time%
net start %hasplms%

echo "Перезапуск завершен"
