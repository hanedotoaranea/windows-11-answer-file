<#
.SYNOPSIS
Windows Optimization Script
.DESCRIPTION
Disables telemetry, removes bloatware, optimizes services, and configures privacy settings
#>

# Requires admin rights
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges. Please run as admin." -ForegroundColor Red
    exit
}

function Disable-ScheduledTask {
    param($taskName)
    try {
        if (Get-ScheduledTask -TaskName $taskName -ErrorAction SilentlyContinue) {
            Disable-ScheduledTask -TaskName $taskName
            Write-Host "Disabled task: $taskName"
        }
    } catch {
        Write-Warning "Failed to disable task: $taskName"
    }
}

function Disable-WindowsService {
    param($serviceName)
    try {
        $service = Get-Service -Name $serviceName -ErrorAction SilentlyContinue
        if ($service) {
            if ($service.Status -eq 'Running') {
                Stop-Service -Name $serviceName -Force
            }
            Set-Service -Name $serviceName -StartupType Disabled
            Write-Host "Disabled service: $serviceName"
        }
    } catch {
        Write-Warning "Failed to disable service: $serviceName"
    }
}

function Set-RegistryValue {
    param($path, $name, $value, $type)
    try {
        if (-not (Test-Path $path)) { New-Item -Path $path -Force | Out-Null }
        Set-ItemProperty -Path $path -Name $name -Value $value -Type $type -Force
    } catch {
        Write-Warning "Failed to set registry value: $path\$name"
    }
}

# Remove scheduled tasks
Write-Host "Disabling telemetry-related scheduled tasks..."
$telemetryTasks = @(
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
    "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask",
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip",
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
    "\Microsoft\Windows\Application Experience\ProgramDataUpdater",
    "\Microsoft\Windows\Autochk\Proxy",
    "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
)

foreach ($task in $telemetryTasks) {
    Disable-ScheduledTask -taskName $task
}

# Disable unnecessary services
Write-Host "Disabling unnecessary services..."
$servicesToDisable = @(
    "spooler", "bthserv", "fax", "XblAuthManager", "XblGameSave", 
    "XboxNetApiSvc", "lfsvc", "RemoteRegistry", "AJRouter", 
    "NetTcpPortSharing", "WiaRpc", "BDESVC", "TabletInputService", 
    "TouchKeyboardAndHandwritingPanelService", "WSearch", "SCardSvr", 
    "WpcMonSvc", "HvHost", "Browser", "WMPNetworkSvc", "DiagTrack", 
    "SensorDataService", "SensrSvc", "RasMan", "TrkWks", "LanmanServer", 
    "SstpSvc", "lmhosts", "RmSvc", "LanmanWorkstation", "SysMain"
)

foreach ($service in $servicesToDisable) {
    Disable-WindowsService -serviceName $service
}

# Performance registry tweaks
Write-Host "Applying performance registry tweaks..."
Set-RegistryValue "HKCU:\Control Panel\Desktop" "MenuShowDelay" "50" "String"
Set-RegistryValue "HKCU:\Control Panel\Desktop" "WaitToKillAppTimeout" "2000" "String"
Set-RegistryValue "HKCU:\Control Panel\Desktop" "HungAppTimeout" "1000" "String"
Set-RegistryValue "HKCU:\Control Panel\Desktop" "AutoEndTasks" "1" "String"
Set-RegistryValue "HKCU:\Control Panel\Desktop" "LowLevelHooksTimeout" "1000" "String"
Set-RegistryValue "HKLM:\SYSTEM\CurrentControlSet\Control" "WaitToKillServiceTimeout" "2000" "String"
Set-RegistryValue "HKLM:\SOFTWARE\Microsoft\Windows Search" "SetupCompletedSuccessfully" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "ExtendedUIHoverTime" 0 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" "AllowCortana" 0 "DWord"
Set-RegistryValue "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters" "DisabledComponents" 255 "DWord"
Set-RegistryValue "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "TcpWindowSize" 64240 "DWord"
Set-RegistryValue "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" "DefaultTTL" 64 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" "AllowGameDVR" 0 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" "SystemResponsiveness" 20 "DWord"
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer" "NoAutoplayfornonVolume" 1 "DWord"

# Privacy registry tweaks
Write-Host "Applying privacy registry tweaks..."
Set-RegistryValue "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" "AllowTelemetry" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" "Enabled" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" "TailoredExperiencesWithDiagnosticDataEnabled" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "ShowRecent" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" "ShowFrequent" 0 "DWord"
Set-RegistryValue "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\OperationStatusManager" "EnthusiastMode" 1 "DWord"

# Visual effects optimization
Write-Host "Optimizing visual effects..."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop\WindowMetrics" -Name "MinAnimate" -Value "0"
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "UserPreferencesMask" -Value ([byte[]](0x90, 0x12, 0x03, 0x80, 0x10, 0x00, 0x00, 0x00))

# Restart Explorer to apply visual changes
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Write-Host "Explorer restarted to apply visual changes"

# Final cleanup for services that need registry modification
$servicesWithRegistry = @(
    "Spooler", "RasMan", "TrkWks", "LanmanServer", "SstpSvc", 
    "lmhosts", "RmSvc", "lfsvc", "TabletInputService"
)

foreach ($service in $servicesWithRegistry) {
    Set-RegistryValue "HKLM:\SYSTEM\CurrentControlSet\Services\$service" "Start" 4 "DWord"
}

Write-Host "Optimization complete. Some changes may require a reboot to take full effect." -ForegroundColor Green