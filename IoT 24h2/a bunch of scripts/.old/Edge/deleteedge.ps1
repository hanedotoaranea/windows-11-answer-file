# Завершить ВСЕ процессы Edge
Get-Process -Name "*edge*" -ErrorAction SilentlyContinue | Stop-Process -Force -Verbose

# Дополнительно завершить связанные процессы
Get-Process -Name "*msedge*", "*edge*", "*MicrosoftEdge*" -ErrorAction SilentlyContinue | Stop-Process -Force
# Теперь удаляем пакеты
$edgePackages = Get-AppxPackage -AllUsers | Where-Object {
    $_.Name -like "*Edge*" -and 
    $_.Name -notlike "*WebExperience*" -and
    $_.Name -notlike "*WebView*"
}

# Принудительное завершение через taskkill
taskkill /f /im msedge.exe /t
taskkill /f /im MicrosoftEdge.exe /t
taskkill /f /im edge.exe /t

# Через PowerShell альтернативно
Stop-Process -Name "msedge" -Force -ErrorAction SilentlyContinue

$edgePackages | ForEach-Object {
    Write-Host "Удаляем: $($_.PackageFullName)"
    Remove-AppxPackage -Package $_.PackageFullName -AllUsers -Verbose
}
# Временно отключить службу Edge Update
Stop-Service -Name "EdgeUpdate" -Force -ErrorAction SilentlyContinue
Set-Service -Name "EdgeUpdate" -StartupType Manual -ErrorAction SilentlyContinue

cd "C:\Program Files (x86)\Microsoft"
Remove-Item -Path "Edge" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeCore" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeUpdate" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeWebView" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "Temp" -Recurse -Force -ErrorAction SilentlyContinue
# Удалить файлы Edge (после завершения процессов)
Remove-Item -Path "C:\Program Files (x86)\Microsoft\Edge" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "$env:LOCALAPPDATA\Microsoft\Edge" -Recurse -Force -ErrorAction SilentlyContinue

# 1. СНОСИМ EDGE ПОД КОРЕНЬ
Write-Host "--- УДАЛЕНИЕ MICROSOFT EDGE ---" -ForegroundColor Red
$edgeProcs = "msedge", "MicrosoftEdge", "edge", "EdgeUpdate"
foreach ($proc in $edgeProcs) {
    Get-Process -Name $proc -ErrorAction SilentlyContinue | Stop-Process -Force
}
taskkill /f /im msedge.exe /t /fi "status eq running" 2>$null

# Удаляем Appx пакеты (кроме WebView2, чтобы не сдох Discord/Telegram)
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*Edge*" -and $_.Name -notlike "*WebView*"} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

# Чистим папки (Забираем права у системы через takeown)
$edgePaths = @(
    "C:\Program Files (x86)\Microsoft\Edge",
    "C:\Program Files (x86)\Microsoft\EdgeCore",
    "C:\Program Files (x86)\Microsoft\EdgeUpdate",
    "$env:LOCALAPPDATA\Microsoft\Edge"
)
foreach ($path in $edgePaths) {
    if (Test-Path $path) {
        takeown /f $path /r /d y >$null
        icacls $path /grant administrators:F /t >$null
        Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
        Write-Host "Удалено: $path" -ForegroundColor Yellow
    }
}

# 2. ВЫРУБАЕМ ВСЕ СЛУЖБЫ (Твой полный список + мои правки)
Write-Host "--- ОТКЛЮЧЕНИЕ СЛУЖБ ---" -ForegroundColor Red
$allServices = @(
    "spooler", "bthserv", "SSDPSRV", "lmhosts",
    "DiagTrack", "XblAuthManager", "XblGameSave", "XboxNetApiSvc", 
    "RemoteRegistry", "Fax", "AJRouter", "NetTcpPortSharing", "BDESVC", 
    "SCardSvr", "WpcMonSvc", "HvHost", "Browser", "WMPNetworkSvc", "SstpSvc"
)

foreach ($svc in $allServices) {
    if (Get-Service -Name $svc -ErrorAction SilentlyContinue) {
        Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
        Set-Service -Name $svc -StartupType Disabled
        Write-Host "Отключено: $svc" -ForegroundColor Gray
    }
}

Write-Host "--- ГОТОВО. СИСТЕМА ЗАЧИЩЕНА. ПЕРЕЗАГРУЗИСЬ ---" -ForegroundColor Magenta
