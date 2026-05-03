# ============================================
# SYSTEM CONTEXT — выполняется от имени системы
# ============================================

# 1. СЕТЕВЫЕ НАСТРОЙКИ
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d -1 /f
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
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v Attributes /t REG_DWORD /d 2 /f

# 3. СЛУЖБЫ (SERVICES) — ОСНОВНОЙ БЛОК
sc.exe.exe config DiagTrack start= disabled
sc.exe stop DiagTrack 
sc.exe config NPSMSvc_237c2c start= disabled
sc.exe stop NPSMSvc_237c2c
sc.exe config SSDPSRV start= disabled
sc.exe stop SSDPSRV
sc.exe config whesvc start= disabled
sc.exe stop whesvc
sc.exe config WSAFabricSvc start= disabled
sc.exe stop WSAFabricSvc
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
sc.exe config HvHost start= disabled
sc.exe stop HvHost
sc.exe config Browser start= disabled
sc.exe stop Browser
sc.exe config WMPNetworkSvc start= disabled
sc.exe stop WMPNetworkSvc
sc.exe config lmhosts start= disabled
sc.exe stop lmhosts

# 4. ДОПОЛНИТЕЛЬНЫЕ СЛУЖБЫ
sc.exe config fhsvc start= disabled ; sc.exe stop fhsvc
sc.exe config icssvc start= disabled ; sc.exe stop icssvc
sc.exe config InventorySvc start= disabled ; sc.exe stop InventorySvc
sc.exe config lltdsvc start= disabled ; sc.exe stop lltdsvc
sc.exe config McpManagementService start= disabled ; sc.exe stop McpManagementService
sc.exe config MSiSCSI start= disabled ; sc.exe stop MSiSCSI
sc.exe config PrintDeviceConfigurationService start= disabled ; sc.exe stop PrintDeviceConfigurationService
sc.exe config refsdedupsvc start= disabled ; sc.exe stop refsdedupsvc
sc.exe config RemoteAccess start= disabled ; sc.exe stop RemoteAccess
sc.exe config RetailDemo start= disabled ; sc.exe stop RetailDemo
sc.exe config SCPolicySvc start= disabled ; sc.exe stop SCPolicySvc
sc.exe config SEMgrSvc start= disabled ; sc.exe stop SEMgrSvc
sc.exe config shpamsvc start= disabled ; sc.exe stop shpamsvc
sc.exe config smphost start= disabled ; sc.exe stop smphost
sc.exe config SNMPTrap start= disabled ; sc.exe stop SNMPTrap
sc.exe config svsvc start= disabled ; sc.exe stop svsvc
sc.exe config vmicguestinterface start= disabled ; sc.exe stop vmicguestinterface
sc.exe config vmicheartbeat start= disabled ; sc.exe stop vmicheartbeat
sc.exe config vmickvpexchange start= disabled ; sc.exe stop vmickvpexchange
sc.exe config vmicrdv start= disabled ; sc.exe stop vmicrdv
sc.exe config vmicshutdown start= disabled ; sc.exe stop vmicshutdown
sc.exe config vmictimesync start= disabled ; sc.exe stop vmictimesync
sc.exe config vmicvmsession start= disabled ; sc.exe stop vmicvmsession
sc.exe config vmicvss start= disabled ; sc.exe stop vmicvss
sc.exe config Wecsvc start= disabled ; sc.exe stop Wecsvc
sc.exe config wercplsupport start= disabled ; sc.exe stop wercplsupport
sc.exe config WFDSConMgrSvc start= disabled ; sc.exe stop WFDSConMgrSvc
sc.exe config WSAIFabricSvc start= disabled ; sc.exe stop WSAIFabricSvc
sc.exe config XboxGipSvc start= disabled ; sc.exe stop XboxGipSvc

# 5. СИСТЕМНЫЕ НАСТРОЙКИ
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "20000" /f
fsutil behavior set DisableDeleteNotify 0

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
REG DELETE "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 9999 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f

# 4. ПЛАНИРОВЩИК (ПОЛЬЗОВАТЕЛЬСКИЕ ЗАДАЧИ)
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable 2>$null
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable 2>$null







