@echo off
rem set dns ip wanted
set dnstoadd="192.168.130.129"

rem variable 
set searchfor="static"

rem first loop to get the interfaces names in computer
FOR /F "tokens=3,*" %%A IN ('netsh interface show interface^|find "Connected"') DO (
 


rem echo the interface name
echo %%B

rem second loop to get the info about the interface 
for /f "delims=" %%i in ('netsh interface ip show dnsservers "%%B"') do (

rem check if the interface have static dns then added the new dns wanted else dont do any thing
ECHO.%%i| FIND /I %searchfor%>Nul && ( 
  netsh interface ip add dnsservers "%%B" %dnstoadd%
  Echo.Found 
  
) || (
  Echo.
  
)


)




)
pause