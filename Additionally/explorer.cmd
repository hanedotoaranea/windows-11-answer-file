reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Streams\Defaults" /v "{F337BBA0-5BF7-47E0-BA5E-39E29912B148}" /t REG_BINARY /d "0c00000004000000010000000000000000777e137335cf11ae6908002b2e12620400000003000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "HideFileExt" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "Hidden" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AutoCheckSelect" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "UseCompactMode" /t REG_DWORD /d 1 /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 0 /f
taskkill /f /im explorer.exe & start explorer.exe