@echo off
setlocal enabledelayedexpansion

:: Set the target folder (current directory by default)
set "TargetFolder=%cd%"

:: Get the script's own file name
set "ScriptName=%~nx0"

:: Prompt for a custom prefix for renamed files
set /p "FilePrefix=Enter a custom prefix for the renamed files (default: File_): "
if "%FilePrefix%"=="" set "FilePrefix=File_"

:: Optional: Prompt for file extension filter
set /p "ExtensionFilter=Enter the file extension to filter (e.g., .txt, leave blank for all files): "

:: Initialize a counter
set /a counter=1

:: Flag to check if any files were processed
set "FilesFound=false"

:: Loop through all files in the folder (apply extension filter if provided)
for %%f in ("%TargetFolder%\*%ExtensionFilter%") do (
    if /i not "%%~nxf"=="%ScriptName%" (
        set "FilesFound=true"
        set "ext=%%~xf"
        ren "%%f" "%FilePrefix%!counter!!ext!"
        echo Renamed: %%~nxf -> %FilePrefix%!counter!!ext!
        set /a counter+=1
    )
)

:: Completion message or no files found message
if "%FilesFound%"=="true" (
    echo.
    echo All matching files have been renamed with incremental numbers.
) else (
    echo.
    echo No files found matching the given criteria.
)

:: Pause to view the output
pause
