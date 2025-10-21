@echo off
:: Windows Privacy Hardening Script (CMD version)
:: Requires Administrator privileges

:: Check admin rights
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo This script requires administrator privileges.
    echo Please right-click and select "Run as administrator".
    pause
    exit /b
)

echo Applying privacy and performance tweaks...

:: Disable Recall feature (if present)
echo Disabling Recall feature...
DISM /Online /Disable-Feature /Featurename:Recall /NoRestart
DISM /Online /Get-Featureinfo /Featurename:Recall

:: Remove bloatware apps
echo Removing bloatware apps...
for %%a in (
    "*StorePurchaseApp*"
    "*Store*"
    "*Windows.DevHome*"
    "*windowsphone*"
    "*xboxapp*"
    "*Microsoft.YourPhone*"
) do (
    powershell -command "Get-AppxPackage -AllUsers %%a | Remove-AppxPackage -ErrorAction SilentlyContinue"
    powershell -command "Get-AppxPackage %%a | Remove-AppxPackage -ErrorAction SilentlyContinue"
)

:: Windows Update settings
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f

:: Telemetry and data collection
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "DoNotShowFeedbackNotifications" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" /v "ShowedToastAtLevel" /t REG_DWORD /d 0 /f

:: Content delivery
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338393Enabled" /t REG_DWORD /d 0 /f

:: Speech and input
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v "HasAccepted" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitInkCollection" /t REG_DWORD /d 1 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v "RestrictImplicitTextCollection" /t REG_DWORD /d 1 /f

:: Activity history
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f

:: Sensor permissions
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f

:: Search settings
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" /v "IsDeviceSearchHistoryEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "PreventIndexingCertainFiles" /t REG_DWORD /d 1 /f

:: Explorer settings
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowRecent" /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "ShowFrequent" /t REG_DWORD /d 0 /f

:: Performance tweaks
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_SZ /d "50" /f
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /v "(Default)" /t REG_SZ /d "" /f

:: Application permissions
for %%a in (
    "microphone"
    "voiceActivation"
    "userDataTasks"
    "location"
    "webcam"
    "userAccountInformation"
    "contacts"
    "appointments"
    "phoneCall"
    "email"
    "chat"
    "radios"
    "bluetoothSync"
    "appDiagnostics"
    "documentsLibrary"
    "picturesLibrary"
    "videosLibrary"
    "broadFileSystemAccess"
) do (
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\%%a" /v "Value" /t REG_SZ /d "Deny" /f
)

:: Background apps
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d 1 /f

:: Push notifications
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" /v "ToastEnabled" /t REG_DWORD /d 0 /f

echo Configuration complete. Some changes may require a reboot to take effect.
pause
