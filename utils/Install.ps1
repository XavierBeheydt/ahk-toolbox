$scriptPath = Join-Path $PSScriptRoot "..\scripts\Main.ahk"
$keyName = "AHKToolbox"
$regPath = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run"

if (-not (Test-Path $scriptPath)) {
    Write-Error "Main.ahk not found at $scriptPath"
    exit 1
}

# Try to find AutoHotkey executable to be explicit
$ahkPath = Get-Command "AutoHotkey*.exe" -ErrorAction SilentlyContinue | Select-Object -ExpandProperty Source -First 1

if (-not $ahkPath) {
    # Fallback to common locations
    $commonPaths = @(
        "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey64.exe",
        "$env:ProgramFiles\AutoHotkey\v2\AutoHotkey32.exe",
        "$env:ProgramFiles\AutoHotkey\AutoHotkey.exe"
    )
    foreach ($path in $commonPaths) {
        if (Test-Path $path) {
            $ahkPath = $path
            break
        }
    }
}

$command = ""
if ($ahkPath) {
    $command = "`"$ahkPath`" `"$scriptPath`""
} else {
    Write-Warning "AutoHotkey executable not found. Relying on file association."
    $command = "`"$scriptPath`""
}

$confirmation = Read-Host "Do you want to add 'Main.ahk' to Windows Startup? (y/n)"
if ($confirmation -eq 'y') {
    try {
        Set-ItemProperty -Path $regPath -Name $keyName -Value $command -ErrorAction Stop
        Write-Host "Successfully added to startup!" -ForegroundColor Green
        Write-Host "Key: $keyName"
        Write-Host "Command: $command"
    } catch {
        Write-Error "Failed to add to startup. $_"
    }
}
