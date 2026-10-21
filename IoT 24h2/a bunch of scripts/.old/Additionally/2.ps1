# Пример: Отключение Superfetch (SysMain) и диагностики
Stop-Service "SysMain" -Force
Set-Service "SysMain" -StartupType Disabled
Stop-Service "DiagTrack" -Force
Set-Service "DiagTrack" -StartupType Disabled

powercfg -setacvalueindex SCHEME_BALANCED SUB_PROCESSOR PERFBOOSTMODE 0
powercfg -setactive SCHEME_BALANCED

Get-AppxPackage *Bing* | Remove-AppxPackage
Get-AppxPackage *Xbox* | Remove-AppxPackage

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
"IoPageLockLimit"=dword:00010000

[HKEY_CURRENT_USER\Control Panel\Desktop]
"MenuShowDelay"="10"
"WaitToKillAppTimeout"="2000"

# Установка низкого приоритета для всех фоновых процессов
Get-Process | Where-Object { $_.PriorityClass -ne "Idle" } | ForEach-Object { $_.PriorityClass = "Idle" }

# Список служб для отключения (осторожно!)
$services = @(
    "SysMain",          # Superfetch
    "DiagTrack",        # Телеметрия
    "WSearch",          # Поиск Windows
    "BITS",             # Фоновые загрузки
    "WMPNetworkSvc"     # Служба Windows Media
)

foreach ($service in $services) {
    Stop-Service $service -Force
    Set-Service $service -StartupType Disabled
}

[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile]
"NetworkThrottlingIndex"=dword:ffffffff
"SystemResponsiveness"=dword:00000000

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
"Win32PrioritySeparation"=dword:00000026

Get-AppxPackage -AllUsers | Remove-AppxPackage

bcdedit /set {current} bootmenupolicy legacy


