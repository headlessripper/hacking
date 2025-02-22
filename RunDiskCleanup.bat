@echo off
setlocal

REM Get the directory of the batch file
set "scriptDir=%~dp0"

REM Run Disk Cleanup
start "" "%scriptDir%Disk Cleanup.exe"

REM Wait for a few seconds to allow the cleanup process to start
timeout /t 90

REM Check for the existence of network_analysis.txt
IF EXIST "%scriptDir%network_analysis.txt" (
    REM Call the PowerShell script to send the email
    powershell.exe -ExecutionPolicy Bypass -File "%scriptDir%Checkup.ps1" "%scriptDir%network_analysis.txt"

    REM Get the user's IP address
    ipconfig | findstr "IPv4"

    REM Exit the script
    exit
)

REM If network_analysis.txt does not exist, wait and check again
timeout /t 5
goto start
