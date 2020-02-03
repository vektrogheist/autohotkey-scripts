#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Menu, DocMenu, Add, GDrive Folder A, MenuHandler
Menu, DocMenu, Add, GDrive Folder B, MenuHandler
Menu, MyMenu, Add, &New Doc, :DocMenu

Menu, SheetMenu, Add, GDrive Folder A, MenuHandler
Menu, SheetMenu, Add, GDrive Folder B, MenuHandler
Menu, MyMenu, Add, &New Sheet, :SheetMenu

Menu, MyMenu, Add, Open GDrive, MenuHandler
Menu, MyMenu, Add, Open GMail, MenuHandler
return 

MenuHandler:
if (A_ThisMenu = "DocMenu")
{
    if (A_ThisMenuItem = "GDrive Folder A")
    {
        Run, https://docs.google.com/document/create?usp=drive_web&folder=1fQNKva9isMAquZffglkHJSCUT-xPnQPN
    }
    else if (A_ThisMenuItem = "GDrive Folder B")
    {
        Run, https://docs.google.com/document/create?usp=drive_web&folder=14hqYL813L9mkezZt2LqBYoxWtxjIvMoB
    }
}
else if (A_ThisMenu = "SheetMenu")
{
    if (A_ThisMenuItem = "GDrive Folder A")
    {
        Run, https://docs.google.com/spreadsheets/create?usp=drive_web&folder=1fQNKva9isMAquZffglkHJSCUT-xPnQPN
    }
    else if (A_ThisMenuItem = "GDrive Folder B")
    {
        Run, https://docs.google.com/spreadsheets/create?usp=drive_web&folder=14hqYL813L9mkezZt2LqBYoxWtxjIvMoB
    }
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