@echo off
title PC Shutdown
color 0A

:menu
cls
echo ==============================
echo       PC SHUTDOWN
echo ==============================
echo.
echo 1. Shutdown after N minutes
echo 2. Shutdown after N hours
echo 3. Cancel shutdown
echo 4. Exit
echo.
set /p choice="Select (1-4): "

if "%choice%"=="1" goto minutes
if "%choice%"=="2" goto hours
if "%choice%"=="3" goto cancel
if "%choice%"=="4" exit
goto menu

:minutes
cls
set /p time="Enter minutes: "
set /a seconds=%time%*60
echo.
echo PC will shutdown after %time% minutes
shutdown /s /t %seconds%
echo.
echo To cancel - run program and select 3
pause
goto menu

:hours
cls
set /p time="Enter hours: "
set /a seconds=%time%*3600
echo.
echo PC will shutdown after %time% hours
shutdown /s /t %seconds%
echo.
echo To cancel - run program and select 3
pause
goto menu

:cancel
cls
shutdown /a
echo Shutdown cancelled!
pause
goto menu