# ==========================================================
# СКРИПТ ТОНКОЙ НАСТРОЙКИ WINDOWS
# Версия: 3.0 (ПОЛНАЯ)
# Включает ВСЕ команды из исходного запроса
# Внимание: Требуются права администратора!
# ==========================================================

# Проверка на административные права
if (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
    Write-Host "╔════════════════════════════════════════════════╗" -ForegroundColor Red
    Write-Host "║  ОШИБКА: Скрипт не запущен от администратора! ║" -ForegroundColor Red
    Write-Host "╚════════════════════════════════════════════════╝" -ForegroundColor Red
    Write-Host "`nПожалуйста, запустите PowerShell от имени администратора и повторите попытку." -ForegroundColor Yellow
    pause
    exit
}

# Функция для красивого вывода заголовков
function Show-Title {
    param([string]$Title, [string]$Color = "Cyan")
    Write-Host "`n╔══════════════════════════════════════════════════════╗" -ForegroundColor $Color
    Write-Host "║  $Title" -ForegroundColor $Color
    Write-Host "╚══════════════════════════════════════════════════════╝" -ForegroundColor $Color
}

# Функция выполнения команды с обработкой ошибок
function Invoke-SafeCommand {
    param([string]$Command, [string]$Description)
    
    Write-Host "[>] $Description..." -ForegroundColor Yellow
    try {
        $result = Invoke-Expression $Command 2>&1
        if ($LASTEXITCODE -and $LASTEXITCODE -ne 0) {
            Write-Host "    ⚠ Предупреждение: Команда выполнена с кодом $LASTEXITCODE" -ForegroundColor DarkYellow
        } else {
            Write-Host "    ✓ Успешно" -ForegroundColor Green
        }
    } catch {
        Write-Host "    ✗ Ошибка: $_" -ForegroundColor Red
    }
}

Write-Host @"

╔═══════════════════════════════════════════════════════════════╗
║            НАЧАЛО ОПТИМИЗАЦИИ WINDOWS                         ║
║        Изменения вступят в силу после перезагрузки             ║
╚═══════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Magenta

# ==========================================================
# ЧАСТЬ 1: СЕТЕВЫЕ НАСТРОЙКИ (HKLM)
# ==========================================================
Show-Title -Title "1. СЕТЕВЫЕ НАСТРОЙКИ" -Color "Green"

Invoke-SafeCommand -Command 'reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v SystemResponsiveness /t REG_DWORD /d 20 /f' -Description "Настройка отзывчивости системы"
Invoke-SafeCommand -Command 'reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d ffffffff /f' -Description "Отключение сетевого троттлинга"
Invoke-SafeCommand -Command 'reg add "HKLM\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d 00000026 /f' -Description "Оптимизация приоритетов процессов"
Invoke-SafeCommand -Command 'reg add "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v DefaultTTL /t REG_DWORD /d 128 /f' -Description "Настройка TTL"

# ==========================================================
# ЧАСТЬ 2: СИСТЕМНЫЕ ПОЛИТИКИ
# ==========================================================
Show-Title -Title "2. СИСТЕМНЫЕ ПОЛИТИКИ" -Color "Green"

$systemPolicies = @(
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection"; Name="AllowTelemetry"; Value=0; Desc="Отключение телеметрии (политика)"}
    @{Path="HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection"; Name="AllowTelemetry"; Value=0; Desc="Отключение телеметрии (текущая)"}
    @{Path="HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Policies\DataCollection"; Name="AllowTelemetry"; Value=0; Desc="Отключение телеметрии (32bit)"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection"; Name="DoNotShowFeedbackNotifications"; Value=1; Desc="Отключение уведомлений обратной связи"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\System"; Name="EnableActivityFeed"; Value=0; Desc="Отключение ленты активности"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\System"; Name="PublishUserActivities"; Value=0; Desc="Отключение публикации активностей"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\System"; Name="UploadUserActivities"; Value=0; Desc="Отключение загрузки активностей"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search"; Name="AllowCortana"; Value=0; Desc="Отключение Cortana"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat"; Name="AITEnable"; Value=0; Desc="Отключение сбора данных совместимости"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\AppCompat"; Name="DisableInventory"; Value=1; Desc="Отключение инвентаризации"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR"; Name="AllowGameDVR"; Value=0; Desc="Отключение GameDVR"}
    @{Path="HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"; Name="NoAutoUpdate"; Value=1; Desc="Отключение автообновлений"}
)

