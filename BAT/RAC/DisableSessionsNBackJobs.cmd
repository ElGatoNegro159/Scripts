@echo off
chcp 65001

rem Каталог установки платформ
SET platformsCatalog=C:\Program Files\1cv8
rem Версия платформы
SET platformVersion=8.3.21.1484

rem Сервер приложения
SET server1CRAS=localhost
rem Порт сервера администрирования
SET port1CRAS=1545

rem Идентификатор кластера:
rem посмотреть с помощью команды "rac.exe cluster %server1CRAS%:%port1CRAS% list"
SET clusterUid=11111111-1111-1111-1111-111111111111

rem Идентификатор информационной базы
rem посмотреть с помощью команды "rac.exe infobase %server1CRAS%:%port1CRAS% summary list --cluster=%clusterUid%"
SET infobaseUid=11111111-1111-1111-1111-111111111111
SET infobaseUser=Администратор
SET infobasePwd=

rem Пароль доступа к базе
SET permissionCode=12345
rem Сообщение при запуске
SET deniedMsg="База данных временно заблокирована. Для доступа к базе необходимо запустить программу с дополнительным параметром \"/UC %permissionCode%\"."
rem Включение / отключение блокировки: on|off
SET lockStatus=on

rem Отправка команды на RAS
cd "%platformsCatalog%\%platformVersion%\bin"
rac.exe infobase %server1CRAS%:%port1CRAS% update --cluster=%clusterUid% --infobase=%infobaseUid% --infobase-user=%infobaseUser% --infobase-pwd=%infobasePwd% --denied-message=%deniedMsg% --sessions-deny=%lockStatus% --scheduled-jobs-deny=%lockStatus%
