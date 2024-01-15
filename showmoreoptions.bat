echo off
color a
title Show More Options Context Menu
cls
echo [1] Enable
echo [2] Restore old settings
CHOICE /C:12 /N
IF ERRORLEVEL 2 GOTO restore
IF ERRORLEVEL 1 GOTO enable
GOTO end
:enable
reg.exe add "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
taskkill /f /im explorer.exe
start explorer.exe
exit
:restore
reg.exe delete "HKCU\Software\Classes\CLSID\{86ca1aa0-34aa-4e8b-a509-50c905bae2a2}\InprocServer32" /f
taskkill /f /im explorer.exe
start explorer.exe
exit
:end
exit