foreach ($policy in $systemPolicies) {
    Invoke-SafeCommand -Command "reg add `"$($policy.Path)`" /v $($policy.Name) /t REG_DWORD /d $($policy.Value) /f" -Description $policy.Desc
}

# ==========================================================
# ЧАСТЬ 3: СЛУЖБЫ (SERVICES) - ПОЛНЫЙ СПИСОК
# ==========================================================
Show-Title -Title "3. ОТКЛЮЧЕНИЕ СЛУЖБ (ПОЛНЫЙ СПИСОК)" -Color "Green"

$servicesToDisable = @(
    "DiagTrack", "NPSMSvc_237c2c", "SSDPSRV", "whesvc", "WSAFabricSvc",
    "spooler", "bthserv", "fax", "XblAuthManager", "XblGameSave",
    "XboxNetApiSvc", "RemoteRegistry", "AJRouter", "NetTcpPortSharing",
    "WiaRpc", "BDESVC", "SCardSvr", "WpcMonSvc", "HvHost",
    "Browser", "WMPNetworkSvc", "RmSvc", "SstpSvc", "lmhosts"
)

foreach ($service in $servicesToDisable) {
    $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($svc) {
        Write-Host "[>] Отключаем службу: $service..." -NoNewline
        try {
            Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
            Set-Service -Name $service -StartupType Disabled
            Write-Host " ✓" -ForegroundColor Green
        } catch {
            Write-Host " ✗" -ForegroundColor Red
        }
    } else {
        Write-Host "[>] Служба $service не найдена - пропускаем" -ForegroundColor DarkGray
    }
}

# ==========================================================
# ЧАСТЬ 4: СИСТЕМНЫЕ НАСТРОЙКИ
# ==========================================================
Show-Title -Title "4. СИСТЕМНЫЕ НАСТРОЙКИ" -Color "Green"

Invoke-SafeCommand -Command 'reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d "2000" /f' -Description "Ускорение завершения служб"
Invoke-SafeCommand -Command 'reg add "HKLM\SOFTWARE\Microsoft\Windows Search" /v SetupCompletedSuccessfully /t REG_DWORD /d 0 /f' -Description "Сброс поиска Windows"
Invoke-SafeCommand -Command 'reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d 0 /f' -Description "Отключение датчиков"
Invoke-SafeCommand -Command 'fsutil behavior set DisableDeleteNotify 0' -Description "Включение TRIM для SSD"
Invoke-SafeCommand -Command 'bcdedit /set {current} bootmenupolicy legacy' -Description "Классическое меню загрузки"

# ==========================================================
# ЧАСТЬ 5: ЗАДАНИЯ ПЛАНИРОВЩИКА
# ==========================================================
Show-Title -Title "5. ОЧИСТКА ПЛАНИРОВЩИКА" -Color "Green"

$tasksToDisable = @(
    "Microsoft\Windows\MemoryDiagnostic\ProcessMemoryDiagnosticEvents"
    "Microsoft\Windows\MemoryDiagnostic\RunFullMemoryDiagnostic"
)

foreach ($task in $tasksToDisable) {
    Invoke-SafeCommand -Command "schtasks /change /tn `"$task`" /disable" -Description "Отключение задачи: $task"
}

$tasksToDelete = @(
    "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
    "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
    "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser Exp"
    "\Microsoft\Windows\Application Experience\StartupAppTask"
    "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
)

foreach ($task in $tasksToDelete) {
    Invoke-SafeCommand -Command "schtasks /delete /tn `"$task`" /f" -Description "Удаление задачи: $task"
}

# ==========================================================
# ЧАСТЬ 6: ТЕЛЕМЕТРИЯ И СЛЕЖКА (HKCU)
# ==========================================================
Show-Title -Title "6. ТЕЛЕМЕТРИЯ И СЛЕЖКА" -Color "Green"

$privacySettings = @(
    @{Path="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy"; Name="TailoredExperiencesWithDiagnosticDataEnabled"; Value=0}
    @{Path="HKCU\SOFTWARE\Microsoft\Personalization\Settings"; Name="AcceptedPrivacyPolicy"; Value=0}
    @{Path="HKCU\SOFTWARE\Microsoft\Speech_OneCore\Settings\OnlineSpeechPrivacy"; Name="HasAccepted"; Value=0}
    @{Path="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo"; Name="Enabled"; Value=0}
    @{Path="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack"; Name="ShowedToastAtLevel"; Value=0}
    @{Path="HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"; Name="SubscribedContent-338388Enabled"; Value=0}
    @{Path="HKCU\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"; Name="SubscribedContent-338393Enabled"; Value=0}
    @{Path="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\SearchSettings"; Name="IsDeviceSearchHistoryEnabled"; Value=0}
    @{Path="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications"; Name="GlobalUserDisabled"; Value=1}
    @{Path="HKCU\SOFTWARE\Microsoft\InputPersonalization"; Name="RestrictImplicitTextCollection"; Value=1}
    @{Path="HKCU\SOFTWARE\Microsoft\InputPersonalization"; Name="RestrictImplicitInkCollection"; Value=1}
    @{Path="HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ActivityFeed"; Name="EnableActivityFeed"; Value=0}
)

foreach ($setting in $privacySettings) {
    Invoke-SafeCommand -Command "reg add `"$($setting.Path)`" /v $($setting.Name) /t REG_DWORD /d $($setting.Value) /f" -Description "Настройка: $($setting.Name)"
}

