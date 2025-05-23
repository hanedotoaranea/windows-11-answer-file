reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v TailoredExperiencesWithDiagnosticDataEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" /v HasAccepted /t REG_DWORD /d 0 /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization" /v RestrictImplicitTextCollection /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v AllowTelemetry /t REG_DWORD /d 0 /f

for %%a in (
    "Location"
    "Camera"
    "Microphone"
    "AccountInfo"
    "Contacts"
    "Calendar"
    "CallHistory"
    "Email"
    "Messaging"
    "Radios"
    "OtherDevices"
    "BackgroundApps"
    "AppDiagnostics"
    "DownloadsFolder"
    "Documents"
    "Pictures"
    "Videos"
    "FileSystem"
) do (
    reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\%%~a" /v Value /t REG_SZ /d Deny /f
)