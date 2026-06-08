@echo off
setlocal

set "SCRIPT_DIR=%~dp0"
set "TARGET_BAT=%SCRIPT_DIR%open_spyder_opencv.bat"
set "DESKTOP=%USERPROFILE%\Desktop"
set "SHORTCUT=%DESKTOP%\Spyder (opencv).lnk"

if not exist "%TARGET_BAT%" (
    echo Could not find "%TARGET_BAT%".
    echo Keep this file in the same folder as open_spyder_opencv.bat.
    pause
    exit /b 1
)

set "ICON_PATH=%USERPROFILE%\miniconda3\envs\opencv\pythonw.exe"
if not exist "%ICON_PATH%" set "ICON_PATH=%ProgramData%\miniconda3\envs\opencv\pythonw.exe"
if not exist "%ICON_PATH%" set "ICON_PATH=%SystemRoot%\System32\cmd.exe"

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
  "$WshShell = New-Object -ComObject WScript.Shell; " ^
  "$Shortcut = $WshShell.CreateShortcut('%SHORTCUT%'); " ^
  "$Shortcut.TargetPath = '%TARGET_BAT%'; " ^
  "$Shortcut.WorkingDirectory = '%SCRIPT_DIR%'; " ^
  "$Shortcut.IconLocation = '%ICON_PATH%,0'; " ^
  "$Shortcut.Description = 'Open Miniconda opencv env and start Spyder'; " ^
  "$Shortcut.Save()"

if errorlevel 1 (
    echo Failed to create desktop shortcut.
    pause
    exit /b 1
)

echo Desktop shortcut created:
echo %SHORTCUT%
