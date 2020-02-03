#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


w := A_ScreenWidth
h := 100

x := 0
y := A_ScreenHeight-h

Gui, +AlwaysOnTop -Caption
Gui, Show, x%x% y%y% w%w% h%h%

VarSetCapacity( old_area, 16 )

; SPI_GETWORKAREA
success := DllCall( "SystemParametersInfo", "uint", 0x30, "uint", 0, "uint", &old_area, "uint", 0 )

VarSetCapacity( area, 16, 0 )

EncodeInteger( A_ScreenWidth, 4, &area, 8 )
EncodeInteger( A_ScreenHeight-h, 4, &area, 12 )

; SPI_SETWORKAREA
success := DllCall( "SystemParametersInfo", "uint", 0x2F, "uint", 0, "uint", &area, "uint", 0 )
if ( ErrorLevel or ! success )
{
	MsgBox, [1] failed: EL = %ErrorLevel%
	ExitApp
}

MsgBox, pausing ...

; SPI_SETWORKAREA
success := DllCall( "SystemParametersInfo", "uint", 0x2F, "uint", 0, "uint", &old_area, "uint", 0 )
if ( ErrorLevel or ! success )
{
	MsgBox, [2] failed: EL = %ErrorLevel%
	ExitApp
}
ExitApp

EncodeInteger( p_value, p_size, p_address, p_offset )
{
	loop, %p_size%
		DllCall( "RtlFillMemory"
			, "uint", p_address+p_offset+A_Index-1
			, "uint", 1
			, "uchar", ( p_value >> ( 8*( A_Index-1 ) ) ) & 0xFF )
}