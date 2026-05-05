# Настройка времени отключения монитора в параметрах схемы электропитания
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerSettings\7516b95f-f776-4464-8c53-06167f40cc99\8EC4B3A5-6868-48c2-BE75-4F3044BE88A7" /v Attributes /t REG_DWORD /d 2 /f
sc.exe config AMD Crash Defender Service start= disabled
sc.exe config AMD External Events Utility start= disabled
sc.exe config DoSvc  start= disabled
sc delete diagsvc start= disabled
sc.exe config WdiSystemHost start= disabled
sc.exe config TrkWks start= disabled
sc.exe config lfsvc start= disabled
sc.exe config RasMan start= disabled
sc.exe config SSDPSRV start= disabled
sc.exe config DiagTrack start= disabled
sc.exe stop DiagTrack 
sc delete DiagTrack

