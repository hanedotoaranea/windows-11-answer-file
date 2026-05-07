
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



reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
увеличивает приоритет игровых и мультимедийных задач
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d -1 /f
отключает ограничение пропускной способности сети
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f
оптимизирует распределение ресурсов процессора, отдавая максимальный приоритет активному окну
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f
стандартное время жизни (TTL) для исходящих IP-пакетов равным 128.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
полностью отключает сбор телеметрии
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f
отключает Automatic Maintenance
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
полностью отключает сбор телеметрии 32-битных приложений
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
отключает назойливые уведомления с просьбой оставить отзыв о работе Windows.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f

отключает «Журнал действий»

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
 отключения рекламного идентификатора

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "AllowClipboardHistory" /t REG_DWORD /d 0 /f
полностью отключает облачный буфер обмена
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
 запрещает публикацию действий пользователя в облаке.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
запрещает выгрузку (upload) вашей активности на серверы Microsoft.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
полностью отключает Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
 отключает сбор данных об использовании приложений
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
 запрещает Windows сканировать компьютер для сбора списка установленного ПО и файлов.

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
полностью отключает функции записи экрана и захвата игр 

reg add "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d 2 /f
 Полностью отключает программу улучшения качества ПО
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
 Полностью отключает программу улучшения качества ПО

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
полностью отключает автоматическое обновление Windows