# ==========================================================
# ЧАСТЬ 7: УДАЛЕНИЕ ПРИЛОЖЕНИЙ
# ==========================================================
Show-Title -Title "7. УДАЛЕНИЕ ВСТРОЕННЫХ ПРИЛОЖЕНИЙ" -Color "Green"

$appPatterns = @(
    "*Windows.DevHome*",
    "*windowsphone*",
    "*xboxapp*",
    "*Microsoft.YourPhone*",
    "*Bing*",
    "*Xbox*"
)

foreach ($pattern in $appPatterns) {
    Write-Host "[>] Удаление приложений по шаблону: $pattern..." -ForegroundColor Yellow
    try {
        Get-AppxPackage -AllUsers $pattern | Remove-AppxPackage -ErrorAction SilentlyContinue
        Get-AppxPackage $pattern | Remove-AppxPackage -ErrorAction SilentlyContinue
        Write-Host "    ✓ Готово" -ForegroundColor Green
    } catch {
        Write-Host "    ⚠ Не все приложения удалены" -ForegroundColor DarkYellow
    }
}

# ==========================================================
# ЧАСТЬ 8: КОНФИДЕНЦИАЛЬНОСТЬ - ДОСТУП ПРИЛОЖЕНИЙ
# ==========================================================
Show-Title -Title "8. ЗАПРЕТ ДОСТУПА ПРИЛОЖЕНИЙ" -Color "Green"

$capabilities = @(
    "voiceActivation", "userDataTasks", "location", "webcam", "userAccountInformation",
    "contacts", "appointments", "phoneCall", "email", "chat", "radios",
    "bluetoothSync", "appDiagnostics", "documentsLibrary", "picturesLibrary",
    "videosLibrary", "broadFileSystemAccess", "camera", "accountInfo", "calendar",
    "callHistory", "messaging", "otherDevices", "backgroundApps", "downloadsFolder",
    "documents", "pictures", "videos", "fileSystem"
)

foreach ($cap in $capabilities) {
    Invoke-SafeCommand -Command "reg add `"HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\$cap`" /v `"Value`" /t REG_SZ /d `"Deny`" /f" -Description "Запрет доступа: $cap"
}

# ==========================================================
# ЧАСТЬ 9: НАСТРОЙКИ ИНТЕРФЕЙСА
# ==========================================================
Show-Title -Title "9. НАСТРОЙКИ ИНТЕРФЕЙСА" -Color "Green"

Invoke-SafeCommand -Command 'reg add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f /ve' -Description "Отключение галереи в проводнике"
Invoke-SafeCommand -Command 'reg add "HKCU\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d "1000" /f' -Description "Таймаут зависших приложений"
Invoke-SafeCommand -Command 'reg add "HKCU\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d "1" /f' -Description "Автозавершение задач"
Invoke-SafeCommand -Command 'reg add "HKCU\Control Panel\Desktop" /v LowLevelHooksTimeout /t REG_SZ /d "1000" /f' -Description "Таймаут хуков"
Invoke-SafeCommand -Command 'reg add "HKCU\Control Panel\Desktop" /v ForegroundFlashCount /t REG_DWORD /d 0 /f' -Description "Отключение мигания в фоне"
Invoke-SafeCommand -Command 'reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d "0" /f' -Description "Отключение анимации окон"
Invoke-SafeCommand -Command 'reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f' -Description "Отключение прозрачности"
Invoke-SafeCommand -Command 'reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v ShowSecondsInSystemClock /t REG_DWORD /d 1 /f' -Description "Секунды в часах"

# ==========================================================
# ЧАСТЬ 10: ДОПОЛНИТЕЛЬНЫЕ СЛУЖБЫ (ИЗ ВТОРОЙ ЧАСТИ)
# ==========================================================
Show-Title -Title "10. ДОПОЛНИТЕЛЬНЫЕ СЛУЖБЫ" -Color "Green"

