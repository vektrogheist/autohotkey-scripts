#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; sign sending doesnt work nor does generating xtraz here goes

psScript := "C:\Program Files\WindowsPowerShell\Modules\VirtualDesktop\1.1.0\VirtualDesktop.psm1"

;so far this only works if theyre already open change that

#1::
Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 1", ,Hide

return

#2::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 2", ,Hide

return

#3::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 3", ,Hide


return

#4::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 4", ,Hide

return

#5::


desktop5 = Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Get-Desktop -Index  5", ,Hide

return

#6::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 6", ,Hide

return

#7::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 7", ,Hide

return

#8::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 8", ,Hide


return

#9::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 9", ,Hide


return

#0::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 0", ,Hide

return



; send itt
#^1::
Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 1)", ,Hide

return

#^2::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 2)", ,Hide

return

#^3::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 3)", ,Hide

return

#^4::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 4)", ,Hide

return


#^5::
Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 5)", ,Hide

return


#^6::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 6)", ,Hide


return

#^7::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 7)", ,Hide

return

#^8::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 8)", ,Hide


return

#^9::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 9)", ,Hide


return

#^0::
Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Move-ActiveWindow -Desktop (Get-Desktop 0)", ,Hide

return



getDesktopCount() {
	
	return Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Get-DesktopCount"
}

createDesktopsUpUntil(x, current){
	Loop %x%;
	{
		if (x < current) {
	    Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "New-Desktop"
	    }
	}
}
