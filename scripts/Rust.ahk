#Requires AutoHotkey v2.0

; Get executable from command line argument
executable := A_Args.Length > 0 ? A_Args[1] : "RustClient.exe"

; Wait for window to exist
; WinWait "ahk_exe " . executable

; Move the window to specified position and size
WinMove 1271, -31, 2576, 1479, "ahk_exe " . executable

; Monitor if game is still running
SetTimer () => (!WinExist("ahk_exe " . executable) ? ExitApp() : ""), 2000

; Autoreload every 1 minute to fix temporary issue
SetTimer () => Reload(), 60000

; Mouse mapping ================================================================
#HotIf WinActive("ahk_exe " . executable)

#HotIf
