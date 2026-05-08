
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
sc.exe delete diagsvc start= disabled
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
sc.exe delete DiagTrack
# удаляют службу Connected User Experiences and Telemetry (Функциональные возможности для подключенных пользователей и телеметрия).
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Dsh" /v "AllowWidgets" /t REG_DWORD /d 1 /f
# разрешает использование Виджетов в Windows 11



reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
# увеличивает приоритет игровых и мультимедийных задач
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d -1 /f
# отключает ограничение пропускной способности сети
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f
# оптимизирует распределение ресурсов процессора, отдавая максимальный приоритет активному окну
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f
# стандартное время жизни (TTL) для исходящих IP-пакетов равным 128.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
# полностью отключает сбор телеметрии
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f
# отключает Automatic Maintenance
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
# полностью отключает сбор телеметрии 32-битных приложений
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
# отключает назойливые уведомления с просьбой оставить отзыв о работе Windows.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
# отключает «Журнал действий»
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
# отключения рекламного идентификатора
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
# запрещает публикацию действий пользователя в облаке.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
# запрещает выгрузку (upload) вашей активности на серверы Microsoft.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
# полностью отключает Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
# отключает сбор данных об использовании приложений
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
# запрещает Windows сканировать компьютер для сбора списка установленного ПО и файлов.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
# полностью отключает функции записи экрана и захвата игр 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d 2 /f
# Полностью отключает программу улучшения качества ПО
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
# Полностью отключает программу улучшения качества ПО
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
# полностью отключает автоматическое обновление Windows
sc.exe config SSDPSRV start= disabled
sc.exe stop SSDPSRV
# отключает службу обнаружения SSDP
























sc.exe config WSAFabricSvc start= disabled
sc.exe stop WSAFabricSv
отключают службу подсистемы Windows для Android
sc.exe config fax start= disabled
sc.exe stop fax
полностью отключают службу Факса.
sc.exe config XblAuthManager start= demand
sc.exe stop XblAuthManager
Диспетчер аутентификации Xbox
sc.exe config XblGameSave start= disabled
sc.exe stop XblGameSave
полностью отключают службу сохранения игр Xbox
sc.exe config XboxNetApiSvc start= disabled
sc.exe stop XboxNetApiSvc
 отключает сетевую службу Xbox Live
sc.exe config RemoteRegistry start= disabled
sc.exe stop RemoteRegistry
отключает службу «Удаленный реестр» 
sc.exe config AJRouter start= disabled
sc.exe stop AJRouter
отключает службу «Маршрутизатор AllJoyn
sc.exe config NetTcpPortSharing start= disabled
sc.exe stop NetTcpPortSharing
отключает службу совместного использования портов TCP 
sc.exe config HvHost start= disabled
sc.exe stop HvHost
 отключает службу узла Hyper-V (Hyper-V Host Service).
sc.exe config Browser start= disabled
sc.exe stop Browser
 отключает службу «Обозреватель компьютеров»
sc.exe config WMPNetworkSvc start= disabled
sc.exe stop WMPNetworkSvc
отключает службу обмена данными проигрывателя Windows Media
sc.exe config lmhosts start= disabled
sc.exe stop lmhosts
 отключает службу поддержки NetBIOS через TCP/IP
sc.exe config fhsvc start= disabled ; sc.exe stop fhsvc
 отключает службу «История файлов»
