# Блокировка телеметрии через реестр
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f

# Отключение Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d 0 /f

# Отключение сбора данных диагностики
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "AITEnable" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat" /v "DisableInventory" /t REG_DWORD /d 1 /f

# Отключение отправки данных в Microsoft
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f

Write-Host "Телеметрия отключена!" -ForegroundColor Green

# Список ненужных служб (можно добавить свои)
$services = @(
    "DiagTrack",             # Diagnostics Tracking Service
    "dmwappushservice",      # WAP Push Message Routing Service
    "lfsvc",                 # Geolocation Service
    "MapsBroker",            # Downloaded Maps Manager
    "NetTcpPortSharing",     # Net.Tcp Port Sharing
    "RemoteRegistry",        # Remote Registry
    "TrkWks",                # Distributed Link Tracking Client
    "WSearch",               # Windows Search (если не нужен поиск)
    "XblAuthManager",        # Xbox Live Auth Manager
    "XblGameSave",           # Xbox Live Game Save
    "XboxNetApiSvc"          # Xbox Live Networking
)

foreach ($service in $services) {
    Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
    Set-Service -Name $service -StartupType Disabled -ErrorAction SilentlyContinue
    Write-Host "Служба $service отключена" -ForegroundColor Yellow
}

Write-Host "Ненужные службы отключены!" -ForegroundColor Green

# Список приложений для удаления (можно добавить свои)
$apps = @(
    "Microsoft.3DBuilder",
    "Microsoft.BingFinance",
    "Microsoft.BingNews",
    "Microsoft.BingSports",
    "Microsoft.BingWeather",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.Messaging",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.Office.OneNote",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

foreach ($app in $apps) {
    Get-AppxPackage -Name $app -AllUsers | Remove-AppxPackage -ErrorAction SilentlyContinue
    Get-AppxProvisionedPackage -Online | Where-Object DisplayName -Like $app | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue
    Write-Host "Приложение $app удалено" -ForegroundColor Yellow
}

Write-Host "Встроенные приложения удалены!" -ForegroundColor Green

sc config "WSearch" start= disabled
sc stop "WSearch"

cleanmgr /sagerun:1

fsutil behavior set DisableDeleteNotify 0
