@echo off
taskkill /im OneSafePCCleaner.exe /t /f
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

del "%~f0"
