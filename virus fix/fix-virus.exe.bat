@echo off
echo This is a fix file that will fix the virus (virus.exe) made by libao.
echo If this virus.exe hasn't made any damage to your computer, you don't need to run this .bat file.
echo ---------------------------------------------------
echo ------------------made by libao--------------------
echo https://github.com/li-bao/virus-by-libao
echo ---------------------------------------------------
echo.

set /p confirm="Are you sure you want to run the fix? (Yes/No): "
if /i not "%confirm%"=="Yes" (
    echo Repair process canceled.
    pause
    exit
)

echo Starting the repair process...

:: Restore Task Manager
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t REG_DWORD /d 0 /f
echo Restoring Task Manager...

:: Restore cmd
reg add "HKCU\Software\Policies\Microsoft\Windows\System" /v DisableCMD /t REG_DWORD /d 0 /f
echo Restoring cmd...

:: Restore regedit
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t REG_DWORD /d 0 /f
echo Restoring regedit...

:: Restore gpedit.msc
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoGpedit /t REG_DWORD /d 0 /f
echo Restoring gpedit.msc...

:: Restore access to all drives
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoViewOnDrive /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoDrives /f
echo Restoring access to all drives...

:: Delete the auto-start batch file
if exist "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\WinUpdate.bat" (
    del "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\WinUpdate.bat"
    echo Deleting auto-start batch file...
)

:: Delete all files in shell:startup folder
set startup_folder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup
for %%f in ("%startup_folder%\*") do (
    del "%%f" /q
)
echo Deleting all files in shell:startup folder...

:: Delete copied files from the desktop
for %%f in ("%USERPROFILE%\Desktop\copy_*.exe") do (
    del "%%f"
)
echo Deleting copied files from the desktop...

echo Repair process completed!
pause
