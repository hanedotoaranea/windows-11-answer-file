# Общие настройки конфиденциальности
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Personalization\Settings" -Name "AcceptedPrivacyPolicy" -Value 0

# Голосовые функции
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy" -Name "HasAccepted" -Value 0

# Персонализация ввода
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitTextCollection" -Value 1
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1

# Диагностика и телеметрия
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 -Force
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack" -Name "ShowedToastAtLevel" -Value 0

# Журнал действий
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ActivityFeed" -Name "EnableActivityFeed" -Value 0

# Разрешения приложений
$permissions = @(
    "Location",
    "Camera",
    "Microphone",
    "AccountInfo",
    "Contacts",
    "Calendar",
    "CallHistory",
    "Email",
    "Messaging",
    "Radios",
    "OtherDevices",
    "BackgroundApps",
    "AppDiagnostics",
    "DownloadsFolder",
    "Documents",
    "Pictures",
    "Videos",
    "FileSystem"
)

foreach ($perm in $permissions) {
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$perm" -Name "Value" -Value "Deny" -ErrorAction SilentlyContinue
}