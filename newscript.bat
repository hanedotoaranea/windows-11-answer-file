
# 3. НАСТРОЙКИ ИНТЕРФЕЙСА
REG DELETE "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}" /f
reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f
reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 9999 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /
# 4. ПЛАНИРОВЩИК (ПОЛЬЗОВАТЕЛЬСКИЕ ЗАДАЧИ)
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents" /disable 2>$null
schtasks /change /tn "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic" /disable 2>$null
# Настройка времени отключения монитора в параметрах схемы электропитания
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v Attributes /t REG_DWORD /d 2 /f

sc.exe config AMD Crash Defender Service start= disabled
sc.exe stop AMD Crash Defender Service
sc.exe config AMD External Events Utility start= disabled
sc.exe stop AMD External Events Utility
sc.exe config DoSvc  start= disabled
sc.exe stop DoSvc
sc delete diagsvc start= disabled
sc.exe stop diagsvc
sc.exe config WdiSystemHost start= disabled
sc.exe stop WdiSystemHost
sc.exe config TrkWks start= disabled
sc.exe stop TrkWks
sc.exe config lfsvc start= disabled
sc.exe stop lfsvc
sc.exe config RasMan start= disabled
sc.exe stop RasMan
sc.exe config SSDPSRV start= disabled
sc.exe stop SSDPSRV
sc.exe config DiagTrack start= disabled
sc.exe stop DiagTrack
sc.exe stop DiagTrack 
sc delete DiagTrack

