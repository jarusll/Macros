#NoEnv
#WinActivateForce
; #Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

#SingleInstance force

FocusOrLaunch(id, exec){
	ifWinNotExist, %id%
		Run, %exec%
	ifWinExist, %id%
		WinActivate, %id%
}

F24::
FileRead, key, C:\Users\ysura\Documents\keypressed.txt
switch key
{
	case "space":
		Reload
		return
	case "enter": FocusOrLaunch("ahk_exe mintty.exe", "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Git\Git Bash.lnk")
	case "num0": Run, chrome.exe "https://github.dev/jarusll/diary"
	case "num1": FocusOrLaunch("ahk_exe chrome.exe", "chrome.exe")
	case "num2": FocusOrLaunch("ahk_exe Code.exe", "Code.exe")
	case "num3": FocusOrLaunch("ahk_exe GitHubDesktop.exe", "GitHubDesktop.exe")
	case "num5": FocusOrLaunch("ahk_exe Discord.exe", "Discord.exe")
	case "num9": FocusOrLaunch("ahk_exe Spotify.exe", "Spotify.exe")
	default: MsgBox, "%key%"
}
return

NormalizePath(path) {
	cc := DllCall("GetFullPathName", "str", path, "uint", 0, "ptr", 0, "ptr", 0, "uint")
	VarSetCapacity(buf, cc*2)
	DllCall("GetFullPathName", "str", path, "uint", cc, "str", buf, "ptr", 0)
	return buf
}
