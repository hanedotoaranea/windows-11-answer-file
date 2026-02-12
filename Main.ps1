#ДЛЯ АДМИНИСТРАТОРА (System Context)
#1. СЕТЕВЫЕ НАСТРОЙКИ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d ffffffff /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f

#2. СИСТЕМНЫЕ ПОЛИТИКИ
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

#3. СЛУЖБЫ (SERVICES)
sc.exe config DiagTrack start= disabled
sc.exe stop DiagTrack 
sc.exe config NPSMSvc_237c2c start= disabled
sc.exe stop NPSMSvc_237c2c
sc.exe config SSDPSRV start= disabled
sc.exe stop SSDPSRV
sc.exe config whesvc start= disabled
sc.exe stop whesvc
sc.exe config WSAFabricSvc start= disabled
sc.exe stop WSAFabricSvc
sc.exe config spooler start= disabled
sc.exe stop spooler
sc.exe config bthserv start= disabled
sc.exe stop bthserv
sc.exe config fax start= disabled
sc.exe stop fax
sc.exe config XblAuthManager start= disabled
sc.exe stop XblAuthManager
sc.exe config XblGameSave start= disabled
sc.exe stop XblGameSave
sc.exe config XboxNetApiSvc start= disabled
sc.exe stop XboxNetApiSvc
sc.exe config RemoteRegistry start= disabled
sc.exe stop RemoteRegistry
sc.exe config AJRouter start= disabled
sc.exe stop AJRouter
sc.exe config NetTcpPortSharing start= disabled
sc.exe stop NetTcpPortSharing
sc.exe config WiaRpc start= disabled
sc.exe stop WiaRpc
sc.exe config BDESVC start= disabled
sc.exe stop BDESVC
sc.exe config SCardSvr start= disabled
sc.exe stop SCardSvr
sc.exe config WpcMonSvc start= disabled
sc.exe stop WpcMonSvc
sc.exe config HvHost start= disabled
sc.exe stop HvHost
sc.exe config Browser start= disabled
sc.exe stop Browser
sc.exe config WMPNetworkSvc start= disabled
sc.exe stop WMPNetworkSvc
sc.exe config SensorDataService start= disabled
sc.exe stop SensorDataService
sc.exe config SensrSvc start= disabled
sc.exe stop SensrSvc
sc.exe config RmSvc start= disabled
sc.exe stop RmSvc
sc.exe config SstpSvc start= disabled
sc.exe stop SstpSvc
sc.exe config lmhosts start= disabled
sc.exe stop lmhosts

#4. СИСТЕМНЫЕ НАСТРОЙКИ
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "2000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f
fsutil behavior set DisableDeleteNotify 0
bcdedit /set {current} bootmenupolicy legacy

#5. ЗАДАНИЯ ПЛАНИРОВЩИКА
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /f
schtasks /delete /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp" /f
schtasks /delete /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /f
schtasks /delete /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /f

#6. ТЕЛЕМЕТРИЯ И СЛЕЖКА
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

#7. УДАЛЕНИЕ ПРИЛОЖЕНИЙ
Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *windowsphone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *xboxapp* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage -AllUsers *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Bing* | Remove-AppxPackage -ErrorAction SilentlyContinue
Get-AppxPackage *Xbox* | Remove-AppxPackage -ErrorAction SilentlyContinue

#ДЛЯ ПОЛЬЗОВАТЕЛЯ (User Context)
#1. КОНФИДЕНЦИАЛЬНОСТЬ - ДОСТУП ПРИЛОЖЕНИЙ
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

#2. НАСТРОЙКИ ИНТЕРФЕЙСА
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d b012038010000000 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f

