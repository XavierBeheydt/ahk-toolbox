#Requires AutoHotkey v2.0

; Get executable from command line argument
executable := A_Args.Length > 0 ? A_Args[1] : "DayZ_x64.exe"

; Monitor if game is still running
SetTimer () => (!WinExist("ahk_exe " . executable) ? ExitApp() : ""), 2000

; Autoreload every 1 minute to fix temporary issue
SetTimer () => Reload(), 60000

; Mouse mapping ================================================================
#HotIf WinActive("ahk_exe " . executable)

XButton1::
{
    Send "{Blind}{e down}"
    KeyWait "XButton1"
    Send "{Blind}{e up}"
}

XButton2::
{
    Send "{Blind}{q down}"
    KeyWait "XButton2"
    Send "{Blind}{q up}"
}

#HotIf
