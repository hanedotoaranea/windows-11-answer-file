# ============================================
# 1. СЕТЕВЫЕ НАСТРОЙКИ
# ============================================
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 4294967295 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "20000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v Attributes /t REG_DWORD /d 2 /f
fsutil behavior set DisableDeleteNotify 0

# ============================================
# 2. СИСТЕМНЫЕ ПОЛИТИКИ (HKLM)
# ============================================
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Messenger\Client" /v "CEIP" /t REG_DWORD /d 2 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\SQMClient\Windows" /v "CEIPEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule\Maintenance" /v "MaintenanceDisabled" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Policies\Microsoft\Dsh" /v "AllowWidgets" /t REG_DWORD /d 1 /f

# ============================================
# 3. НАСТРОЙКИ ИНТЕРФЕЙСА (HKCU)
# ============================================
REG DELETE "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 9999 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve

# ============================================
# 4. ТЕЛЕМЕТРИЯ И КОНФИДЕНЦИАЛЬНОСТЬ (HKCU)
# ============================================
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v HasAccepted /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 0 /f
# ИСПРАВЛЕНО: опечатка Subsc.exeribedContent -> SubscribedContent
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ActivityFeed" /v EnableActivityFeed /t REG_DWORD /d 0 /f

# ============================================
# 5. ЗАПРЕТ ДОСТУПА ПРИЛОЖЕНИЙ
# ============================================
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\voiceActivation" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\camera" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\accountInfo" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\calendar" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\callHistory" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\messaging" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\otherDevices" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\backgroundApps" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\downloadsFolder" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documents" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\pictures" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videos" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\fileSystem" /v "Value" /t REG_SZ /d "Deny" /f

# ============================================
# 6. ОТКЛЮЧЕНИЕ СЛУЖБ
# ИСПРАВЛЕНО: manual заменено на demand, удалены пустые строки
# ============================================
sc.exe config "AMD Crash Defender Service" start= demand
sc.exe stop "AMD Crash Defender Service"

sc.exe config "AMD External Events Utility" start= demand
sc.exe stop "AMD External Events Utility"

sc.exe config DiagTrack start= disabled
sc.exe stop DiagTrack
sc.exe delete DiagTrack

sc.exe config diagsvc start= disabled
sc.exe stop diagsvc
sc.exe delete diagsvc

sc.exe config WdiSystemHost start= demand
sc.exe stop WdiSystemHost

sc.exe config SSDPSRV start= demand
sc.exe stop SSDPSRV

sc.exe config RasMan start= demand
sc.exe stop RasMan

sc.exe config RemoteAccess start= demand
sc.exe stop RemoteAccess

sc.exe config RemoteRegistry start= demand
sc.exe stop RemoteRegistry

sc.exe config lmhosts start= demand
sc.exe stop lmhosts

sc.exe config lltdsvc start= demand
sc.exe stop lltdsvc

sc.exe config NetTcpPortSharing start= demand
sc.exe stop NetTcpPortSharing

sc.exe config WFDSConMgrSvc start= demand
sc.exe stop WFDSConMgrSvc

sc.exe config AJRouter start= demand
sc.exe stop AJRouter

sc.exe config icssvc start= demand
sc.exe stop icssvc

sc.exe config MSiSCSI start= demand
sc.exe stop MSiSCSI

sc.exe config HvHost start= demand
sc.exe stop HvHost

sc.exe config vmicguestinterface start= demand
sc.exe stop vmicguestinterface

sc.exe config vmicheartbeat start= demand
sc.exe stop vmicheartbeat

sc.exe config vmickvpexchange start= demand
sc.exe stop vmickvpexchange

sc.exe config vmicrdv start= demand
sc.exe stop vmicrdv

sc.exe config vmicshutdown start= demand
sc.exe stop vmicshutdown

sc.exe config vmictimesync start= demand
sc.exe stop vmictimesync

sc.exe config vmicvmsession start= demand
sc.exe stop vmicvmsession

sc.exe config vmicvss start= demand
sc.exe stop vmicvss

sc.exe config XblAuthManager start= disabled
sc.exe stop XblAuthManager

