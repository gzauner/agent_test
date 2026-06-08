@echo off
setlocal

set "CONDA_ACTIVATE=%USERPROFILE%\miniconda3\Scripts\activate.bat"
if not exist "%CONDA_ACTIVATE%" set "CONDA_ACTIVATE=%ProgramData%\miniconda3\Scripts\activate.bat"

if not exist "%CONDA_ACTIVATE%" (
    echo Could not find Miniconda activation script.
    echo Update CONDA_ACTIVATE in this file to match your installation path.
    pause
    exit /b 1
)

call "%CONDA_ACTIVATE%" opencv
if errorlevel 1 (
    echo Failed to activate the "opencv" environment.
    pause
    exit /b 1
)

start "" spyder
