psScript := "C:\Program Files\WindowsPowerShell\Modules\VirtualDesktop\1.1.0\VirtualDesktop.psm1"

;so far this only works if theyre already open change that

#^F4::MsgBox Desktop deletion disabled

#t::
cur := GetCurrentDesktop()
MsgBox, %cur%

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

GetDesktopCount() {
	return Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Get-DesktopCount"
}

GetCurrentDesktop() {
	Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Get-DesktopIndex > %A_ScriptDir%\currentDesktop111.txt", ,Hide
	FileRead, var1111, %A_ScriptDir%\currentDesktop111.txt
	return var1111
}

ChangeDesktopZero(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 0", ,Hide
	return
}

ChangeDesktopOne(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 1", ,Hide
	return
}

ChangeDesktopTwo(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 2", ,Hide
	return
}

ChangeDesktopThree(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 3", ,Hide
	return
}

ChangeDesktopFour(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 4", ,Hide
	return
}

ChangeDesktopFive(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 5", ,Hide
	return
}

ChangeDesktopSix(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 6", ,Hide
	return
}

ChangeDesktopSeven(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 7", ,Hide
	return
}

ChangeDesktopEight(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 8", ,Hide
	return
}

ChangeDesktopNine(){
	Run, PowerShell.exe -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "Switch-Desktop -Desktop 9", ,Hide
	return
}

createDesktopsUpUntil(x, current){
	Loop %x%;
	{
		if (x < current) {
	    Run, powershell -ExecutionPolicy Bypass -WindowStyle Hidden -noProfile -nologo -Command "New-Desktop"
	    }
	}
}
