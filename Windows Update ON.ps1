sc.exe config wuauserv start= manual
sc.exe start wuauserv
Set-Service -Name wuauserv -StartupType Manual
Start-Service -Name wuauserv
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f
sc.exe config wuauserv start= manual && sc.exe start wuauserv && reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /f
