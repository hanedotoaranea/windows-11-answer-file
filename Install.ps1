# ============================================
# SYSTEM CONTEXT — выполняется от имени системы
# ============================================

# 1. СЕТЕВЫЕ НАСТРОЙКИ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d ffffffff /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f

# 2. СИСТЕМНЫЕ ПОЛИТИКИ
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
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f

# 3. СЛУЖБЫ (SERVICES) — ОСНОВНОЙ БЛОК
sc config DiagTrack start= disabled
sc stop DiagTrack 
sc config NPSMSvc_237c2c start= disabled
sc stop NPSMSvc_237c2c
sc config SSDPSRV start= disabled
sc stop SSDPSRV
sc config whesvc start= disabled
sc stop whesvc
sc config WSAFabricSvc start= disabled
sc stop WSAFabricSvc
sc config spooler start= disabled
sc stop spooler
sc config bthserv start= disabled
sc stop bthserv
sc config fax start= disabled
sc stop fax
sc config XblAuthManager start= disabled
sc stop XblAuthManager
sc config XblGameSave start= disabled
sc stop XblGameSave
sc config XboxNetApiSvc start= disabled
sc stop XboxNetApiSvc
sc config RemoteRegistry start= disabled
sc stop RemoteRegistry
sc config AJRouter start= disabled
sc stop AJRouter
sc config NetTcpPortSharing start= disabled
sc stop NetTcpPortSharing
sc config BDESVC start= disabled
sc stop BDESVC
sc config SCardSvr start= disabled
sc stop SCardSvr
sc config WpcMonSvc start= disabled
sc stop WpcMonSvc
sc config HvHost start= disabled
sc stop HvHost
sc config Browser start= disabled
sc stop Browser
sc config WMPNetworkSvc start= disabled
sc stop WMPNetworkSvc
sc config RmSvc start= disabled
sc stop RmSvc
sc config SstpSvc start= disabled
sc stop SstpSvc
sc config lmhosts start= disabled
sc stop lmhosts

# 4. ДОПОЛНИТЕЛЬНЫЕ СЛУЖБЫ
sc config edgeupdate start= disabled & sc stop edgeupdate
sc config edgeupdatem start= disabled & sc stop edgeupdatem
sc config fhsvc start= disabled & sc stop fhsvc
sc config GameInputSvc start= disabled & sc stop GameInputSvc
sc config icssvc start= disabled & sc stop icssvc
sc config InventorySvc start= disabled & sc stop InventorySvc
sc config ipfsvc start= disabled & sc stop ipfsvc
sc config lltdsvc start= disabled & sc stop lltdsvc
sc config LxpSvc start= disabled & sc stop LxpSvc
sc config McpManagementService start= disabled & sc stop McpManagementService
sc config MSiSCSI start= disabled & sc stop MSiSCSI
sc config NcaSvc start= disabled & sc stop NcaSvc
sc config PrintDeviceConfigurationService start= disabled & sc stop PrintDeviceConfigurationService
sc config PrintNotify start= disabled & sc stop PrintNotify
sc config PrintScanBrokerService start= disabled & sc stop PrintScanBrokerService
sc config RasAuto start= disabled & sc stop RasAuto
sc config refsdedupsvc start= disabled & sc stop refsdedupsvc
sc config RemoteAccess start= disabled & sc stop RemoteAccess
sc config RetailDemo start= disabled & sc stop RetailDemo
sc config ScDeviceEnum start= disabled & sc stop ScDeviceEnum
sc config SCPolicySvc start= disabled & sc stop SCPolicySvc
sc config SEMgrSvc start= disabled & sc stop SEMgrSvc
sc config shpamsvc start= disabled & sc stop shpamsvc
sc config smphost start= disabled & sc stop smphost
sc config SNMPTrap start= disabled & sc stop SNMPTrap
sc config ssh-agent start= disabled & sc stop ssh-agent
sc config svsvc start= disabled & sc stop svsvc
sc config vmicguestinterface start= disabled & sc stop vmicguestinterface
sc config vmicheartbeat start= disabled & sc stop vmicheartbeat
sc config vmickvpexchange start= disabled & sc stop vmickvpexchange
sc config vmicrdv start= disabled & sc stop vmicrdv
sc config vmicshutdown start= disabled & sc stop vmicshutdown
sc config vmictimesync start= disabled & sc stop vmictimesync
sc config vmicvmsession start= disabled & sc stop vmicvmsession
sc config vmicvss start= disabled & sc stop vmicvss
sc config WarpJITSvc start= disabled & sc stop WarpJITSvc
sc config Wecsvc start= disabled & sc stop Wecsvc
sc config wercplsupport start= disabled & sc stop wercplsupport
sc config WFDSConMgrSvc start= disabled & sc stop WFDSConMgrSvc
sc config WSAIFabricSvc start= disabled & sc stop WSAIFabricSvc
sc config XboxGipSvc start= disabled & sc stop XboxGipSvc

# 5. СИСТЕМНЫЕ НАСТРОЙКИ
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "2000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
fsutil behavior set DisableDeleteNotify 0
bcdedit /set {current} bootmenupolicy legacy

# 6. ЗАДАНИЯ ПЛАНИРОВЩИКА
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f

# 7. УДАЛЕНИЕ ПРИЛОЖЕНИЙ (БЕЗОПАСНОЕ)
Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *xboxapp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue


# ============================================
# USER CONTEXT — выполняется при входе пользователя
# ============================================

# 1. ТЕЛЕМЕТРИЯ И КОНФИДЕНЦИАЛЬНОСТЬ
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Personalization\Settings" /v AcceptedPrivacyPolicy /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v HasAccepted /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v ShowedToastAtLevel /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338388Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v SubscribedContent-338393Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v IsDeviceSearchHistoryEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v GlobalUserDisabled /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitInkCollection /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ActivityFeed" /v EnableActivityFeed /t REG_DWORD /d 0 /f

# 2. ДОСТУП ПРИЛОЖЕНИЙ (ВСЕ DENY)
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

# 3. НАСТРОЙКИ ИНТЕРФЕЙСА
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f

# 4. ПЛАНИРОВЩИК (ПОЛЬЗОВАТЕЛЬСКИЕ ЗАДАЧИ)
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable 2>$null
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable 2>$null







