:: БЛОК КОНФИДЕНЦИАЛЬНОСТИ - ЗАПРЕТ ДОСТУПА ПРИЛОЖЕНИЙ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation" /v "Value" /t REG_SZ /d "Deny" /f
:: Отключение голосовой активации

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к задачам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к геолокации

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к веб-камере

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
:: Блокировка доступа к информации учетной записи

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к контактам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к встречам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к телефонным звонкам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к email

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к чатам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к радиомодулям

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет Bluetooth синхронизации

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет диагностики приложений

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к документам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к изображениям

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к видео

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
:: Блокировка доступа к файловой системе

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\camera" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к камере

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\accountInfo" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к информации аккаунта

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\calendar" /v "Value" /t REG_SZ /d "Deny" /f
:: Блокировка доступа к календарю

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\callHistory" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к истории звонков

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\messaging" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к сообщениям

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\otherDevices" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к другим устройствам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\backgroundApps" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет фоновых приложений

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к папке загрузок

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documents" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к документам

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\pictures" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к изображениям

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videos" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к видео

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\fileSystem" /v "Value" /t REG_SZ /d "Deny" /f
:: Запрет доступа к файловой системе

:: НАСТРОЙКИ ИНТЕРФЕЙСА И ПРОИЗВОДИТЕЛЬНОСТИ
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
:: Восстановление классического меню Win+X

reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
:: Таймаут зависших приложений 1 сек

reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d "1" /f
:: Автозавершение зависших задач

reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d "1000" /f
:: Таймаут низкоуровневых хуков

reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
:: Отключение анимации окон

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
:: Отключение прозрачности

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f
:: Скрыть недавние файлы

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f
:: Скрыть часто используемые файлы

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d 1 /f
:: Подробный вывод операций

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /v "{F337BBA0-5BF7-47E0-BA5E-39E29912B148}" /t REG_BINARY /d "0c00000004000000010000000000000000777e137335cf11ae6908002b2e12620400000003000000" /f
:: Настройка вида папок

:: БЛОК ТЕЛЕМЕТРИИ И СЛЕЖКИ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
:: Отключение персонализированного опыта

reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
:: Отказ от политики конфиденциальности

reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v HasAccepted /t REG_DWORD /d 0 /f
:: Отключение облачного распознавания речи

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
:: Отключение рекламного ID

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 0 /f
:: Отключение уведомлений диагностики

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
:: Отключение предложений приложений

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
:: Отключение предложений Windows

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f
:: Отключение истории поиска

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
:: Запрет фоновых приложений

reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
:: Запрет сбора текстовой информации

reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
:: Запрет сбора рукописного ввода

:: СИСТЕМНЫЕ ПОЛИТИКИ ТЕЛЕМЕТРИИ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
:: Полное отключение телеметрии

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
:: Отключение сбора данных

reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
:: Отключение телеметрии для 32-бит

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
:: Отключение уведомлений обратной связи

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
:: Отключение ленты активности

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
:: Запрет публикации активности

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
:: Запрет загрузки активности

reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ActivityFeed" /v EnableActivityFeed /t REG_DWORD /d 0 /f
:: Отключение ленты активности

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
:: Отключение Cortana

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
:: Отключение оценки совместимости

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
:: Отключение инвентаризации приложений

:: ОТКЛЮЧЕНИЕ СЛУЖБ
sc.exe stop DiagTrack
sc.exe config DiagTrack start= disabled
:: Служба диагностического отслеживания

sc.exe stop CDPSvc
sc.exe config CDPSvc start= disabled
:: Служба данных подключения

sc.exe stop CDPUserSvc_237c2c
sc.exe config CDPUserSvc_237c2c start= disabled
:: Служба данных пользователя

sc.exe stop NPSMSvc_237c2c
sc.exe config NPSMSvc_237c2c start= disabled
:: Служба SMS

sc.exe stop SSDPSRV
sc.exe config SSDPSRV start= disabled
:: Обнаружение SSDP

sc.exe stop TextInputManagementService
sc.exe config TextInputManagementService start= disabled
:: Служба управления текстовым вводом

sc.exe stop whesvc
sc.exe config whesvc start= disabled
:: Служба политики повышения энергоэффективности

sc.exe stop WSAFabricSvc
sc.exe config WSAFabricSvc start= disabled
:: Служба Windows Subsystem for Android

sc.exe stop spooler
sc.exe config spooler start= disabled
:: Служба печати

sc.exe stop bthserv
sc.exe config bthserv start= disabled
:: Служба поддержки Bluetooth

sc.exe stop fax
sc.exe config fax start= disabled
:: Служба факса

sc.exe stop XblAuthManager
sc.exe config XblAuthManager start= disabled
:: Менеджер аутентификации Xbox