sc.exe config XblGameSave start= disabled
sc.exe stop XblGameSave

sc.exe config XboxNetApiSvc start= disabled
sc.exe stop XboxNetApiSvc

sc.exe config XboxGipSvc start= disabled
sc.exe stop XboxGipSvc

sc.exe config Browser start= demand
sc.exe stop Browser

sc.exe config TrkWks start= demand
sc.exe stop TrkWks

sc.exe config WMPNetworkSvc start= demand
sc.exe stop WMPNetworkSvc

sc.exe config lfsvc start= demand
sc.exe stop lfsvc

sc.exe config fhsvc start= demand
sc.exe stop fhsvc

sc.exe config InventorySvc start= demand
sc.exe stop InventorySvc

sc.exe config McpManagementService start= demand
sc.exe stop McpManagementService

sc.exe config fax start= demand
sc.exe stop fax

sc.exe config wercplsupport start= demand
sc.exe stop wercplsupport

sc.exe config Wecsvc start= demand
sc.exe stop Wecsvc

sc.exe config whesvc start= demand
sc.exe stop whesvc

sc.exe config PrintDeviceConfigurationService start= demand
sc.exe stop PrintDeviceConfigurationService

sc.exe config refsdedupsvc start= demand
sc.exe stop refsdedupsvc

sc.exe config RetailDemo start= demand
sc.exe stop RetailDemo

sc.exe config SCPolicySvc start= demand
sc.exe stop SCPolicySvc

sc.exe config SEMgrSvc start= demand
sc.exe stop SEMgrSvc

sc.exe config shpamsvc start= demand
sc.exe stop shpamsvc

sc.exe config smphost start= demand
sc.exe stop smphost

sc.exe config SNMPTrap start= demand
sc.exe stop SNMPTrap

sc.exe config svsvc start= demand
sc.exe stop svsvc

sc.exe config WSAFabricSvc start= demand
sc.exe stop WSAFabricSvc

sc.exe config WSAIFabricSvc start= demand
sc.exe stop WSAIFabricSvc

sc.exe config bthserv start= demand
sc.exe stop bthserv

sc.exe config WdiServiceHost start= demand
sc.exe stop WdiServiceHost

sc.exe config StiSvc start= demand
sc.exe stop StiSvc

sc.exe config SysMain start= demand
sc.exe stop SysMain
sc.exe config wudfsvc start=disabled

# ============================================
# 7. ЗАДАНИЯ ПЛАНИРОВЩИКА
# ============================================
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f

