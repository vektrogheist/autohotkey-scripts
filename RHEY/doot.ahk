
; AutoHotkey Version: 1.0.47.06
; Language:       English
; Platform:       Win9x/NT
; Author:         Sam Denton <samwyse at gmail dot com>
; Date Written:   July 3, 2008
;
; Script Function:
;   Turns the SNARF program into an app-bar.
;   (based on Quick Launcher Appbar, by Skan - 28/Aug/2007)
;

#NoEnv                                  ; Recommended for performance
SendMode Input                          ; superior speed and reliability.
SetWorkingDir %A_ScriptDir%             ; Ensures consistent starting directory.

; This should be the only application-specific section of code.
;Menu, Tray, Icon, C:\Program Files\Sublime Text 3.exe, 1
Menu, Tray, Tip, SNARF AppBar
uEdge=2                                 ; left=0,top=1,right=2,bottom=3
uAppWidth=136                           ; "ideal" width for a vertical appbar
uAppHeight=136                          ; "ideal" height when horizonal

DetectHiddenWindows, On
hAB := WinExist("SNARF")
hProgman := WinExist("Progman")
Gui +LastFound
hGUI := WinExist()
hProgman := DllCall( "FindWindowEx", "uint",0, "uint",0, "str", "Progman", "uint",0)
 
; preserve current positioning
WinGetPos, HX,HY,HW,HH, ahk_id %hAB%

SetBatchLines -1
CoordMode, Mouse  , Screen
CoordMode, Tooltip, Screen
Menu, Tray, NoStandard
Menu, Tray, Add, AppBar Hide/Show, ToggleGUI
Menu, Tray, Add
Menu, Tray, Standard
Menu, Tray, Default, AppBar Hide/Show
Menu, Tray, Click, 1

if (uEdge = 2) {
  GX := A_ScreenWidth - uAppWidth
} else {
  GX := 0
}

if (uEdge = 3) {
  GY := A_ScreenHeight - uAppHeight
} else {
  GY := 0
}

if (uEdge in 0,2) {
  GW := uAppWidth
  GH := A_ScreenHeight
} else {
  GW := A_ScreenWidth
  GH := uAppHeight
}

; WinGet, s1, Style, ahk_id %hAB%
; WinGet, e1, ExStyle, ahk_id %hAB%
; WinGet, s2, Style, ahk_id %hGUI%
; WinGet, e2, ExStyle, ahk_id %hGUI%
; WinGet, s3, Style, ahk_id %hProgman%
; WinGet, e3, ExStyle, ahk_id %hProgman%
; msgbox, AB is %hAB%, style is %s1%, exstyle is %e1%`nGUI is %hGUI%, style is %s2%, exstyle is %e2%`nProgman is %hGUI%, style is %s3%, exstyle is %e3%
; ;      AB is 0x3024c,  style is 0x16CE0000, exstyle is 0x00050100
; ;     GUI is 0x1a03f0, style is 0x84CA0000, exstyle is 0x00000100
; ; Progman is 0x1a03f0, style is 0x96000000, exstyle is 0x00000080

; WinSet, Style, 0x96000000, ahk_id %hGUI%
; WinSet, ExStyle, 0x00000080, ahk_id %hGUI%

WinSet, Style, -0xC00000, ahk_id %hAB%  ; Remove the window's title bar
WinSet, ExStyle, +0x80, ahk_id %hAB%    ; Remove it from the alt-tab list
WinSet, ExStyle, -0x00040000, ahk_id %hAB%    ; Turn off WS_EX_APPWINDOW
; ;AB  is 0x3024c,  style is 0x160E0000, exstyle is 0x00010180

;  This removes the icon from the taskbar, but causes Samurize
;  to draw its stuff on top of the application.
; DllCall( "SetParent", "uint", hAB, "uint", hProgman )
;  This causes the window to disappear completely.
; DllCall( "SetParent", "uint", hAB, "uint", hGUI )

ABM := DllCall( "RegisterWindowMessage", Str,"AppBarMsg" )
OnMessage( ABM, "ABM_Callback" )
OnMessage( (WM_MOUSEMOVE := 0x200) , "CheckMousePos" )

; APPBARDATA : http://msdn2.microsoft.com/en-us/library/ms538008.aspx
VarSetCapacity( APPBARDATA , 36, 0 )
Off :=  NumPut(    36, APPBARDATA )     ; cbSize
Off :=  NumPut(   hAB, Off+0 )          ; hWnd
Off :=  NumPut(   ABM, Off+0 )          ; uCallbackMessage
Off :=  NumPut( uEdge, Off+0 )          ; uEdge: left=0,top=1,right=2,bottom=3
Off :=  NumPut(    GX, Off+0 )          ; rc.left
Off :=  NumPut(    GY, Off+0 )          ; rc.top
Off :=  NumPut( GX+GW, Off+0 )          ; rc.right
Off :=  NumPut( GY+GH, Off+0 )          ; rc.bottom
Off :=  NumPut(     1, Off+0 )          ; lParam
GoSub, RegisterAppBar

OnExit, QuitScript
Return

ToggleGUI:
  If DllCall("IsWindowVisible", UInt,hAB) {
    WinHide, ahk_id %hAB%
    GoSub, RemoveAppBar
  } Else {
    WinShow, ahk_id %hAB%
    GoSub, RegisterAppBar
  }
Return

RegisterAppBar:
  Result := DllCall("Shell32.dll\SHAppBarMessage",UInt,(ABM_NEW:=0x0),UInt,&APPBARDATA)
  Result := DllCall("Shell32.dll\SHAppBarMessage",UInt,(ABM_QUERYPOS:=0x2),UInt,&APPBARDATA)
  Result := DllCall("Shell32.dll\SHAppBarMessage",UInt,(ABM_SETPOS:=0x3),UInt,&APPBARDATA)
  GX := NumGet(APPBARDATA, 16 )
  GY := NumGet(APPBARDATA, 20 )
  GW := NumGet(APPBARDATA, 24 ) - GX
  GH := NumGet(APPBARDATA, 28 ) - GY
  ;msgbox, WinMove`, ahk_id %hAB%`,`, %GX%`, %GY%`, %GW%`, %GH%
  WinMove, ahk_id %hAB%,, %GX%, %GY%, %GW%, %GH%
Return

RemoveAppBar:
  DllCall("Shell32.dll\SHAppBarMessage",UInt,(ABM_REMOVE := 0x1),UInt,&APPBARDATA)
Return

QuitScript:
  GoSub, RemoveAppbar
  ;  This un-does the earlier SetParent
  DllCall( "SetParent", "uint", hAB, "uint", 0 )
WinSet, Style, +0xC00000, ahk_id %hAB%  ; Restore the window's title bar
WinSet, ExStyle, -0x80, ahk_id %hAB%    ; Restore it to the alt-tab list
WinSet, ExStyle, +0x00040000, ahk_id %hAB%    ; Turn on WS_EX_APPWINDOW
  WinMove, ahk_id %hAB%,, %HX%, %HY%, %HW%, %HH%
  WinShow, ahk_id %hAB%
  ExitApp
Return

ABM_Callback( wParam, LParam, Msg, HWnd ) {
; When Taskbar settings are changed, wParam is 1, otherwise it's 2.
; I'll probably add code to handle this later.
}