Get-AppxPackage -AllUsers *StorePurchaseApp | Remove-AppxPackage
Get-AppxPackage -AllUsers *Store | Remove-AppxPackage
Get-AppxPackage -AllUsers *Windows.DevHome* | Remove-AppxPackage
Get-AppxPackage -AllUsers *windowsphone* | Remove-AppxPackage
Get-AppxPackage -AllUsers *xboxapp* | Remove-AppxPackage
Get-AppxPackage *Microsoft.YourPhone* | Remove-AppxPackage

