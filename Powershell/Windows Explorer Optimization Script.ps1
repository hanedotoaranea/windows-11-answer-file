<#
.SYNOPSIS
Windows Optimization Script
.DESCRIPTION
Removes bloatware apps and applies performance/visual tweaks
#>

# Requires admin rights
if (-NOT ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "This script requires administrator privileges. Please run as admin." -ForegroundColor Red
    exit
}

function Remove-AppxBlotware {
    Write-Host "Removing bloatware apps..."
    $appsToRemove = @(
        "*StorePurchaseApp*",
        "*Store*",
        "*Windows.DevHome*",
        "*windowsphone*",
        "*xboxapp*"
    )

    foreach ($app in $appsToRemove) {
        try {
            Get-AppxPackage -AllUsers $app | Remove-AppxPackage -ErrorAction SilentlyContinue
            Write-Host "Removed: $app"
        } catch {
            Write-Warning "Failed to remove $app"
        }
    }
}

function Set-PerformanceTweaks {
    Write-Host "Applying performance registry tweaks..."
    
    # Desktop performance settings
    $desktopSettings = @{
        "MenuShowDelay" = "50"
        "HungAppTimeout" = "1000"
        "WaitToKillAppTimeout" = "2000"
        "AutoEndTasks" = "1"
        "LowLevelHooksTimeout" = "1000"
        "UserPreferencesMask" = [byte[]](0xb0,0x12,0x03,0x80,0x10,0x00,0x00,0x00)
    }

    foreach ($setting in $desktopSettings.GetEnumerator()) {
        try {
            if ($setting.Key -eq "UserPreferencesMask") {
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name $setting.Key -Value $setting.Value -Force
            } else {
                Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name $setting.Key -Value $setting.Value -Type String -Force
            }
            Write-Host "Set: $($setting.Key) = $($setting.Value)"
        } catch {
            Write-Warning "Failed to set $($setting.Key)"
        }
    }

    # Visual effects
    try {
        Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "EnableTransparency" -Value 0 -Type DWord -Force
        Write-Host "Disabled transparency effects"
    } catch {
        Write-Warning "Failed to disable transparency effects"
    }
}

function Restart-Explorer {
    Write-Host "Restarting Explorer to apply changes..."
    try {
        Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
        Write-Host "Explorer restarted successfully"
    } catch {
        Write-Warning "Failed to restart Explorer"
    }
}

# Execute all functions
Remove-AppxBlotware
Set-PerformanceTweaks
Restart-Explorer

Write-Host "Optimization complete!" -ForegroundColor Green
