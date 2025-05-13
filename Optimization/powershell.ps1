Get-AppxPackage -AllUsers *StorePurchaseApp | Remove-AppxPackage
Get-AppxPackage -AllUsers *Store | Remove-AppxPackage
Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage
Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v "NoAutoUpdate" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SubscribedContent-338388Enabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve
