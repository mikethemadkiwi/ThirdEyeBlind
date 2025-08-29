#include <MsgBoxConstants.au3>
#include <TrayConstants.au3>
;; Variables.
Global $countdown = 15
Global $IsOn = 0
TraySetState($TRAY_ICONSTATE_SHOW) ; Show the tray menu.
;; HotKeyS
HotKeySet("{PAUSE}", "Terminate")
HotKeySet("{F3}", "ThirdEyeBlind")
HotKeySet("{F5}", "RunLoop")
;; Termination Function
Func Terminate()
	ToolTip('', 0, 0)
    Exit 0
EndFunc
;; Runs Once
Func ThirdEyeBlind()
	ToolTip('', 0, 0)
	Local $hWnd = WinWaitActive("FiveM", "", 10)
	Local $aClientPos = WinGetPos($hWnd)
	Local $aClientSize = WinGetClientSize($hWnd)
	Local $aHalfClientX = $aClientSize[0]/2
	Local $aHalfClientY = $aClientSize[1]/2
	Local $aClientX = $aClientPos[0] + $aHalfClientX
	Local $aClientY = $aClientPos[1] + $aHalfClientY
	ToolTip('Locating 3rd Eye:' & $aClientX & ', ' & $aClientY, 0, 0)
	;Hold DOwn the Third Eye Key
    Send("{ALT down}") ; Holds the 1 key down
	Sleep(100)
	;Click so it activates the third eye mouse countrol.	
	MouseDown('main')
	Sleep(100)
	MouseUp('main') 
	Sleep(100)
	;Track mouse position, move it by direction left to position above top option in third eye menu
	Local $aPos = MouseGetPos()
	local $newPos = $aPos[0] + 50
	MouseMove($newPos,  $aPos[1], 0)
	Sleep(100)
	;Run additional Click to trigger menu item.
	MouseDown('main')
	Sleep(100)
	MouseUp('main') 
	Sleep(100)
	;Release the third eye key.
    Send("{ALT up}")
	;CoolDown
EndFunc
;; Runs Multiple Times
Func RunLoop()
	If $IsOn = 1 Then
		$IsOn = 0
		ToolTip('RunLoop Is OFF', 0, 0)
        TraySetToolTip("'RunLoop Is OFF") ; The tray menu icon must be shown before we can set some text.		
	Else
		$IsOn = 1
		ToolTip('RunLoop Is ON', 0, 0)
        TraySetToolTip("'RunLoop Is ON") ;
	EndIf	
EndFunc
;; Keeps the Script Alive.
ToolTip('Waiting For FiveM Trigger', 0, 0)
While 1
	If $IsOn = 1 Then		
		ToolTip('', 0, 0)
		Local $hWnd = WinWaitActive("FiveM", "", 10)
		Local $aClientPos = WinGetPos($hWnd)
		Local $aClientSize = WinGetClientSize($hWnd)
		Local $aHalfClientX = $aClientSize[0]/2
		Local $aHalfClientY = $aClientSize[1]/2
		Local $aClientX = $aClientPos[0] + $aHalfClientX
		Local $aClientY = $aClientPos[1] + $aHalfClientY
		ToolTip('Locating 3rd Eye:' & $aClientX & ', ' & $aClientY, 0, 0)
		;Hold DOwn the Third Eye Key
		Send("{ALT down}") ; Holds the 1 key down
		Sleep(100)
		;Click so it activates the third eye mouse countrol.	
		MouseDown('main')
		Sleep(100)
		MouseUp('main') 
		Sleep(100)
		;Track mouse position, move it by direction left to position above top option in third eye menu
		Local $aPos = MouseGetPos()
		local $newPos = $aPos[0] + 50
		MouseMove($newPos,  $aPos[1], 0)
		Sleep(100)
		;Run additional Click to trigger menu item.
		MouseDown('main')
		Sleep(100)
		MouseUp('main') 
		Sleep(100)
		;Release the third eye key.
		Send("{ALT up}")
		;CoolDown
		While $countdown > 0
			ToolTip('Triggering in: ' & $countdown & ' secs. LOOK AT YOUR TARGET!', 0, 0)
			$countdown = $countdown - 1
			Sleep(1000)
		WEnd	
		$countdown = 15
	Else
		ToolTip('', 0, 0)
	EndIf
	Sleep(100)
WEnd