@echo off
:: Windows Optimization Batch Script
:: Удаляет ненужные приложения и применяет настройки производительности
:: Требует прав администратора

:: Проверка прав администратора
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo Этот скрипт требует прав администратора.
    echo Пожалуйста, запустите от имени администратора.
    pause
    exit /b
)

echo Удаление ненужных приложений...
:: Удаление UWP-приложений
for %%a in (
    "*StorePurchaseApp*"
    "*Store*"
    "*Windows.DevHome*"
    "*windowsphone*"
    "*xboxapp*"
) do (
    powershell -command "Get-AppxPackage -AllUsers %%a | Remove-AppxPackage -ErrorAction SilentlyContinue"
    if !errorlevel! equ 0 (
        echo Удалено: %%a
    ) else (
        echo Не удалось удалить: %%a
    )
)

echo Применение настроек производительности...
:: Настройки рабочего стола
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d "50" /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d "2000" /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d b012038010000000 /f

:: Визуальные эффекты
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f

echo Перезапуск проводника...
taskkill /f /im explorer.exe >nul
start explorer.exe

echo Оптимизация завершена!
pause