sc.exe config InventorySvc start= disabled ; sc.exe stop InventorySvc
отключает службу «Инвентаризация Windows» (
sc.exe config lltdsvc start= disabled ; sc.exe stop lltdsvc
отключает протокол обнаружения топологии канального уровня (Link-Layer Topology Discovery Mapper).
sc.exe config McpManagementService start= disabled ; sc.exe stop McpManagementService
отключает службу управления универсальными печатными платами (Universal Print Management Service).
sc.exe config MSiSCSI start= disabled ; sc.exe stop MSiSCSI
отключает сетевые диски
sc.exe config PrintDeviceConfigurationService start= demand ; sc.exe stop PrintDeviceConfigurationService
конфигурация печати
sc.exe config refsdedupsvc start= disabled ; sc.exe stop refsdedupsvc
Служба дедупликации данных для файловой системы ReFS
sc.exe config RemoteAccess start= disabled ; sc.exe stop RemoteAccess
полностью отключают службу маршрутизации и удалённого доступа (Routing and Remote Access Service, RRAS).
sc.exe config RetailDemo start= disabled ; sc.exe stop RetailDemo
олностью отключают службу режима розничной демонстрации (Retail Demo Service).
sc.exe config SCPolicySvc start= disabled ; sc.exe stop SCPolicySvc
 полностью отключают службу политики удаления смарт-карт (Smart Card Removal Policy Service).
sc.exe config SEMgrSvc start= disabled ; sc.exe stop SEMgrSvc
 полностью отключают службу управления платежами и NFC/защищёнными элементами (Payments and NFC/SE Manager).
 sc.exe config shpamsvc start= disabled ; sc.exe stop shpamsvc
 полностью отключают службу управления гостевой и общей учётной записи (Shared PC Account Manager Service).
sc.exe config SNMPTrap start= disabled ; sc.exe stop SNMPTrap
 полностью отключают SNMP Trap Service (служба SNMP-ловушек).
sc.exe config svsvc start= demand ; sc.exe stop svsvc
вручную службу Spot Verifier (проверка потенциальных повреждений файловой системы).
sc.exe config vmicguestinterface start= disabled ; sc.exe stop vmicguestinterface
 полностью отключают службу Hyper-V Guest Service Interface (интерфейс гостевой службы Hyper-V).
sc.exe config vmicheartbeat start= disabled ; sc.exe stop vmicheartbeat
полностью отключают службу пульса Hyper-V
sc.exe config vmickvpexchange start= disabled ; sc.exe stop vmickvpexchange
 полностью отключают службу обмена данными Hyper-V (Hyper-V Data Exchange Service / KVP) .
sc.exe config vmicrdv start= disabled ; sc.exe stop vmicrdv
полностью отключают службу удалённой рабочей среды Hyper-V (Hyper-V Remote Desktop Virtualization Service) .
 sc.exe config vmicshutdown start= disabled ; sc.exe stop vmicshutdown
полностью отключают службу завершения работы гостевой ОС Hyper-V (Hyper-V Guest Shutdown Service) 
sc.exe config vmictimesync start= disabled ; sc.exe stop vmictimesync
 отключают службу среды Hyper-V 
sc.exe config vmicvmsession start= disabled ; sc.exe stop vmicvmsession
 отключают службу среды Hyper-V 
sc.exe config vmicvss start= disabled ; sc.exe stop vmicvss
 отключают службу среды Hyper-V 
sc.exe config wercplsupport start= disabled ; sc.exe stop wercplsupport
полностью отключают службу поддержки панели управления «Проблемы и решения» (Problem Reports and Solutions Control Panel Support).
sc.exe config WSAIFabricSvc start= disabled ; sc.exe stop WSAIFabricSvc
полностью отключают службу Windows AI Fabric (Windows AI Fabric Service).
sc.exe config XboxGipSvc start= disabled ; sc.exe stop XboxGipSvc
 полностью отключают службу управления аксессуарами Xbox (Xbox Accessory Management Service).
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "20000" /f
изменяет значение реестра WaitToKillServiceTimeout, которое определяет, сколько времени Windows
fsutil behavior set DisableDeleteNotify 0
включает функцию TRIM для SSD
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
отключаете автоматический, фоновый запуск ProcessMemoryDiagnosticEvents
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable
отключает задачу полной диагностики памяти RunFullMemoryDiagnostic
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
полностью удаляет задачи Программы улучшения качества ПО (Customer Experience Improvement Program, CEIP)
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
полностью удаляет задачу Microsoft Compatibility Appraiser сбора телеметрии и оценки совместимости Windows 
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /f
полностью удаляет задачу Microsoft Compatibility Appraiser Exp оценки совместимости для Windows 11
schtasks /delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f
полностью удаляет задачу StartupAppTask


















 


























