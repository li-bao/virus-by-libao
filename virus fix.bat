@echo off
echo (If you see this message that means your computer is not altered by CDM.exe. You dont need to run this)
echo The file need Administrators
echo This .bat file is intended to restore system settings altered by CDM.exe.
echo If your computer was affected by virus.exe, you can use this file to revert changes.
echo ---------------------------------------------------------
echo GitHub: https://github.com/li-bao/virus-by-libao
echo Download link: https://github.com/li-bao/virus-by-libao/releases/tag/3.0
echo Created by: libao
echo ---------------------------------------------------------
echo Are you sure you want to proceed with the repair?
echo Y (yes) or N (no)
set /p choice=

if /i "%choice%" NEQ "Y" (
    echo Exiting without making changes.
    exit /b
)

echo Re-enabling Task Manager...
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /f

echo Re-enabling Command Prompt...
REG DELETE HKCU\Software\Policies\Microsoft\Windows\System /v DisableCMD /f

echo Re-enabling Registry Editor...
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /f

echo Resetting file associations for .exe and .bat files...
assoc .exe=exefile
assoc .bat=batfile

echo Removing restrictions on Run command...
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoRun /f

echo Allowing drive access...
REG DELETE HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewOnDrive /f

echo Reverting Group Policy restrictions...
REG DELETE HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoGpedit /f

echo All changes have been reverted. Press enter to restart your computer for all changes to take effect.
pause
shutdown /r /t 00
pause
