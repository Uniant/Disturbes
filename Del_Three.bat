@echo off
openfiles > NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
echo Thank you for using Trownsoft Disturbes.
echo Select the software you want to remove.
echo 1.OneSafe PC Cleaner
echo 2.PC Cleaner (PC Helpsoft Labs Inc.)
echo 3.Driver Tonic
set /p select=Please enter the number in half-width characters.:
if /i %select% gtr 3 (echo Error. The number must be from 1 to 3.
) else (if /i %select% lss 1 (echo Error. The number must be from 1 to 3.) else (
if /i %select% equ 1 (taskkill /im OneSafePCCleaner.exe /t /f
taskkill /im OSPCNotifications.exe /t /f

net stop PcaSvc

rd /s /q "C:\Program Files (x86)\OneSafe PC Cleaner"
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\OneSafe PC Cleaner"
rd /s /q "C:\ProgramData\OneSafe PC Cleaner"
rd /s /q "%appdata%\OneSafe PC Cleaner"

del "%USERPROFILE%\Desktop\OneSafe PC Cleaner.lnk"

del "%USERPROFILE%\Downloads\OneSafe_PC_Cleaner.exe"
	
reg delete "HKEY_CURRENT_USER\SOFTWARE\OneSafe PC Cleaner" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\OneSafe PC Cleaner_is1" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\DOMStorage\onesafe-software.com" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\DOMStorage\www.onesafe-software.com" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\EdpDomStorage\onesafe-software.com" /f
reg delete "HKEY_CLASSES_ROOT\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\EdpDomStorage\www.onesafe-software.com" /f
reg delete "HKEY_CLASSES_ROOT\OSPC" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\DOMStorage\onesafe-software.com" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\DOMStorage\www.onesafe-software.com" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\EdpDomStorage\onesafe-software.com" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\Children\001\Internet Explorer\EdpDomStorage\www.onesafe-software.com" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Classes\OSPC" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "{7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E}\OneSafe PC Cleaner\OneSafePCCleaner.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Search\JumplistData" /v "{7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E}\OneSafe PC Cleaner\OneSafePCCleaner.exe" /f

SCHTASKS /Delete /TN "OneSafe PC Cleaner automatic scan and notifications" /f

net start PcaSvc
) else (if /i %select% equ 2 (taskkill /im PCCleaner.exe /t /f
taskkill /im PCCNotifications.exe /t /f

net stop PcaSvc

rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PC Cleaner"
rd /s /q "C:\ProgramData\PC Cleaner"
rd /s /q "C:\Program Files (x86)\PC Cleaner"
rd /s /q "%appdata%\PC Cleaner"

del "C:\Windows\system32\tasks\PC Cleaner automatic scan and notifications."
del "%USERPROFILE%\Desktop\PC Cleaner.lnk"
del "%USERPROFILE%\Downloads\PC_Cleaner.exe"
	
reg delete "HKLM\SOFTWARE\WOW6432NODE\MICROSOFT\WINDOWS\CURRENTVERSION\UNINSTALL\PC CLEANER_IS1" /f
reg delete "HKCU\SOFTWARE\PC CLEANER" /f
reg delete "HKEY_CLASSES_ROOT\PCHS" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\LastKey" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "{7C5A40EF-A0FB-4BFC-874A-C0F2E0B9FA8E}\PC Cleaner\PCCleaner.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "C:\Program Files (x86)\PC Cleaner\PCCleaner.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "C:\Program Files (x86)\PC Cleaner\PCCNotifications.exe" /f
SCHTASKS /Delete /TN "PC Cleaner automatic scan and notifications" /f

net start PcaSvc
) else (taskkill /im dtn.exe /t /f

net stop PcaSvc

rd /s /q "C:\Program Files\Driver Tonic"
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Driver Tonic"
rd /s /q "%appdata%\pctonics.com"

del "C:\Users\Public\Desktop\Driver Tonic.lnk"

del "%USERPROFILE%\Downloads\drivertonic.exe"

reg delete "HKEY_CURRENT_USER\SOFTWARE\pctonics.com" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{4C7CA6F1-4691-449D-B574-559726CDA825}_is1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\pctonics.com" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "{6D809377-6AF0-444B-8957-A3773F02200E}\Driver Tonic\dtn.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "C:\Program Files\Driver Tonic\dtn.exe" /f
SCHTASKS /Delete /TN "Driver Tonic_Logon" /f

net start PcaSvc
))

) )
:NotAdmin
echo Error. Please run as an administrator.
goto End

pause
:End
