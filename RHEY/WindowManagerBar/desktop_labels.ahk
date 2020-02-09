
global currentDesktop

/*#^Left::
	SelectDesktopLeft()

#^Right::
	SelectDesktopRight()
*/

#Numpad1::
#1::
SelectDesktop1()
Return

#Numpad2::
#2::
SelectDesktop2()
return


#Numpad3::
#3::
SelectDesktop3()
return


#Numpad4::
#4::
SelectDesktop4()
return

#Numpad5::
#5::
SelectDesktop5()
return

#Numpad6::
#6::
SelectDesktop6()
return

#Numpad7::
#7::
SelectDesktop7()
return

#NumPad8::
#8::
SelectDesktop8()
return

#NumPad9::
#9::
SelectDesktop9()
return

#NumPad0::
#0::
SelectDesktop0()
return

SelectDesktop0(){
    ChangeDesktopZero()
	HighlightDesktop(0)
	currentDesktop=0;
Return
}

SelectDesktop1(){
    ChangeDesktopOne()
	HighlightDesktop(1)
	currentDesktop=1;
Return
}

SelectDesktop2(){
    ChangeDesktopTwo()
	HighlightDesktop(2)
	currentDesktop=2;
Return
}

SelectDesktop3(){
    ChangeDesktopThree()
	HighlightDesktop(3)
	currentDesktop=3;
Return
}

SelectDesktop4(){
    ChangeDesktopFour()
	HighlightDesktop(4)
	currentDesktop=4;
Return
}

SelectDesktop5(){
    ChangeDesktopFive()
	HighlightDesktop(5)
	currentDesktop=5;
Return
}

SelectDesktop6(){
	ChangeDesktopSix()
	HighlightDesktop(6)
	currentDesktop=6;
Return
}

SelectDesktop7(){
    ChangeDesktopSeven()
	HighlightDesktop(7)
	currentDesktop=7;
Return
}

SelectDesktop8(){
    ChangeDesktopEight()
	HighlightDesktop(8)
	currentDesktop=8;
Return
}

SelectDesktop9(){
    ChangeDesktopNine()
	HighlightDesktop(9)
	currentDesktop=9;
Return
}

SelectDesktopLeft(){
	if (currentDesktop > 0 and currentDesktop < 10) {
		changeto := (%currentDesktop% - 1)
		SwoopToDesktop(changeto)
	}
	return
}

SelectDesktopRight(){
	if (currentDesktop >= 0 and currentDesktop < 9) {
		changeto := (%currentDesktop% + 1)
		SwoopToDesktop(changeto)
	}
	return
}

HighlightDesktop(x) {

GuiControl,, Desktop0, %A_ScriptDir%\desktop_number_icons\0_white_home_18dp_big.png
GuiControl,, Desktop1, %A_ScriptDir%\desktop_number_icons\1_white_square_18dp_big.png
GuiControl,, Desktop2, %A_ScriptDir%\desktop_number_icons\2_white_square_18dp_big.png
GuiControl,, Desktop3, %A_ScriptDir%\desktop_number_icons\3_white_square_18dp_big.png
GuiControl,, Desktop4, %A_ScriptDir%\desktop_number_icons\4_white_square_18dp_big.png
GuiControl,, Desktop5, %A_ScriptDir%\desktop_number_icons\5_white_square_18dp_big.png
GuiControl,, Desktop6, %A_ScriptDir%\desktop_number_icons\6_white_square_18dp_big.png
GuiControl,, Desktop7, %A_ScriptDir%\desktop_number_icons\7_white_square_18dp_big.png
GuiControl,, Desktop8, %A_ScriptDir%\desktop_number_icons\8_white_square_18dp_big.png
GuiControl,, Desktop9, %A_ScriptDir%\desktop_number_icons\9_white_square_18dp_big.png

Switch x
{
Case 0:
    GuiControl,, Desktop0, %A_ScriptDir%\desktop_number_icons\0_black_home_18dp_big.png
Case 1:
    GuiControl,, Desktop1, %A_ScriptDir%\desktop_number_icons\1_black_square_18dp_big.png
Case 2:
    GuiControl,, Desktop2, %A_ScriptDir%\desktop_number_icons\2_black_square_18dp_big.png
Case 3:
    GuiControl,, Desktop3, %A_ScriptDir%\desktop_number_icons\3_black_square_18dp_big.png
Case 4:
    GuiControl,, Desktop4, %A_ScriptDir%\desktop_number_icons\4_black_square_18dp_big.png
Case 5:
    GuiControl,, Desktop5, %A_ScriptDir%\desktop_number_icons\5_black_square_18dp_big.png
Case 6:
    GuiControl,, Desktop6, %A_ScriptDir%\desktop_number_icons\6_black_square_18dp_big.png
Case 7:
    GuiControl,, Desktop7, %A_ScriptDir%\desktop_number_icons\7_black_square_18dp_big.png
Case 8:
    GuiControl,, Desktop8, %A_ScriptDir%\desktop_number_icons\8_black_square_18dp_big.png
Case 9:
    GuiControl,, Desktop9, %A_ScriptDir%\desktop_number_icons\9_black_square_18dp_big.png
Default:
    GuiControl,, Desktop0, %A_ScriptDir%\desktop_number_icons\0_black_home_18dp_big.png
}

Return
}

SwoopToDesktop(dsktp){
	Switch dsktp
{
Case 0:
    SelectDesktop0()
Case 1:
    SelectDesktop1()
Case 2:
    SelectDesktop2()
Case 3:
    SelectDesktop3()
Case 4:
    SelectDesktop4()
Case 5:
    SelectDesktop5()
Case 6:
    SelectDesktop6()
Case 7:
    SelectDesktop7()
Case 8:
    SelectDesktop8()
Case 9:
    SelectDesktop9()
Default:
    SelectDesktop0()
}
Return
}



WatchDesktop:
	SetTimer, WatchDesktop, 200
	currentDesktopcheck := GetCurrentDesktop()
	currentDesktopcheck = %currentDesktopCheck%
	currentDesktopCheck+=0

	if (currentDesktopCheck != currentDesktop) {
		currentDesktop = %currentDesktopCheck%
		HighlightDesktop(currentDesktop)
	}
Return

#Include %A_ScriptDir%\desktop-switcher.ahk