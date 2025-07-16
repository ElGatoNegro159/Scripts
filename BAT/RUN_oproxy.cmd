
@echo off

rem Запуск прокси-сервера для хранилищ конфигураций 1С (по протоколу TCP)

rem Порт прокси-сервера
set ProxyPort=1642
rem Адрес сервера хранилищ конфигураций
set StorageServer=localhost
rem Порт хранилища конфигураций
set StoragePort=1542
rem Путь к файлу проверок
set CheckFile=c:\work\oproxy\StorageControl.os

oproxy start --proxy-port %ProxyPort% --storage-server %StorageServer% --storage-port %StoragePort% --check-file %CheckFile%