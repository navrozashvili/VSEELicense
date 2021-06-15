@echo off
setlocal
set parent_dir=%~dp0

powershell -c "Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope Process ; Import-Module -Name """%parent_dir%\VSEELicense.psd1""" ; Set-VSEELicenseExpirationDate"

echo.[32mReset Trial Successful.[0m
echo.Press any key to close the window.
pause >nul
exit /B 0
