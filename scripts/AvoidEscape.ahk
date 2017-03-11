
#Persistent

SetTitleMatchMode, 2
Menu, Tray, NoStandard

;Loop, Read, D:\phuc\data\account_mb.txt
;{
;    Menu, tray, add, %A_LoopReadLine%, MenuHandler
;}
;Menu, tray, add
;Menu, tray, add, Exit, Exit
;Menu, tray, Default, anhhl
;Menu, Tray, Click, 1
;Menu, Tray, Icon, Shell32.dll, 174
;
;FileRead, ActiveAccount,C:\Users\Administrator\active_account
;Menu, tray, Default, %ActiveAccount%
;
;return
;
;MenuHandler:
;    Menu, tray, Default, %A_ThisMenuItem%
;    FileDelete, C:\Users\Administrator\active_account
;    FileAppend, %A_ThisMenuItem%,C:\Users\Administrator\active_account
;return
;
;Exit:
;    ExitApp
;Return

LCtrl & j:: Send {Down}
LCtrl & k:: Send {Up}
LCtrl & h:: Send {Left}
LCtrl & l:: Send {Right}
CapsLock::esc