sc.exe stop XblGameSave
sc.exe config XblGameSave start= disabled
:: Сохранение игр Xbox

sc.exe stop XboxNetApiSvc
sc.exe config XboxNetApiSvc start= disabled
:: Сетевая служба Xbox

sc.exe stop lfsvc
sc.exe config lfsvc start= disabled
:: Служба геопозиции

sc.exe stop RemoteRegistry
sc.exe config RemoteRegistry start= disabled
:: Удаленный реестр

sc.exe stop AJRouter
sc.exe config AJRouter start= disabled
:: Служба маршрутизатора AllJoyn

sc.exe stop NetTcpPortSharing
sc.exe config NetTcpPortSharing start= disabled
:: Общий доступ к портам Net.Tcp

sc.exe stop WiaRpc
sc.exe config WiaRpc start= disabled
:: Служба сканеров и камер

sc.exe stop BDESVC
sc.exe config BDESVC start= disabled
:: Служба шифрования дисков BitLocker

sc.exe stop SCardSvr
sc.exe config SCardSvr start= disabled
:: Служба смарт-карт

sc.exe stop WpcMonSvc
sc.exe config WpcMonSvc start= disabled
:: Родительский контроль

sc.exe stop HvHost
sc.exe config HvHost start= disabled
:: Служба гипервизора

sc.exe stop Browser
sc.exe config Browser start= disabled
:: Обозреватель компьютеров

sc.exe stop WMPNetworkSvc
sc.exe config WMPNetworkSvc start= disabled
:: Сетевая служба проигрывателя Windows Media

sc.exe stop SensorDataService
sc.exe config SensorDataService start= disabled
:: Служба данных датчиков

sc.exe stop SensrSvc
sc.exe config SensrSvc start= disabled
:: Служба датчиков

sc.exe stop RmSvc
sc.exe config RmSvc start= disabled
:: Служба управления радио

sc.exe stop SstpSvc
sc.exe config SstpSvc start= disabled
:: Служба SSTP

sc.exe stop lmhosts
sc.exe config lmhosts start= disabled
:: Вспомогательная служба NetBIOS

:: УДАЛЕНИЕ ВСТРОЕННЫХ ПРИЛОЖЕНИЙ
Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue
:: Удаление Dev Home

Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue
:: Удаление Windows Phone

Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *xboxapp* | Remove-AppxPackage -ErrorAction SilentlyContinue
:: Удаление Xbox App

Get-AppxPackage -AllUsers *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue
:: Удаление Your Phone

Get-AppxPackage *Bing* | Remove-AppxPackage -ErrorAction SilentlyContinue
:: Удаление Bing приложений

Get-AppxPackage *Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue
:: Удаление Xbox приложений

:: СЕТЕВЫЕ НАСТРОЙКИ
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f
:: TTL сетевых пакетов

:: НАСТРОЙКИ ПРОИЗВОДИТЕЛЬНОСТИ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
:: Отзывчивость системы

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
:: Отключение игровой DVR

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoAutoplayfornonVolume /t REG_DWORD /d 1 /f
:: Отключение автозапуска

:: ОПТИМИЗАЦИЯ ДИСКА И ПИТАНИЯ
fsutil behavior set DisableDeleteNotify 0
:: Включение TRIM для SSD

powercfg -setacvalueindex SCHEME_BALANCED SUB_PROCESSOR PERFBOOSTMODE 0
:: Режим энергосбережения процессора

powercfg -setactive SCHEME_BALANCED
:: Сбалансированная схема питания

:: НАСТРОЙКИ ЗАГРУЗКИ
bcdedit /set {current} bootmenupolicy legacy
:: Классическое меню загрузки

:: СИСТЕМНЫЕ ТАЙМАУТЫ
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "2000" /f
:: Таймаут завершения служб

reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
:: Сброс индекса поиска

:: ПАМЯТЬ И ПРИОРИТЕТЫ
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d 00010000 /f
:: Лимит блокировки страниц ввода-вывода

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d ffffffff /f
:: Отключение сетевого троттлинга

reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f
:: Разделение приоритетов процессов

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
:: Отключение датчиков

:: ОТКЛЮЧЕНИЕ ЗАДАНИЙ ПЛАНИРОВЩИКА
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
:: Диагностика памяти

schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable
:: Полная диагностика памяти

schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
:: Программа улучшения качества

schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
:: CEIP для USB

schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
:: Оценка совместимости

schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /f
:: Расширенная оценка совместимости

schtasks /delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f
:: Задача автозагрузки

schtasks /delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f
:: Отчеты об ошибках

:: ОТКЛЮЧЕНИЕ АВТООБНОВЛЕНИЙ
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
:: Запрет автоматических обновлений