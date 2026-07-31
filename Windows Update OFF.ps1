sc.exe config wuauserv start= disabled
sc.exe stop wuauserv
Set-Service -Name wuauserv -StartupType Disabled
Stop-Service -Name wuauserv -Force
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
sc.exe config wuauserv start= disabled && sc.exe stop wuauserv && reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" /v NoAutoUpdate /t REG_DWORD /d 1 /f