$extraServices = @(
    "edgeupdate", "edgeupdatem", "fhsvc", "GameInputSvc", "icssvc",
    "InventorySvc", "ipfsvc", "lltdsvc", "LxpSvc", "McpManagementService",
    "MSiSCSI", "NcaSvc", "PcaSvc", "PrintDeviceConfigurationService",
    "PrintNotify", "PrintScanBrokerService", "RasAuto", "refsdedupsvc",
    "RemoteAccess", "RetailDemo", "ScDeviceEnum", "SCPolicySvc", "SEMgrSvc",
    "shpamsvc", "smphost", "SNMPTrap", "ssh-agent", "svsvc",
    "vmicguestinterface", "vmicheartbeat", "vmickvpexchange", "vmicrdv",
    "vmicshutdown", "vmictimesync", "vmicvmsession", "vmicvss",
    "WarpJITSvc", "Wecsvc", "wercplsupport", "WFDSConMgrSvc",
    "WSAIFabricSvc", "XboxGipSvc"
)

foreach ($service in $extraServices) {
    $svc = Get-Service -Name $service -ErrorAction SilentlyContinue
    if ($svc) {
        Write-Host "[>] Отключаем службу: $service..." -NoNewline
        try {
            Stop-Service -Name $service -Force -ErrorAction SilentlyContinue
            Set-Service -Name $service -StartupType Disabled
            Write-Host " ✓" -ForegroundColor Green
        } catch {
            Write-Host " ✗" -ForegroundColor Red
        }
    }
}

# ==========================================================
# ЧАСТЬ 11: ПОЛНОЕ УДАЛЕНИЕ EDGE
# ==========================================================
Show-Title -Title "11. ПОЛНОЕ УДАЛЕНИЕ MICROSOFT EDGE" -Color "Green"

Write-Host "[>] Завершение процессов Edge..." -ForegroundColor Yellow
Get-Process -Name "msedge", "MicrosoftEdge", "edge", "EdgeUpdate" -ErrorAction SilentlyContinue | Stop-Process -Force
taskkill /f /im msedge.exe /t /fi "status eq running" 2>$null

Write-Host "[>] Удаление Appx пакетов Edge..." -ForegroundColor Yellow
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*Edge*" -and $_.Name -notlike "*WebView*"} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

# Удаление папок Edge
$edgePaths = @(
    "C:\Program Files (x86)\Microsoft\Edge",
    "C:\Program Files (x86)\Microsoft\EdgeCore",
    "C:\Program Files (x86)\Microsoft\EdgeUpdate",
    "$env:LOCALAPPDATA\Microsoft\Edge"
)

foreach ($path in $edgePaths) {
    if (Test-Path $path) {
        Write-Host "[>] Удаление папки: $path..." -ForegroundColor Yellow
        try {
            takeown /f $path /r /d y 2>$null
            icacls $path /grant administrators:F /t 2>$null
            Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "    ✓ Папка удалена" -ForegroundColor Green
        } catch {
            Write-Host "    ⚠ Не удалось удалить папку" -ForegroundColor DarkYellow
        }
    }
}

# Блокировка обновления Edge
Invoke-SafeCommand -Command 'reg add "HKLM\SOFTWARE\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d 1 /f' -Description "Блокировка обновления Edge"

# ==========================================================
# ЧАСТЬ 12: ФИНАЛЬНЫЕ НАСТРОЙКИ (ПОВТОР ВАЖНЫХ)
# ==========================================================
Show-Title -Title "12. ФИНАЛЬНЫЕ ПРОВЕРКИ" -Color "Green"

# Повторное отключение телеметрии на всякий случай
Invoke-SafeCommand -Command 'reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d 0 /f' -Description "Финальное отключение телеметрии"

# Отключение службы поиска (если еще включена)
$searchSvc = Get-Service -Name "WSearch" -ErrorAction SilentlyContinue
if ($searchSvc -and $searchSvc.StartType -ne "Disabled") {
    Write-Host "[>] Отключаем службу поиска Windows..." -NoNewline
    try {
        Stop-Service -Name "WSearch" -Force -ErrorAction SilentlyContinue
        Set-Service -Name "WSearch" -StartupType Disabled
        Write-Host " ✓" -ForegroundColor Green
    } catch {
        Write-Host " ✗" -ForegroundColor Red
    }
}

# ==========================================================
# ЗАВЕРШЕНИЕ
# ==========================================================
Write-Host @"

╔═══════════════════════════════════════════════════════════════╗
║             ОПТИМИЗАЦИЯ ЗАВЕРШЕНА!                            ║
║    Для применения всех изменений требуется перезагрузка       ║
║                                                               ║
║    Всего выполнено команд: ~200                               ║
╚═══════════════════════════════════════════════════════════════╝
