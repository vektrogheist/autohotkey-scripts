#NoEnv
#NoTrayIcon
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

global trans
global iconLoc
global loadedWidget


trans := rini("settings", "trans")
iniWidgetsleft := rini("widgetsleft", null)
widgetListleft := StrSplit(iniWidgetsleft, "`n")
iniWidgetsright := rini("widgetsright", null)
widgetListright := StrSplit(iniWidgetsright, "`n")

;;;  Context Menu
Menu, RClick, Add, Set Transparency, SetTranVal
Menu, RClick, Add
Menu, RClick, Add, Rebuild, Reload
Menu, RClick, Add, Exit, QuitScript
Menu, RClick, Add

;;; Installed Widgets
Loop, % widgetListleft.MaxIndex()
{
  widget := rini("widgetsleft", A_Index)
  widgetLabel := rini("widgetLabelsleft", A_Index)
  Menu, Widgets, Add, % widget, % widgetLabel
  Menu, Widgets, Icon, % widget, %A_ScriptDir%\Widgets\%widget%\%widget%.png
}
Menu, Widgets, Add

;;; Base Gui

Gui -Caption +ToolWindow +AlwaysOnTop +Border +LastFound
hAB := WinExist()
barw := A_ScreenWidth - 2
Gui, Color, White
Gui, Font, s8
Gui, Add, Picture, x5 y10 w15 h20 gWidgetMenu, arrow.png
Gui, Add, Picture, x20 y5 w32 h32 vCurrentLeft, 

;;; desktop identifiers
Gui, Add, Picture, x50 y6 w30 h30 vDesktop0 gSelectDesktop0, %A_ScriptDir%\desktop_number_icons\0_white_home_18dp_big.png
Gui, Add, Picture, x90 y6 w30 h30 vDesktop1 gSelectDesktop1, %A_ScriptDir%\desktop_number_icons\1_black_square_18dp_big.png
Gui, Add, Picture, x130 y6 w30 h30 vDesktop2 gSelectDesktop2, %A_ScriptDir%\desktop_number_icons\2_white_square_18dp_big.png
Gui, Add, Picture, x170 y6 w30 h30 vDesktop3 gSelectDesktop3, %A_ScriptDir%\desktop_number_icons\3_white_square_18dp_big.png
Gui, Add, Picture, x210 y6 w30 h30 vDesktop4 gSelectDesktop4, %A_ScriptDir%\desktop_number_icons\4_white_square_18dp_big.png
Gui, Add, Picture, x250 y6 w30 h30 vDesktop5 gSelectDesktop5, %A_ScriptDir%\desktop_number_icons\5_white_square_18dp_big.png
Gui, Add, Picture, x290 y6 w30 h30 vDesktop6 gSelectDesktop6, %A_ScriptDir%\desktop_number_icons\6_white_square_18dp_big.png
Gui, Add, Picture, x330 y6 w30 h30 vDesktop7 gSelectDesktop7, %A_ScriptDir%\desktop_number_icons\7_white_square_18dp_big.png
Gui, Add, Picture, x370 y6 w30 h30 vDesktop8 gSelectDesktop8, %A_ScriptDir%\desktop_number_icons\8_white_square_18dp_big.png
Gui, Add, Picture, x410 y6 w30 h30 vDesktop9 gSelectDesktop9, %A_ScriptDir%\desktop_number_icons\9_white_square_18dp_big.png


Gui, Show, x0 y0 h40 w%barw%
;Gui, Show, x0 y1000 w%barw%  Put on bottom

WinGetPos, GX,GY,GW,GH, ahk_id %hAB%

ABM := DllCall( "RegisterWindowMessage", Str,"AppBarMsg" )
OnMessage( ABM, "ABM_Callback" )
OnMessage( (WM_MOUSEMOVE := 0x200) , "CheckMousePos" )

; APPBARDATA : http://msdn2.microsoft.com/en-us/library/ms538008.aspx
VarSetCapacity( APPBARDATA , (cbAPPBARDATA := A_PtrSize == 8 ? 48 : 36), 0 )
Off :=  NumPut( cbAPPBARDATA, APPBARDATA, "Ptr" )
Off :=  NumPut( hAB, Off+0, "Ptr" )
Off :=  NumPut( ABM, Off+0, "UInt" )
Off :=  NumPut(   1, Off+0, "UInt" ) 
Off :=  NumPut(  GX, Off+0, "Int" ) 
Off :=  NumPut(  GY, Off+0, "Int" ) 
Off :=  NumPut(  GW, Off+0, "Int" ) 
Off :=  NumPut(  GH, Off+0, "Int" )
Off :=  NumPut(   1, Off+0, "Ptr" )
;Off :=  NumPut(   2, Off+0, "Ptr" )  Put on bottom
GoSub, RegisterAppBar

;;; Widget variables

;;; Set Transparency
GoSub, SetTrans
GoSub, WatchDesktop

OnExit, QuitScript
Return

Reload:
  reload
return

RegisterAppBar:
  DllCall("Shell32.dll\SHAppBarMessage", UInt,(ABM_NEW:=0x0)     , UInt,&APPBARDATA )
  DllCall("Shell32.dll\SHAppBarMessage", UInt,(ABM_QUERYPOS:=0x2), UInt,&APPBARDATA )
  DllCall("Shell32.dll\SHAppBarMessage", UInt,(ABM_SETPOS:=0x3)  , UInt,&APPBARDATA )
Return

RemoveAppBar:
  DllCall("Shell32.dll\SHAppBarMessage", UInt,(ABM_REMOVE := 0x1), UInt,&APPBARDATA )
Return

GuiContextMenu:
  Index := SubStr(A_GuiControl,2,3) 
  ToolTip
  Menu, RClick, Show
Return

WidgetMenu:
  Menu, Widgets, Show, 0, 25
return

ABM_Callback( wParam, LParam, Msg, HWnd ) {
; Not much messages received. When Taskbar settings are
; changed the wParam becomes 1, else it is always 2
}

SetTranVal:
  InputBox, trans, , Set transparency from 150-255,, 245, 135
  if (trans < 100)
    trans = 100
  if (trans > 255)
    trans = 255
  GoSub, SetTrans
return

SetTrans:
    WinSet, Transparent, %trans%, ahk_id %hAB%
    IniWrite, %trans%, bar.ini, settings, trans
return

QuitScript:
  if (loadedWidget != "")
  {
    close := "Quit" loadedWidget
    GoSub, %close%
  }
  GoSub, RemoveAppbar
  ExitApp
Return

rini(key, val)
{
  if (val != null)
    IniRead, ini, bar.ini, %key%, %val%
  else
    IniRead, ini, bar.ini, %key%
  return ini
}

#Include %A_ScriptDir%\desktop_labels.ahk
#Include %A_ScriptDir%\desktop-switcher.ahk