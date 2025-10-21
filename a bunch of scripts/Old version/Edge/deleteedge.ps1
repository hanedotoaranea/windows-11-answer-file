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
