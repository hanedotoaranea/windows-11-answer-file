reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f
reg add "HKCU\Control Panel\Desktop" /v MenuShowDelay /t REG_SZ /d "50" /f
reg add "HKCU\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d "2000" /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d "1" /f
reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d "1000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "2000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ExtendedUIHoverTime /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v AllowCortana /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" /v DisabledComponents /t REG_DWORD /d 255 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v TcpWindowSize /t REG_DWORD /d 64240 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 64 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer" /v NoAutoplayfornonVolume /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v Enabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowRecent /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v ShowFrequent /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" /v EnthusiastMode /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012038010000000 /f
sc stop SysMain
sc config SysMain start= disabled
sc stop spooler
sc config spooler start= disabled
sc stop bthserv
sc config bthserv start= disabled
sc stop fax
sc config fax start= disabled
sc stop XblAuthManager
sc config XblAuthManager start= disabled
sc stop XblGameSave
sc config XblGameSave start= disabled
sc stop XboxNetApiSvc
sc config XboxNetApiSvc start= disabled
sc stop lfsvc
sc config lfsvc start= disabled
sc stop RemoteRegistry
sc config RemoteRegistry start= disabled
sc stop AJRouter
sc config AJRouter start= disabled
sc stop NetTcpPortSharing
sc config NetTcpPortSharing start= disabled
sc stop WiaRpc
sc config WiaRpc start= disabled
sc stop BDESVC
sc config BDESVC start= disabled
sc stop TabletInputService
sc config TabletInputService start= disabled
sc stop TouchKeyboardAndHandwritingPanelService
sc config TouchKeyboardAndHandwritingPanelService start= disabled
sc stop WSearch
sc config WSearch start= disabled
sc stop SCardSvr
sc config SCardSvr start= disabled
sc stop WpcMonSvc
sc config WpcMonSvc start= disabled
sc stop HvHost
sc config HvHost start= disabled
sc stop Browser
sc config Browser start= disabled
sc stop WMPNetworkSvc
sc config WMPNetworkSvc start= disabled
sc stop DiagTrack
sc config DiagTrack start= disabled
sc stop SensorDataService
sc config SensorDataService start= disabled
sc stop SensrSvc
sc config SensrSvc start= disabled
sc stop RasMan
sc config RasMan start= disabled
sc stop TrkWks
sc config TrkWks start= disabled
sc stop LanmanServer
sc config LanmanServer start= disabled
sc stop SstpSvc
sc config SstpSvc start= disabled
sc stop lmhosts
sc config lmhosts start= disabled
sc stop RmSvc
sc config RmSvc start= disabled
sc stop LanmanWorkstation
sc config LanmanWorkstation start= disabled
sc stop 
sc config  start= disabled
sc stop 
sc config  start= disabled
sc stop 
sc config  start= disabled
sc stop 
sc config  start= disabled









