#Requires AutoHotkey v2.0

; Commons ======================================================================
currentDir := A_ScriptDir
appTrackingInterval := 2000         ; 2 seconds polling interval
obsforegroundKeys := "^!y"          ; CTRL + ALT + Y

; Mouse mapping ================================================================
XButton1::XButton2
XButton2::XButton1

; App Tracking =================================================================
GameConfigs := Map()
GameConfigs["RDR2"] := {
    script: currentDir . "\RDR2.ahk",
    executable: "RDR2.exe"
}
GameConfigs["DayZ"] := {
    script: currentDir . "\DayZ.ahk",
    executable: "DayZ_x64.exe"
}
GameConfigs["RoadToVostok"] := {
    script: currentDir . "\RoadToVostok.ahk",
    executable: "Road_to_Vostok_Demo.exe"
}
GameConfigs["Rust"] := {
    script: currentDir . "\Rust.ahk",
    executable: "RustClient.exe"
}

SetTimer AppTracking, appTrackingInterval

AppTracking() {
    global GameConfigs, obsforegroundKeys

    for appName, config in GameConfigs {
        if (WinExist("ahk_exe " . config.executable)) {
            WinSetAlwaysOnTop(true, "ahk_exe " . config.executable)
            Sleep 1000
            Send obsforegroundKeys

            ToolTip "Started " . appName . " script", 0, 0, 1
            SetTimer () => ToolTip("", 0, 0, 1), -2000
            RunWait('"' . A_AhkPath . '" "' . config.script . '" "' . config.executable . '"', , "Hide")
        }
    }
}
