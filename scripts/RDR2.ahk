#Requires AutoHotkey v2.0

; Get executable from command line argument
executable := A_Args.Length > 0 ? A_Args[1] : "RDR2.exe"

; Monitor if game is still running
SetTimer () => (!WinExist("ahk_exe " . executable) ? ExitApp() : ""), 2000

; Game-specific hotkeys can be added here
#HotIf WinActive("ahk_exe " . executable)

; Add RDR2-specific hotkeys here if needed

#HotIf