#Requires AutoHotkey v2.0

scriptPath := A_ScriptDir . "\..\scripts\Main.ahk"
keyName := "AHKToolbox"
regKey := "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run"

if !FileExist(scriptPath) {
    MsgBox("Main.ahk not found in " . A_ScriptDir, "Error", 16)
    ExitApp
}

result := MsgBox("Do you want to add 'Main.ahk' to Windows Startup?", "Install AHK Toolbox", 4 + 32)

if (result == "Yes") {
    try {
        ; Write to registry: "Path\To\AutoHotkey.exe" "Path\To\Main.ahk"
        RegWrite('"' . A_AhkPath . '" "' . scriptPath . '"', "REG_SZ", regKey, keyName)
        MsgBox("Successfully added to startup!`nKey: " . keyName, "Success", 64)
    } catch as err {
        MsgBox("Failed to add to startup.`nError: " . err.Message, "Error", 16)
    }
}
