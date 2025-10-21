# Удаление списка часто используемых программ из меню "Пуск"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" -Name "NoStartMenuMFUprogramsList" -Value 1 -Type DWord

# Отключение отображения недавних поисковых запросов в Проводнике
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord

# Ограничение интернет-коммуникаций
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows" -Name "DisableOSKAdvertising" -Value 1 -Type DWord

# Отключение Центра обновления Windows
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value 1 -Type DWord

# Схема управления питанием - Высокая производительность
powercfg -setactive 8c5e7fda-e8bf-4a96-9a85-a6e23a8c635c

# Приватность - доступ к информации аккаунта
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessAccountInfo" -Value 2 -Type DWord

# Приватность - доступ к глазному трекеру
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessEyeTracker" -Value 0 -Type DWord

# Приватность - доступ к истории звонков
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\AppPrivacy" -Name "LetAppsAccessCallHistory" -Value 0 -Type DWord

# Диагностические данные - отключено
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Type DWord

# Защитник Windows - служба всегда запущена
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "ServiceKeepAlive" -Value 1 -Type DWord

# Защитник Windows - мониторинг поведения
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableBehaviorMonitoring" -Value 0 -Type DWord

# Защитник Windows - защита в реальном времени
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableOnAccessProtection" -Value 0 -Type DWord

# Защитник Windows - сканирование при включении
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableScanOnRealtimeEnable" -Value 0 -Type DWord

# Защитник Windows - сканирование скриптов
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableScriptScanning" -Value 0 -Type DWord

# Поиск - облачный поиск
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Name "AllowCloudSearch" -Value 0 -Type DWord

# Поиск - Cortana
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -Type DWord

# Отчеты об ошибках - отключено
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Name "Disabled" -Value 1 -Type DWord

# Отчеты об ошибках - не отправлять доп. данные
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Windows Error Reporting" -Name "DontSendAdditionalData" -Value 1 -Type DWord

# Центр обновления - не перезагружать при пользователе
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoRebootWithLoggedOnUsers" -Value 1 -Type DWord

# Центр обновления - день установки (ежедневно)
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "ScheduledInstallDay" -Value 0 -Type DWord

# Центр обновления - время установки (3:00)
Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "ScheduledInstallTime" -Value 3 -Type DWord

# Отключение автозапуска для съемных носителей
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDriveTypeAutorun /t REG_DWORD /d 158 /f

# Применение групповых политик
gpupdate /force

# Отключение службы индексирования
sc.exe stop WSearch
sc.exe config WSearch start= disabled

# Отключение FTP службы
sc.exe stop ftpsvc
sc.exe config ftpsvc start= disabled

# Отключение PunkBuster
sc.exe stop PnkBstrA
sc.exe config PnkBstrA start= disabled

# Отключение службы инвентаризации
sc.exe stop InventorySvc
sc.exe config InventorySvc start= disabled

# Перезапуск Проводника Windows
taskkill /f /im explorer.exe
start explorer.exe