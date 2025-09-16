;Delays

#SingleInstance, Force

SetWorkingDir %A_ScriptDir%  	     



Global IntMenuDelay := 200		

Global KeySendDelay := 100	



Global KeyPressDuration := 70		

Global PhoneDelay := 500              



setkeydelay, %KeySendDelay%, %KeyPressDuration% 		

;/////////////////////////////////////////////////////////////////////////////////



Numpad1::

PhoneUp()		

Send {Right}{Up}{Enter}

Send {Up 14}{Enter}

return	



;/////////////////////////////////////////////////////////////////////////////////



Numpad2::

PhoneUp()

Send {Right}{Up}{Enter}

Send {Up 12}{Enter}

return	



;/////////////////////////////////////////////////////////////////////////////////



Numpad3::

PhoneUp()

Send {Right}{Up}{Return}

Send {Up 18}{Enter}

return	



;/////////////////////////////////////////////////////////////////////////////////



Numpad4::

InteractionMenu()

Send {Down 2}{Enter}{Up 10}{Enter}   

Send {Enter 2}{m}       

return





;/////////////////////////////////////////////////////////////////////////////////



;Functions



PhoneUp(){

Send {Up}

sleep, %PhoneDelay% 

} 

return



InteractionMenu(){

Send {m}

sleep, %PhoneDelay% 

} 

return



Numpad5::

loop 1000{

Send {Up}

sleep, %PhoneDelay% 

Send {Enter}   

}

return





f5::

run, *runas %comspec% /c netsh interface set interface name="Ethernet" admin=disabled,,hide

return	



f6::

run, *runas %comspec% /c netsh interface set interface name="Ethernet" admin=enabled,,hide

return



F8::

Process_Suspend("GTA5.exe")

;MsgBox, GTA5.exe suspended

Process_Suspend(PID_or_Name){

    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name

    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)

    If !h   

        Return -1

    DllCall("ntdll.dll\NtSuspendProcess", "Int", h)

    DllCall("CloseHandle", "Int", h)

}

Sleep, 10000

Process_Resume("GTA5.exe")

;MsgBox, GTA5.exe resumed

Process_Resume(PID_or_Name){

    PID := (InStr(PID_or_Name,".")) ? ProcExist(PID_or_Name) : PID_or_Name

    h:=DllCall("OpenProcess", "uInt", 0x1F0FFF, "Int", 0, "Int", pid)

    If !h   

        Return -1

    DllCall("ntdll.dll\NtResumeProcess", "Int", h)

    DllCall("CloseHandle", "Int", h)

}

ProcExist(PID_or_Name=""){

    Process, Exist, % (PID_or_Name="") ? DllCall("GetCurrentProcessID") : PID_or_Name

    Return Errorlevel

}

return    


