
# 3. НАСТРОЙКИ ИНТЕРФЕЙСА
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
# Устанавливает тайм-аут
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 9999 /f
# мигать практически бесконечно
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /
# отображение секунд в часах 
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable 2>$null
# отключает автоматическую диагностику памяти
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable 2>$null
# отключает автоматический запуск полной проверки оперативной памяти.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v Attributes /t REG_DWORD /d 2 /f
# делает видимым скрытый параметр электропитания, который отвечает за адаптивную настройку яркости
sc.exe config AMD Crash Defender Service start= disabled
sc.exe stop AMD Crash Defender Service
# полностью отключают службу "AMD Crash Defender"
sc.exe config AMD External Events Utility start= disabled
sc.exe stop AMD External Events Utility
# отключают службу "AMD External Events Utility
sc.exe config DoSvc  start= disabled
sc.exe stop DoSvc
# полностью отключают службу «Оптимизация доставки
sc delete diagsvc start= disabled
sc.exe stop diagsvc
# избавиться от службы «Служба диагностических политик»
sc.exe config WdiSystemHost start= disabled
sc.exe stop WdiSystemHost
# отключают службу «Узел системы диагностики» 
sc.exe config TrkWks start= disabled
sc.exe stop TrkWks
# полностью отключают службу «Клиент отслеживания изменившихся связей»
sc.exe config lfsvc start= disabled
sc.exe stop lfsvc
# отключает службу геолокации
sc.exe config RasMan start= disabled
sc.exe stop RasMan
# отключает Диспетчер подключений удаленного доступа
sc.exe config SSDPSRV start= disabled
sc.exe stop SSDPSRV
# отключает службу SSDP Discovery
sc.exe config DiagTrack start= disabled
sc.exe stop DiagTrack
sc delete DiagTrack
# удаляют службу Connected User Experiences and Telemetry (Функциональные возможности для подключенных пользователей и телеметрия).
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Dsh" /v "AllowWidgets" /t REG_DWORD /d 1 /f
# разрешает использование Виджетов в Windows 11
