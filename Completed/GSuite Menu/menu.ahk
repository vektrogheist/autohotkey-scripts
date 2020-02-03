#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IniRead, gfcount, gmenu.Ini, gfcount, gfcount, 0



Loop, %gfcount%
{
    IniRead, folderLabel, gmenu.Ini, gfolderlabels, %A_Index%, 0
    Menu, DocMenu, Add, %folderLabel%, MenuHandler
    Menu, SheetMenu, Add, %folderLabel%, MenuHandler
    Menu, SheetMenu, Add, %folderLabel%, MenuHandler
    Menu, ForgetMenu, Add, %folderLabel%, ForgetFolder
}


Menu, MyMenu, Add, Open GDrive, MenuHandler
Menu, MyMenu, Add, Open GMail, MenuHandler
Menu, MyMenu, Add, &New Doc, :DocMenu
Menu, MyMenu, Add, &New Sheet, :SheetMenu
Menu, MyMenu, Add
Menu, MyMenu, Add, Add Folder, AddFolder
Menu, MyMenu, Add, &Forget Folders, :ForgetMenu

return 

MenuHandler:
if (A_ThisMenu = "DocMenu")
{
    IniRead, folderId, gmenu.Ini, gfolders, %A_ThisMenuItemPos%, 0
    Run, https://docs.google.com/document/create?usp=drive_web&folder=%folderId%
}
else if (A_ThisMenu = "SheetMenu")
{
    IniRead, folderId, gmenu.Ini, gfolders, %A_ThisMenuItemPos%, 0
    Run, https://docs.google.com/spreadsheets/create?usp=drive_web&folder=%folderId%
}
else if (A_ThisMenuItem = "Open GDrive")
{
    Run, https://drive.google.com/drive/u/0/my-drive
}
else if (A_ThisMenuItem = "Open GMail")
{
    Run, https://mail.google.com/
}

return

#^G::
Menu, MyMenu, Show  ; i.e. press the Win-Z hotkey to show the menu.
return

AddFolder:
    InputBox, newfolderid, New Folder, Please enter folder id., , 640, 480
    InputBox, newfolderlabel, New Folder, Please enter a label for the folder., , 640, 480
    if ErrorLevel {

    }
       
    else
    {
        IniRead, gfcount, gmenu.Ini, gfcount, gfcount, 0
        gfcount++
        IniWrite, %gfcount%, gmenu.Ini, gfcount, gfcount
        IniWrite, %newfolderlabel%, gmenu.Ini, gfolderlabels, %gfcount%
        IniWrite, %newfolderid%, gmenu.Ini, gfolders, %gfcount%
        reload
    }
Return

ForgetFolder:
    IniDelete, gmenu.Ini, gfolders, %gfcount%
    IniDelete, gmenu.Ini, gfolderlabels, %gfcount%

    IniRead, gfcount, gmenu.Ini, gfcount, gfcount, 0
    gfcount--
    IniWrite, %gfcount%, gmenu.Ini, gfcount, gfcount

Reload:
  reload
return



rini(key, val)
{
  if (val != null)
    IniRead, ini, gmenu.ini, %key%, %val%
  else
    IniRead, ini, gmenu.ini, %key%
  return ini
}