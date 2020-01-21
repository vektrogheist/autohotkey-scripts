#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


::$$p1::doodley doOo

^!WheelUp::Send {Volume_Up}
^!WheelDown::Send {Volume_Down}
^!MButton::Send {Volume_Mute}

MyString := "This is a 'r' literal string."

::li::  
text =
(
corey daniels
line 2
line 3
line4

--------------
804-doodley-doo
)
; IfWinActive, ahk_group textEditors ; create a group in the auto execute section
SendInput, %text%                      ;  SendInput is faster and more reliable
return

::cd$::
ClipSaved := ClipboardAll ; save the entire clipboard to the variable ClipSaved
clipboard := ""           ; empty the clipboard (start off empty to allow ClipWait to detect when the text has arrived)
clipboard =               ; copy this text:
(
corey daniels
line 2
line 3
line4

--------------
804-doodley-doo
)
ClipWait, 2              ; wait max. 2 seconds for the clipboard to contain data. 
if (!ErrorLevel)         ; If NOT ErrorLevel, ClipWait found data on the clipboard
    Send, ^v             ; paste the text
Sleep, 300
clipboard := ClipSaved   ; restore original clipboard
ClipSaved =              ; Free the memory in case the clipboard was very large.
return

; ctrl+shift+d - new google doc
^+d::
{
Run, https://docs.google.com/document/create
Return
}

; ctrl+shift+s - new google sheet
^+s::
{
Run, https://docs.google.com/spreadsheets/create
Return
}


^+1::
	WinGet, activePath, ProcessPath, % "ahk_id" winActive("A")	
	msgbox % activePath


	Run, explore activePath
return