sc.exe config ALG start= disabled; sc.exe stop ALG
sc.exe config ApxSvc start= disabled; sc.exe stop ApxSvc
sc.exe config autotimesvc start= disabled; sc.exe stop autotimesvc
sc.exe config AxInstSV start= disabled; sc.exe stop AxInstSV
sc.exe config brave start= disabled; sc.exe stop brave
sc.exe config bravem start= disabled; sc.exe stop bravem
sc.exe config BTAGService start= disabled; sc.exe stop BTAGService
sc.exe config BthAvctpSvc start= disabled; sc.exe stop BthAvctpSvc
sc.exe config bthserv start= disabled; sc.exe stop bthserv
sc.exe config DiagTrack start= disabled; sc.exe stop DiagTrack
sc.exe config edgeupdate start= disabled; sc.exe stop edgeupdate
sc.exe config edgeupdatem start= disabled; sc.exe stop edgeupdatem
sc.exe config EFS start= disabled; sc.exe stop EFS
sc.exe config fhsvc start= disabled; sc.exe stop fhsvc
sc.exe config FrameServer start= disabled; sc.exe stop FrameServer
sc.exe config FrameServerMonitor start= disabled; sc.exe stop FrameServerMonitor
sc.exe config GameInputSvc start= disabled; sc.exe stop GameInputSvc
sc.exe config icssvc start= disabled; sc.exe stop icssvc
sc.exe config InventorySvc start= disabled; sc.exe stop InventorySvc
sc.exe config ipfsvc start= disabled; sc.exe stop ipfsvc
sc.exe config lltdsvc start= disabled; sc.exe stop lltdsvc
sc.exe config LxpSvc start= disabled; sc.exe stop LxpSvc
sc.exe config MapsBroker start= disabled; sc.exe stop MapsBroker
sc.exe config McpManagementService start= disabled; sc.exe stop McpManagementService
sc.exe config MSiSCSI start= disabled; sc.exe stop MSiSCSI
sc.exe config NcaSvc start= disabled; sc.exe stop NcaSvc
sc.exe config NetTcpPortSharing start= disabled; sc.exe stop NetTcpPortSharing
sc.exe config PcaSvc start= disabled; sc.exe stop PcaSvc
sc.exe config PhoneSvc start= disabled; sc.exe stop PhoneSvc
sc.exe config PrintDeviceConfigurationService start= disabled; sc.exe stop PrintDeviceConfigurationService
sc.exe config PrintNotify start= disabled; sc.exe stop PrintNotify
sc.exe config PrintScanBrokerService start= disabled; sc.exe stop PrintScanBrokerService
sc.exe config RasAuto start= disabled; sc.exe stop RasAuto
sc.exe config refsdedupsvc start= disabled; sc.exe stop refsdedupsvc
sc.exe config RemoteAccess start= disabled; sc.exe stop RemoteAccess
sc.exe config RemoteRegistry start= disabled; sc.exe stop RemoteRegistry
sc.exe config RetailDemo start= disabled; sc.exe stop RetailDemo
sc.exe config RmSvc start= disabled; sc.exe stop RmSvc
sc.exe config SCardSvr start= disabled; sc.exe stop SCardSvr
sc.exe config ScDeviceEnum start= disabled; sc.exe stop ScDeviceEnum
sc.exe config SCPolicySvc start= disabled; sc.exe stop SCPolicySvc
sc.exe config SEMgrSvc start= disabled; sc.exe stop SEMgrSvc
sc.exe config SensorDataService start= disabled; sc.exe stop SensorDataService
sc.exe config SensrSvc start= disabled; sc.exe stop SensrSvc
sc.exe config shpamsvc start= disabled; sc.exe stop shpamsvc
sc.exe config smphost start= disabled; sc.exe stop smphost
sc.exe config SmsRouter start= disabled; sc.exe stop SmsRouter
sc.exe config SNMPTrap start= disabled; sc.exe stop SNMPTrap
sc.exe config ssh-agent start= disabled; sc.exe stop ssh-agent
sc.exe config SstpSvc start= disabled; sc.exe stop SstpSvc
sc.exe config svsvc start= disabled; sc.exe stop svsvc
sc.exe config TroubleshootingSvc start= disabled; sc.exe stop TroubleshootingSvc
sc.exe config tzautoupdate start= disabled; sc.exe stop tzautoupdate
sc.exe config vmicguestinterface start= disabled; sc.exe stop vmicguestinterface
sc.exe config vmicheartbeat start= disabled; sc.exe stop vmicheartbeat
sc.exe config vmickvpexchange start= disabled; sc.exe stop vmickvpexchange
sc.exe config vmicrdv start= disabled; sc.exe stop vmicrdv
sc.exe config vmicshutdown start= disabled; sc.exe stop vmicshutdown
sc.exe config vmictimesync start= disabled; sc.exe stop vmictimesync
sc.exe config vmicvmsession start= disabled; sc.exe stop vmicvmsession
sc.exe config vmicvss start= disabled; sc.exe stop vmicvss
sc.exe config WalletService start= disabled; sc.exe stop WalletService
sc.exe config WarpJITSvc start= disabled; sc.exe stop WarpJITSvc
sc.exe config wcncsvc start= disabled; sc.exe stop wcncsvc
sc.exe config Wecsvc start= disabled; sc.exe stop Wecsvc
sc.exe config wercplsupport start= disabled; sc.exe stop wercplsupport
sc.exe config WFDSConMgrSvc start= disabled; sc.exe stop WFDSConMgrSvc
sc.exe config wisvc start= disabled; sc.exe stop wisvc
sc.exe config WpcMonSvc start= disabled; sc.exe stop WpcMonSvc
sc.exe config WSAIFabricSvc start= disabled; sc.exe stop WSAIFabricSvc
sc.exe config XblAuthManager start= disabled; sc.exe stop XblAuthManager
sc.exe config XblGameSave start= disabled; sc.exe stop XblGameSave
sc.exe config XboxGipSvc start= disabled; sc.exe stop XboxGipSvc
sc.exe config XboxNetApiSvc start= disabled; sc.exe stop XboxNetApiSvc



