@echo off
title scatix spoofer
::resize window
%extd% /getconsoletitle
%extd% /resizewindow "%result%" 0 0 1129 520
%extd% /center
::save current directory so gen knows where to put saved_accounts.txt
del "%userprofile%\AppData\Roaming\test.txt" /f
echo "%cd%" >> "%userprofile%\AppData\Roaming\test.txt"
set /p cddir=<"%userprofile%\AppData\Roaming\test.txt"
cd "%userprofile%\AppData\Roaming\RedlineUnbanSrc"
del output.txt /f
del install_brave.exe /f
del pythin.exe /f
::disable set time automatically + fastboot + ipv6
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\tzautoupdate" /v Start /t reg_dword /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time\Parameters" /v Type /t reg_sz /d NoSync /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v HiberbootEnabled /t reg_dword /d 0 /f


if [%1]==[] goto noarg
goto %1
:noarg

md "C:\S.Unban"
cls


:start
setlocal enableextensions
set FilesCount=0
for %%x in (C:\hassanunban\unbanned_accounts\*.json) do set /a FilesCount+=1
title S. SPOOFER EAC
color 5
type doh.txt
echo.


echo ..######...######.....###....########.####.##.....##
echo .##....##.##....##...##.##......##.....##...##...##.
echo .##.......##........##...##.....##.....##....##.##..
echo ..######..##.......##.....##....##.....##.....###...
echo .......##.##.......#########....##.....##....##.##..
echo .##....##.##....##.##.....##....##.....##...##...##.
echo ..######...######..##.....##....##....####.##.....##
echo.
echo.
ECHO 1. Spoof
ECHO 2. CLEAN + SPOOFER + EVERTHING ( CHOOSE 2 )
ECHO 3. Check Serials
endlocal
CHOICE /C 123 /M "Enter your choice:"


IF ERRORLEVEL 3 GOTO serials
IF ERRORLEVEL 2 GOTO clean
IF ERRORLEVEL 1 GOTO spoof


:checkspoof
set /A result=value
del output.txt /f
wmic diskdrive get serialnumber >output.txt
for /f %%i in ("output.txt") do set size=%%~zi
if %size% gtr 6 %extd% /messagebox Error "You are not spoofed. Do you want to spoof?" 4
if "%result%"=="6" (goto spoof)
del output.txt /f
goto :eof




:fix
echo this may take a while
start "" /wait /b "dism.exe" /online /cleanup-image /restorehealth
start "" /wait /b "sfc.exe" /scannow
GOTO fixes


:kill
start "" /wait /b "Taskkill_clean.bat"
GOTO start


:clean
start "" /wait /b "Cleaner.bat"
GOTO :eof

:spoof
set /A result=value
del output.txt /f
wmic diskdrive get serialnumber >output.txt
for /f %%i in ("output.txt") do set size=%%~zi
if %size% lss 7 %extd% /messagebox Error "Your already spoofed spoofing again may break shit but click yes to respoof" 4
if "%result%"=="7" (goto start)
del output.txt /f
start "" /wait /b "Spoofer.bat" 
GOTO :eof




:serials
start "" /wait /b "Serials.bat"
GOTO start


:activate
start /wait activate.bat
goto fixes



:dlls
start https://www.techpowerup.com/download/visual-c-redistributable-runtime-package-all-in-one/
echo download and extract it then run install_all.bat
pause
goto fixes

:fixes
title scatix HWID b2 - Fixes
type doh.txt
echo General Fixes
echo.
echo.
echo.
echo.
echo.

ECHO 1. Go Back
ECHO 2. Windows Image Fix
ECHO 3. Activate windows
ECHO 4. Fix DLL not found errors


CHOICE /C 1234 /M "Enter your choice:"


IF ERRORLEVEL 4 GOTO dlls
IF ERRORLEVEL 3 GOTO activate
IF ERRORLEVEL 2 GOTO fix
IF ERRORLEVEL 1 GOTO start
