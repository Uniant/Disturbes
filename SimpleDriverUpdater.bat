@echo off
taskkill /im "SimpleDriverUpdater.exe" /t /f
taskkill /im "SimpleStarSmartMonitor.exe" /t /f
taskkill /im "SimpleStar Smart Monitor Service.exe" /t /f
taskkill /im "SimpleStar Smart Monitor Service.exe" /t /f

net stop PcaSvc

rd /s /q "C:\Program Files\Simple Driver Updater"
rd /s /q "C:\Program Files\SimpleStar Smart Monitor"
rd /s /q "C:\ProgramData\SimpleStar" 
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\SimpleStar"

del /q "%PUBLIC%\Desktop\Simple Driver Updater.lnk" 
del /q "%USERPROFILE%\Downloads\SimpleDriverUpdaterSetup_ppc2.exe" 

reg delete "HKEY_CLASSES_ROOT\AppID\{A85EF924-D5E3-4C9F-90A8-524ED861385F}" /f
reg delete "HKEY_CLASSES_ROOT\AppID\SimpleStar Smart Monitor Service.exe" /f
reg delete "HKEY_CLASSES_ROOT\CLSID\{25B5F0B1-1A7D-419C-BD99-483CC2D36CA3}" /f
reg delete "HKEY_CLASSES_ROOT\SimpleStar.SMSettings" /f
reg delete "HKEY_CLASSES_ROOT\SimpleStar.SMSettings.1.1" /f
reg delete "HKEY_CLASSES_ROOT\TypeLib\{7A1A79A8-F9A1-446D-9EC6-0ED968DEB32B}" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\SimpleStar Smart Monitor Service" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SimpleStar Smart Monitor Service" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Simple Driver Updater" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppBadgeUpdated" /v "{6D809377-6AF0-444B-8957-A3773F02200E}\Simple Driver Updater\SimpleDriverUpdater.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "{6D809377-6AF0-444B-8957-A3773F02200E}\Simple Driver Updater\SimpleDriverUpdater.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "C:\Program Files\Simple Driver Updater\SimpleDriverUpdater.exe" /f

SCHTASKS /Delete /TN "Start Simple Driver Updater Check Driver Update" /f
SCHTASKS /Delete /TN "Start Simple Driver Updater for %COMPUTERNAME%@%USERNAME%(logon)" /f
SCHTASKS /Delete /TN "Start Simple Driver Updater Schedule" /f
SCHTASKS /Delete /TN "Start Simple Driver Updater Update" /f

net start PcaSvc
