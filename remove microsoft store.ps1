Get-AppxPackage -AllUsers *StorePurchaseApp | Remove-AppxPackage
Get-AppxPackage -AllUsers *Store | Remove-AppxPackage
//////
//////
//////
Get-AppxPackage *windowsstore* -AllUsers | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppxManifest.xml"}
