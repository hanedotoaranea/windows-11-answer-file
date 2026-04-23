<#
.SYNOPSIS
Windows Privacy Hardening Script
.DESCRIPTION
Disables telemetry, removes bloatware, and configures privacy settings for Windows 10/11
#>

# Requires admin rights
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges. Please run as admin." -ForegroundColor Red
    exit
}

# Disable Windows Recall feature (if present)
try {
    Write-Host "Disabling Recall feature..."
    DISM /Online /Disable-Feature /Featurename:Recall /NoRestart
    DISM /Online /Get-Featureinfo /Featurename:Recall
} catch {
    Write-Warning "Recall feature modification failed (may not be present on this system)"
}

# Remove unwanted UWP apps
$appsToRemove = @(
    "*StorePurchaseApp*",
    "*Store*",
    "*Windows.DevHome*",
    "*windowsphone*",
    "*xboxapp*",
    "*Microsoft.YourPhone*"
)

Write-Host "Removing bloatware apps..."
foreach ($app in $appsToRemove) {
    try {
        Get-AppxPackage -AllUsers $app | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxPackage $app | Remove-AppxPackage -ErrorAction SilentlyContinue
    } catch {
        Write-Warning "Failed to remove $app"
    }
}

# Registry settings configuration
function Set-RegistryValue {
    param($path, $name, $value, $type)
    if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
    Set-ItemProperty -Path $path -Name $name -Value $value -Type $type -Force
}

Write-Host "Configuring registry settings..."

# Windows Update settings
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" "NoAutoUpdate" 1 "DWord"

# Telemetry and data collection
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "DoNotShowFeedbackNotifications" 1 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" "TailoredExperiencesWithDiagnosticDataEnabled" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" "ShowedToastAtLevel" 0 "DWord"

# Content delivery
Set-RegistryValue "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338388Enabled" 0 "DWord"
Set-RegistryValue "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" "SubscribedContent-338393Enabled" 0 "DWord"

# Speech and input
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" "HasAccepted" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\InputPersonalization" "RestrictImplicitInkCollection" 1 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\InputPersonalization" "RestrictImplicitTextCollection" 1 "DWord"

# Activity history
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "PublishUserActivities" 0 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" "UploadUserActivities" 0 "DWord"

# Sensor permissions
Set-RegistryValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" "SensorPermissionState" 0 "DWord"

# Search settings
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings" "IsDeviceSearchHistoryEnabled" 0 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "PreventIndexingCertainFiles" 1 "DWord"

# Explorer settings
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "ShowRecent" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "ShowFrequent" 0 "DWord"

# Performance tweaks
Set-RegistryValue "HKCU:\Control Panel\Desktop" "MenuShowDelay" "50" "String"
Set-RegistryValue "HKCU:\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" "(Default)" "" "String"


# Application permissions to deny
$appPermissions = @(
    "microphone", "voiceActivation", "userDataTasks", "location", "webcam",
    "userAccountInformation", "contacts", "appointments", "phoneCall", "email",
    "chat", "radios", "bluetoothSync", "appDiagnostics", "documentsLibrary",
    "picturesLibrary", "videosLibrary", "broadFileSystemAccess"
)

Write-Host "Configuring application permissions..."
foreach ($permission in $appPermissions) {
    $path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$permission"
    Set-RegistryValue $path "Value" "Deny" "String"
}

# Background apps
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" "GlobalUserDisabled" 1 "DWord"

# Push notifications
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\PushNotifications" "ToastEnabled" 0 "DWord"

Write-Host "Configuration complete. Some changes may require a reboot to take effect." -ForegroundColor Green
