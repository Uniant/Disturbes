@echo off
REM 作業内容を表示しない
taskkill /im dtn.exe /t /f
REM タスクの強制終了
net stop PcaSvc
REM サービスの停止
rd /s /q "C:\Program Files\Driver Tonic"
rd /s /q "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Driver Tonic"
rd /s /q "%appdata%\pctonics.com"
REM インストールされたファイルの削除
del "C:\Users\Public\Desktop\Driver Tonic.lnk"
del "%USERPROFILE%\Downloads\drivertonic.exe"
REM ショートカットの削除
reg delete "HKEY_CURRENT_USER\SOFTWARE\pctonics.com" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{4C7CA6F1-4691-449D-B574-559726CDA825}_is1" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\pctonics.com" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FeatureUsage\AppSwitched" /v "{6D809377-6AF0-444B-8957-A3773F02200E}\Driver Tonic\dtn.exe" /f
reg delete "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /v "C:\Program Files\Driver Tonic\dtn.exe" /f
REM レジストリの削除
SCHTASKS /Delete /TN "Driver Tonic_Logon" /f
REM タスクから自動起動を削除
net start PcaSvc
REM サービスの再開
del "%~f0"
REM 自分自身を消去
