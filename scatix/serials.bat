@echo off
echo your BaseBoard
wmic baseboard get serialnumber
echo your Bios
wmic bios get serialnumber
echo your Cpu
wmic cpu get serialnumber
echo your DiskDrive (#1) C:
wmic diskdrive get serialnumber
echo Diskdrive (#2)
wmic path win32_physicalmedia get SerialNumber
echo Diskdrive (#3)
wmic path win32_diskdrive get SerialNumber
echo your BaseBoard
wmic baseboard get manufacturer
echo RAM
wmic memorychip get serialnumber
echo CPU
wmic cpu get processorid
echo BaseBoard
wmic baseboard get manufacturer
echo GPU
wmic PATH Win32_VideoController GET Description,PNPDeviceID
echo Mac Address
getmac
exit