# ============================================
# 8. УДАЛЕНИЕ ПРИЛОЖЕНИЙ (PowerShell) И ДРАЙВЕРОВ
# ============================================
powershell -Command "Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue"
powershell -Command "Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue"
# Отключаем скачивание драйверов через Центр обновлений
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v ExcludeWUDriversInQualityUpdate /t REG_DWORD /d 1 /f
# Отключаем поиск драйверов в Центре обновлений
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DriverSearching" /v SearchOrderConfig /t REG_DWORD /d 0 /f
# Отключаем автоматический поиск драйверов через интернет
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Device Metadata" /v PreventDeviceMetadataFromNetwork /t REG_DWORD /d 1 /f
for /f %I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "AarSvc" ^| find /i "AarSvc"') do (reg add "%I" /v "Start" /t reg_dword /d 4 /f)
for /f %I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "MessagingService" ^| find /i "MessagingService"') do (reg add "%I" /v "Start" /t reg_dword /d 4 /f)
for /f %I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "P9RdrService" ^| find /i "P9RdrService"') do (reg add "%I" /v "Start" /t reg_dword /d 4 /f)
for /f %I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "PenService" ^| find /i "PenService"') do (reg add "%I" /v "Start" /t reg_dword /d 4 /f)
for /f %I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services" /k /f "PrintWorkflowUserSvc" ^| find /i "PrintWorkflowUserSvc"') do (reg add "%I" /v "Start" /t reg_dword /d 4 /f)
sc.exe config xbgm start= disabled
sc.exe stop xbgm
sc.exe config wmiApSrv start= disabled
sc.exe stop wmiApSrv
sc.exe config WbioSrvc start= disabled
sc.exe stop WbioSrvc
sc.exe delete Browser
sc.exe config DevQueryBroker start= disabled
sc.exe stop DevQueryBroker
sc.exe config SgrmBroker start= disabled
sc.exe stop SgrmBroker
sc.exe config WebClient start= disabled
sc.exe stop WebClient
sc.exe config autotimesvc start= disabled
sc.exe stop autotimesvc
sc.exe config p2psvc start= disabled
sc.exe stop p2psvc
sc.exe config RasAuto start= disabled
sc.exe stop RasAuto
sc.exe config SEMgrSvc start= disabled
sc.exe stop SEMgrSvc
sc.exe config XblAuthManager start= disabled
sc.exe stop XblAuthManager
sc.exe config MapsBroker start= disabled
sc.exe stop MapsBroker
sc.exe config p2pimsvc start= disabled
sc.exe stop p2pimsvc
sc.exe config pla start= disabled
sc.exe stop pla
sc.exe config vmicguestinterface start= disabled
sc.exe stop vmicguestinterface
sc.exe config TrkWks start= disabled
sc.exe stop TrkWks
sc.exe config SNMPTRAP start= disabled
sc.exe stop SNMPTRAP
sc.exe config RpcLocator start= disabled
sc.exe stop RpcLocator
sc.exe config SessionEnv start= disabled
sc.exe stop SessionEnv
sc.exe config SharedAccess start= disabled
sc.exe stop SharedAccess
sc.exe config ShellHWDetection start= disabled
sc.exe stop ShellHWDetection
sc.exe config SCPolicySvc start= disabled
sc.exe stop SCPolicySvc
sc.exe config BcastDVRUserService start= disabled
sc.exe stop BcastDVRUserService
sc.exe config SDRSVC start= disabled
sc.exe stop SDRSVC
sc.exe config PNRPsvc start= disabled
sc.exe stop PNRPsvc
sc.exe config workfolderssvc start= disabled
sc.exe stop workfolderssvc
sc.exe config CertPropSvc start= disabled
sc.exe stop CertPropSvc
sc.exe config PrintNotify start= disabled
sc.exe stop PrintNotify
sc.exe config Eaphost start= disabled
sc.exe stop Eaphost
sc.exe config TroubleshootingSvc start= disabled
sc.exe stop TroubleshootingSvc
sc.exe config WpcMonSvc start= disabled
sc.exe stop WpcMonSvc
sc.exe config Wecsvc start= disabled
sc.exe stop Wecsvc
sc.exe config MSiSCSI start= disabled
sc.exe stop MSiSCSI
sc.exe config XboxNetApiSvc start= disabled
sc.exe stop XboxNetApiSvc
sc.exe config perceptionsimulation start= disabled
sc.exe stop perceptionsimulation
sc.exe config AssignedAccessManagerSvc start= disabled
sc.exe stop AssignedAccessManagerSvc
sc.exe config PushToInstall start= disabled
sc.exe stop PushToInstall
sc.exe config vmicvss start= disabled
sc.exe stop vmicvss
sc.exe config UevAgentService start= disabled
sc.exe stop UevAgentService
sc.exe config vmicshutdown start= disabled
sc.exe stop vmicshutdown
sc.exe config vmicrdv start= disabled
sc.exe stop vmicrdv
sc.exe config RetailDemo start= disabled
sc.exe stop RetailDemo
sc.exe config spectrum start= disabled
sc.exe stop spectrum
sc.exe config SensorService start= disabled
sc.exe stop SensorService
sc.exe config lfsvc start= disabled
sc.exe stop lfsvc
sc.exe config SensorDataService start= disabled
sc.exe stop SensorDataService
sc.exe config stisvc start= disabled
sc.exe stop stisvc
sc.exe config VacSvc start= disabled
sc.exe stop VacSvc
sc.exe delete dmwappushservice
sc.exe config WalletService start= disabled
sc.exe stop WalletService
sc.exe config PimIndexMaintenanceSvc start= disabled
sc.exe stop PimIndexMaintenanceSvc
sc.exe config ScDeviceEnum start= disabled
sc.exe stop ScDeviceEnum
sc.exe config wbengine start= disabled
sc.exe stop wbengine
sc.exe config irmon start= disabled
sc.exe stop irmon
sc.exe config SensrSvc start= disabled
sc.exe stop SensrSvc
sc.exe config WMPNetworkSvc start= disabled
sc.exe stop WMPNetworkSvc
sc.exe config vmickvpexchange start= disabled
sc.exe stop vmickvpexchange
sc.exe delete CDPSvc
sc.exe config wisvc start= disabled
sc.exe stop wisvc
sc.exe config SharedRealitySvc start= disabled
sc.exe stop SharedRealitySvc
sc.exe config WerSvc start= disabled
sc.exe stop WerSvc
sc.exe config vmicheartbeat start= disabled
sc.exe stop vmicheartbeat
sc.exe config vmictimesync start= disabled
sc.exe stop vmictimesync
sc.exe config TabletInputService start= disabled
sc.exe stop TabletInputService
sc.exe config SENS start= disabled
sc.exe stop SENS
sc.exe config WinRM start= disabled
sc.exe stop WinRM
sc.exe config WpnService start= disabled
sc.exe stop WpnService
sc.exe config EntAppSvc start= disabled
sc.exe stop EntAppSvc
sc.exe config HvHost start= disabled
sc.exe stop HvHost
sc.exe config SCardSvr start= disabled
sc.exe stop SCardSvr
sc.exe config TermService start= disabled
sc.exe stop TermService
sc.exe config WiaRpc start= disabled
sc.exe stop WiaRpc
sc.exe config XblGameSave start= disabled
sc.exe stop XblGameSave
sc.exe config TapiSrv start= disabled
sc.exe stop TapiSrv
sc.exe config PhoneSvc start= disabled
sc.exe stop PhoneSvc
sc.exe config diagnosticshub.standardcollector.service start= disabled
sc.exe stop diagnosticshub.standardcollector.service
sc.exe config WdiServiceHost start= disabled
sc.exe stop WdiServiceHost
sc.exe config RemoteRegistry start= disabled
sc.exe stop RemoteRegistry
sc.exe config WdiSystemHost start= disabled
sc.exe stop WdiSystemHost
sc.exe config AppMgmt start= disabled
sc.exe stop AppMgmt
sc.exe delete DiagTrack
sc.exe config MsKeyboardFilter start= disabled
sc.exe stop MsKeyboardFilter
sc.exe delete diagsvc
sc.exe delete ssh-agent
sc.exe config MixedRealityOpenXRSvc start= disabled
sc.exe stop MixedRealityOpenXRSvc
sc.exe config XboxGipSvc start= disabled
sc.exe stop XboxGipSvc
# 1. For-циклы заменены на PS
"AarSvc","MessagingService","P9RdrService","PenService","PrintWorkflowUserSvc" | ForEach-Object {
    $n = $_
    Get-ChildItem "HKLM:\SYSTEM\CurrentControlSet\Services" |
        Where-Object { $_.PSChildName -like "*$n*" } |
        ForEach-Object {
            Set-ItemProperty -Path $_.PSPath -Name Start -Value 4 -Type DWord
            Write-Host "OK: $($_.PSChildName)"
        }
}

# 2. EntAppSvc
sc.exe config EntAppSvc start= disabled

# 3. SSDPSRV — сначала зависимые
sc.exe stop upnphost
sc.exe stop SSDPSRV

# 4. Задачи планировщика
schtasks /delete /tn 'Microsoft\Windows\Customer Experience Improvement Program\Consolidator' /f
schtasks /delete /tn 'Microsoft\Windows\Customer Experience Improvement Program\UsbCeip' /f
schtasks /delete /tn 'Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser' /f
schtasks /delete /tn 'Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp' /f
schtasks /delete /tn 'Microsoft\Windows\Application Experience\StartupAppTask' /f
schtasks /delete /tn 'Microsoft\Windows\Windows Error Reporting\QueueReporting' /f
