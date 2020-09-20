@echo off

taskkill /im PCCleaner.exe /t /f
taskkill /im PCCNotifications.exe /t /f

net stop PcaSvc
net stop PcaSvc

rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\PC Cleaner"
rd /s /q "C:\ProgramData\PC Cleaner"
rd /s /q "C:\Program Files (x86)\PC Cleaner"
rd /s /q "%appdata%\PC Cleaner"

cd c:\windows\system32\tasks\
del "PC Cleaner automatic scan and notifications."

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

del "%~f0"
