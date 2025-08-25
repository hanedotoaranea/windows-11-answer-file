cd "C:\Program Files (x86)\Microsoft"
Remove-Item -Path "Edge" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeCore" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeUpdate" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "EdgeWebView" -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -Path "Temp" -Recurse -Force -ErrorAction SilentlyContinue

# Найти точное имя пакета Edge
Get-WindowsPackage -Online | Where-Object {$_.PackageName -like "*Edge*"} | Format-List PackageName

# Удалить (пример)
DISM /Online /Remove-Package /PackageName:Microsoft-Windows-Edge-Browser-Package~31bf3856ad364e35~amd64~~10.0.19041.1266 /NoRestart
