#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SendMode Input

SetWorkingDir %A_ScriptDir%  ;设置工作文件夹地址。
DetectHiddenWindows, On
#Persistent
;------------从下面开始是需要根据您个人的情况修改的参数------------
; --------- Controls，控制按钮

accel := "Up"
turnLeft := "Left"
turnRight := "Right"
nitros := "Down"

; --------- Constants 调整参数
;设置调整的参数
statime := 3000 ;加载后预等待时间，后面会判断开始。不卡情况下计算点击进入游戏后到倒数3秒的时间（稍少算点）ps4请对应调整。。
loadtime := 4000 ;比赛后在重试按钮界面，点重试后进入比赛简介时间,ps4请对应调整。

;判断图区域正常分辨率下的位置比
x1per := 0.6 ;左上角 左边距
y1per := 0.8 ;左上角 上边距
x2per := 0.7 ;右下角 左边距
y2per := 0.9 ;右下角 上边距
;游戏实际窗口包括黑边在内的左上角第一像素距离屏幕原点偏移像素数
Wline := 8
Hline := 31
;------------个人参数结束------------



; ---------- Gui Setup -------------
Gui, -MaximizeBox
Gui, Color, cFFFFFF, c6272a4
Gui, Add, Button, x15 y10 w70 default, Start
GUI, Add, Text,, _________________
GUI, Add, Text,, GT7 EasyMoney V2.0-b 
GUI, Add, Text,, Clubman Cap Plus PP550 
GUI, Add, Text,, Up By 156300
Gui, Font, ce8dfe3 s9 w550 Bold
Gui, Show,w220 h150, GT7 EM 2.0
return

ButtonStart:
	Gui, Submit, NoHide
	id := ""
	SetKeyDelay, 10
	Process, priority, , High
	gosub, GrabRemotePlay
	if  (id = "")
		return
	gosub, PauseLoop
	CoordMode, Mouse, Client
	CoordMode, Pixel, Client
	CoordMode, ToolTip, Screen
	 sleep 500
	gosub, AFKLoop
; ---------- Gui Setup End-------------

;取实际分辨率，判断黑边大小并赋值
GetWH:
	WinGetPos, Xs, Ys, winWidthpx, winHeightpy, ahk_id %id%
;处理边框、标题栏，标题栏高30固定，上边一般为1加起来等于Hline，底边阴影边等于Wline
	winWidthp := winWidthpx - Wline - Wline
	winHeightp := winHeightpy - Hline - Wline
;通配，怕出小数
	winWidth := winWidthp * 144
	winHeight := winHeightp * 144
;判断黑边大小，并赋值
	if (winWidth * 9 / 16 > winHeight)
	{
		Wplus := (winWidthp - (winHeightp * 16 / 9)) / 2
		Hplus := 0
	}
	else if (winWidth * 9 / 16 < winHeight)
	{
		Wplus := 0
		Hplus := (winHeightp - (winWidth * 9 / 16)) / 2
	}	
	else
	{
	Wplus := 0
	Hplus := 0
	}
	
;简化判断语句内赋值，把运算提前不进入主循环减少运算量
	x1p := (winWidthp - Wplus - Wplus) * x1per + Wplus
	y1p := (winHeightp - Hplus - Hplus) * y1per + Hplus
	x2p := (winWidthp - Wplus - Wplus) * x2per + Wplus
	y2p := (winHeightp - Hplus - Hplus) * y2per + Hplus
	return
	
AFKLoop:
	loop {
		gosub, PressX ;进入比赛
		gosub, GetWH
		 DllCall("Sleep", "UInt", statime) ;预等待游戏进入时间
		gosub, Race
	}
	return

PressX:
; Just for menuing, does not hold X down 只是相当于点手柄的X键=确认键
	ControlSend,, {%brake% down}, ahk_id %id% 
	 DllCall("Sleep", "UInt", 200)
    ControlSend,, {%brake% up}, ahk_id %id% 
    return

Race:
	ControlSend,, {%accel% down}, ahk_id %id% 
	 DllCall("Sleep", "UInt", 100)
	ControlSend,, {%nitros% down}, ahk_id %id% 	
	 DllCall("Sleep", "UInt", 100)
;判断比赛是否结束并返回界面。否则继续等待。
    loop {
		WinActivate, ahk_id %id%
	 	DllCall("Sleep", "UInt", 400)
;图片截取重试按钮界面的 退出带汉字的长按钮的上部分的纯红色区域条，取80%宽就好。
		ImageSearch, OutputVarX3, OutputVarY3, x1p, y1p, x2p, y2p, *20 %A_ScriptDir%\menu2red.png 
		If (ErrorLevel = 0) {
; 弹起油门和追逐按键
			 Sleep, 100
			ControlSend,, {%accel% up}, ahk_id %id% 
			 Sleep, 100
			ControlSend,, {%nitros% up}, ahk_id %id%
			break				
		}
		else{
			gosub, PressX ;循环确认到重试界面
		}
	} 
	;按两次esc到退出按钮
	 Sleep, 300
	ControlSend,, {Esc down}, ahk_id %id% 
	 Sleep, 100
	ControlSend,, {Esc up}, ahk_id %id% 
	 Sleep, 200
	ControlSend,, {Esc down}, ahk_id %id% 
	 Sleep, 100
	ControlSend,, {Esc up}, ahk_id %id% 
	 Sleep, 1000 ;按左方向键前等待时间
	ControlSend,, {Left down}, ahk_id %id% 
	 Sleep, 200
	ControlSend,, {Left up}, ahk_id %id% 
	 Sleep, 500
	gosub, PressX
	 Sleep, %loadtime%
	return



;; General Functions for AHK

GrabRemotePlay:
	WinGet, remotePlay_id, List, ahk_exe RemotePlay.exe
		if (remotePlay_id = 0)
			{
			MsgBox, PS Remote Play not found
			return
			}
	Loop, %remotePlay_id%
		{
		id := remotePlay_id%A_Index%
		WinGetTitle, title, % "ahk_id " id
		If InStr(title, "PS Remote Play")
		break
		}    
	WinGetClass, remotePlay_class, ahk_id %id%
	WinMove, ahk_id %id%,,  0, 0, 800, 450
	ControlFocus,, ahk_class %remotePlay_class%
	WinActivate, ahk_id %id%
	return

PauseLoop:
	ControlSend,, {%accel% up}, ahk_id %id% 
	ControlSend,, {%nitros% up}, ahk_id %id% 
	ControlSend,, {%turnLeft% up}, ahk_id %id% 
	ControlSend,, {%turnRight% up}, ahk_id %id% 
	return

GuiClose:
	gosub, PauseLoop
	ExitApp

^Esc::ExitApp